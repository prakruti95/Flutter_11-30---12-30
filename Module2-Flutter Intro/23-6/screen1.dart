import 'package:firstproject/task1/screen2.dart';
import 'package:firstproject/task1/screen3.dart';
import 'package:firstproject/task1/screen4.dart';
import 'package:firstproject/task1/screen5.dart';
import 'package:flutter/material.dart';

class ComboScreen extends StatelessWidget
{
  const ComboScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Task 1"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                      MyScreen1(),
                      SizedBox(height: 10,),
                      MyScreen2(),
                      SizedBox(height: 10,),
                      MyScreen3(),
                      SizedBox(height: 10,),
                      MyScreen4()
                ],
              ),
          ),
      );
  }
}
