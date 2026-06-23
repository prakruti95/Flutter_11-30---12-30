import 'package:flutter/material.dart';

class MyScreen4 extends StatelessWidget
{
  const MyScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container
      (
        child: Column(children:
        [
          Text("Powered By Flutter",style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold),)
        ],),
      );
  }
}
