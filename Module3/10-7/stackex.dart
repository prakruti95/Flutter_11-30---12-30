import 'package:flutter/material.dart';

class StackEx extends StatefulWidget
{
  const StackEx({super.key});

  @override
  State<StackEx> createState() => _StackExState();
}

class _StackExState extends State<StackEx>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(),
        body: Stack
          (
            children:
            [

                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdOuEdroyRsFDVGMiRCgKMtH7d_UE4vG6iuA&s"),
              Text("Welcome to tops",style: TextStyle(fontSize: 20.00),)
                
            ],
          ),
      );
  }
}
