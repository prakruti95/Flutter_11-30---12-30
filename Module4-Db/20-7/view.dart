import 'package:flutter/material.dart';
import 'package:sqfliteex1/dbhelper.dart';

class ViewData extends StatefulWidget
{
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData>
{
  late Dbhelper dbhelper = Dbhelper();

  @override
  void initState()
  {
    dbhelper.open();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(),
      );
  }
}
