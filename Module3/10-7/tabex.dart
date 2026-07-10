import 'package:flutter/material.dart';

class TabEx extends StatefulWidget 
{
  const TabEx({super.key});

  @override
  State<TabEx> createState() => _TabExState();
}

class _TabExState extends State<TabEx> 
{
  @override
  Widget build(BuildContext context) 
  {
    return
      DefaultTabController
        (
          length: 3,
          child: Scaffold(appBar: AppBar
            (
            bottom: TabBar
              (
              tabs:
              [
            Tab(icon: Icon(Icons.directions_car),text: "A",),
            Tab(icon: Icon(Icons.directions_transit),text: "B",),
            Tab(icon: Icon(Icons.directions_bike),text: "C",),

    ]),),

          body: Center
            (
            child: Column(children:
            [
                GestureDetector(child: Text("Yogesh"),onTap: (){},),
                InkWell(child: Text("Hiren"),onTap: (){},),

            ],),
              ),
          ));
  }
}
