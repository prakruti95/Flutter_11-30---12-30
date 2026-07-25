import 'package:flutter/material.dart';
import 'package:sqfliteex1/view.dart';

import 'dbhelper.dart';

class EditScreen extends StatefulWidget
{
  var n,e,p;
  EditScreen({required this.n,required this.e,required this.p});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>
{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late Dbhelper dbhelper = Dbhelper();
  @override
  void initState()
  {
    // TODO: implement initState
    dbhelper.open();
    name.text = widget.n;
    email.text = widget.e;
    pass.text = widget.p;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Edit Data ${widget.e}"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                    TextFormField(decoration: InputDecoration(hintText: "Enter Name"),controller: name,),
                    SizedBox(height: 10,),
                    TextFormField(decoration: InputDecoration(hintText: "Enter Email"),controller: email,),
                    SizedBox(height: 10,),
                    TextFormField(decoration: InputDecoration(hintText: "Enter Password"),controller: pass,),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: ()
                    {

                      String n1 = name.text.toString();
                      String e1 = email.text.toString();
                      String p1 = pass.text.toString();

                      dbhelper.db.rawUpdate("update students set name=?,email=?,password=? where email=?",[n1,e1,p1,widget.e]);
                      print("Updated ");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewData()));

                    }, child: Text("Update"))

                ],
              ),
          ),
      );
  }
}
