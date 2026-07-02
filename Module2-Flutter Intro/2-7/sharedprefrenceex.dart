import 'package:flutter/material.dart';
import 'package:paymentex/uicontrols.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget
{
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
{
  late SharedPreferences sharedPreferences;
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
  late bool newuser;
  @override
  void initState()
  {
    checkvalue();
  }

  @override
  Widget build(BuildContext context)
  {
      return Scaffold
      (
      appBar: AppBar(title: Text("Login Screen"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            TextField(controller:uname,decoration: InputDecoration(hintText: "Enter Username"),),
            SizedBox(height: 10,),
            TextField(controller:pass,decoration: InputDecoration(hintText: "Enter Password"),obscureText: true,),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              String u = uname.text.toString();
              String p = pass.text.toString();

              sharedPreferences.setBool("tops", false);
              sharedPreferences.setString("uname", u);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));

            }, child: Text("Login"))


          ],
        ),
      ),
    );
  }

  void checkvalue()async
  {

    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool("tops")??true;
    if(newuser==false)
      {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));
      }
  }
}
