import 'package:flutter/material.dart';

class MyScreen2 extends StatefulWidget {
  const MyScreen2({super.key});

  @override
  State<MyScreen2> createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2>
{
  int likes=0;

  @override
  Widget build(BuildContext context) {
    return Container
      (
      child: Column
        (
        children:
        [
          Text("Like : $likes"),

          ElevatedButton(onPressed: ()
          {
            setState(() {
              likes++;
            });

            print(likes);
          }, child: Text("Like"))

        ],
      ),
      );
  }
}
