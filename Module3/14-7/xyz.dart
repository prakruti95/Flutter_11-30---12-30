import 'package:demo1/intro_screen.dart';
import 'package:flutter/material.dart';

class XYZ extends StatefulWidget {
  const XYZ({super.key});

  @override
  State<XYZ> createState() => _XYZState();
}

class _XYZState extends State<XYZ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Data"),),
      );
  }
}
