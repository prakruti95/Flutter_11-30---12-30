import 'package:flutter/material.dart';
class Second extends StatefulWidget
{
  var email;
  Second({required this.email});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Welcome ${widget.email}"),),);
  }
}
