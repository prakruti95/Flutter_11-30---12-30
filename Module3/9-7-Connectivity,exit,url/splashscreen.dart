import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
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
    checkconnectivity();
    //Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FormEx())));
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

  checkconnectivity()async
  {
    var connection = await Connectivity().checkConnectivity();
    print("My data: $connection");
    if(connection.contains(ConnectivityResult.mobile))
    {
      Timer(Duration(seconds: 2), () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormEx())));

      //print("Mobile Data");
    }
    else if(connection.contains(ConnectivityResult.wifi))
    {
      Timer(Duration(seconds: 2), () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormEx())));

      //print("Wifi Data");
    }
    else
    {
      //Alert
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet is not connected")));
      showalert();
    }
  }

  showalert()
  {
      showDialog(context: context,
          builder:(context)
          {
            return AlertDialog(title: Text("Internet is not connected"),content: Text("Check Internet"),actions:
            [
              ElevatedButton(onPressed: ()
              {
                exit(0);
              }, child: Text("EXIT"))
            ],);
          });

  }
}
