import 'dart:async';

import 'package:firstproject/task2/formex.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget 
{
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
{
  @override
  void initState() {
    Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FormEx())));
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
      (
        body: Center
          (
            //child: Image.asset("assets/a.png"),
            child:Lottie.asset('assets/abcd.json'),
        ),
      );
  }
}
