import 'package:flutter/material.dart';

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData>
{

  @override
  Widget build(BuildContext context)
  {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;
    return Scaffold(appBar: AppBar(title: Text('Hello'),),body: Center
      (
        child: Container
          (
            child: ElevatedButton(onPressed: ()
            {
              print("data:");
              print("$sizew");
              print("$sizeh");
            }, child: Text("OK"),),
            width: sizew,
            height: sizeh,


          )

      ),);
  }
}
