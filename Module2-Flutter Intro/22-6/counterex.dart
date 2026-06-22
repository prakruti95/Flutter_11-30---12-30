import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget
{

  int count =0;

  @override
  Widget build(BuildContext context)
  {
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
                     // setState(() {
                        count++;
                      //});
                        print(count);
                    }, child: Text("Click Me"))

                ],
              ),
          ),
      );
  }

}