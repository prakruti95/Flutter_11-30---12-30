import 'dart:io';

import 'package:demo1/screen1.dart';
import 'package:demo1/screen2.dart';
import 'package:demo1/test.dart';
import 'package:demo1/uploaddata.dart';
import 'package:demo1/widgetex.dart';
import 'package:demo1/xyz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_screen.dart';
import 'mypageview.dart';

// void main()
// {
//   //runApp(MaterialApp(home:MyData()));
//   runApp(MaterialApp(home:XYZ()));
// }

void main()
{
  if (Platform.isIOS)
  {
    runApp(PGVCLAppMaterial());


  }
  else
  {
    runApp(PGVCLAppCupertino());
  }
  //runApp(app)
  //runApp(MyApp21());
  //runApp(MaterialApp(home:MyApp2()));
}
