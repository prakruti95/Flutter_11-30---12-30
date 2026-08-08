import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex/signup.dart';

import 'main.dart';
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin>
{

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Signin"),),
      body:  Center
        (
        child: Column
          (
          children:
          [

            TextFormField(controller:email,decoration: InputDecoration(hintText: "Enter Email"),),
            SizedBox(height: 10,),
            TextFormField(controller:pass,decoration: InputDecoration(hintText: "Enter Password"),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {

              String e = email.text.toString();
              String p = pass.text.toString();

              signin(e,p);
            }, child: Text("signin")),
            TextButton(onPressed: ()
            {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Signup()));
            }, child: Text("Do you want to signup?"))

          ],
        ),
      ),
    );
  }

  void signin(String e, String p)async
  {
    var resp = await http.post(Uri.parse("https://prakrutitech.xyz/hiren/signin.php"),
        body:
      {

        "email":e,
        "password":p
    });

    var data = json.decode(resp.body);
    if(data==0)
    {
      print("Login Fail");
    }
    else
    {
      print("Login Success");
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyApp()));

    }
  }
}


