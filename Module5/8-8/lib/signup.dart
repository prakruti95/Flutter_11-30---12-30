import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex/signin.dart';

import 'main.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>
{
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Signup"),),
      body:  Center
        (
        child: Column
          (
          children:
          [
            TextFormField(controller:name,decoration: InputDecoration(hintText: "Enter Name"),),
            SizedBox(height: 10,),
            TextFormField(controller:surname,decoration: InputDecoration(hintText: "Enter Surname"),),
            SizedBox(height: 10,),
            TextFormField(controller:email,decoration: InputDecoration(hintText: "Enter Email"),),
            SizedBox(height: 10,),
            TextFormField(controller:pass,decoration: InputDecoration(hintText: "Enter Password"),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              String n = name.text.toString();
              String s = surname.text.toString();
              String e = email.text.toString();
              String p = pass.text.toString();

              signup(n,s,e,p);
            }, child: Text("signup")),
            TextButton(onPressed: ()
            {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Signin()));
            }, child: Text("Do you want to Signin?"))

          ],
        ),
      ),
    );
  }

  void signup(String n, String s, String e, String p)async
{
  var resp = await http.post(Uri.parse("https://prakrutitech.xyz/hiren/signup.php"),body:
  {
    "name":n,
    "surname":s,
    "email":e,
    "password":p
  });

  print(resp.toString());
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Signin()));
}
}


