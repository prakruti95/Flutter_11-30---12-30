import 'package:flutter/material.dart';
import 'package:sqfliteex1/dbhelper.dart';

import 'add.dart';
import 'edit.dart';

class ViewData extends StatefulWidget
{
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData>
{
  late Dbhelper dbhelper = Dbhelper();
  List<Map> slist = [];
  @override
  void initState()
  {
    dbhelper.open();
    getdata();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("View Data"),),
        body: Center
          (
          child: SingleChildScrollView(
            child: Column
              (
                children:slist.map((tops)
                {
            
                  return Card
                    (
                      child: ListTile
                        (
                        leading:Icon(Icons.person),
                        title: Text(tops["name"]),
                        subtitle:Text(tops["email"]),
                        trailing: Wrap(children:
                        [
                          IconButton(onPressed: ()
                          {
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => EditScreen(n:tops["name"],e:tops["email"],p:tops["password"])));
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: ()
                          {
                                dbhelper.db.rawDelete("delete from students where email =?",[tops["email"]]);
                          }, icon: Icon(Icons.delete))
                        ],),
                      )
                  );
                }).toList()
            
            ),
          ),),
    floatingActionButton: FloatingActionButton(onPressed: ()
    {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddData()));
    },child: Icon(Icons.add),));
  }

  getdata()
  {
    Future.delayed(Duration(milliseconds: 500),()async
    {
      slist = await dbhelper.db.rawQuery('SELECT * FROM students');
      setState(()
      {

      });
    });
  }
}
