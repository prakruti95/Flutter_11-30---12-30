import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class A1 extends StatefulWidget
{
  @override
  topsState createState() => topsState();



}

class topsState extends State<A1>
{
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Counter Example"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            Text("Counter Value : $count"),

            ElevatedButton(onPressed: ()
            {
              setState(() {
                count++;
              });

              print(count);
            }, child: Text("Click Me"))

          ],
        ),
      ),
    );
  }

}
