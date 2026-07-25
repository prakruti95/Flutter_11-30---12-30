import 'package:flutter/material.dart';
import 'package:sqfliteex1/view.dart';

import 'dbhelper.dart';

class AddData extends StatefulWidget
{
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData>
{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late Dbhelper dbhelper = Dbhelper();
  @override
  void initState() {
    // TODO: implement initState
    dbhelper.open();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Add Data"),),
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

                      String n = name.text.toString();
                      String e = email.text.toString();
                      String p = pass.text.toString();

                      dbhelper.db.rawInsert("insert into students (name,email,password)values(?,?,?)",[n,e,p]);
                      print("Inserted");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewData()));

                    }, child: Text("Add"))

                ],
              ),
          ),
      );
  }
}
