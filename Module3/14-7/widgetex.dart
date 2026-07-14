import 'package:flutter/material.dart';

class MyData extends StatefulWidget
{
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Data"),),
        body: Center
          (
            child: Column
              (
              children:
              [

                ExpansionTile(
                  title: Text("What is Flutter?"),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Flutter is UI toolkit by Google."),
                    )
                  ],
                ),

                Chip(
                  label: Text("Flutter"),
                  avatar: Icon(Icons.code),
                ),

              ],
              ),
          ),
      );
  }
}
