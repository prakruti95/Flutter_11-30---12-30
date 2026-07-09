import 'package:firstproject/task2/second.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FormEx extends StatefulWidget {
  const FormEx({super.key});

  @override
  State<FormEx> createState() => _FormExState();
}

class _FormExState extends State<FormEx> {
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(title: Text("My Form"),actions:
        [
          IconButton(onPressed: ()
          {
            callme("9106493491");
          }, icon: Icon(Icons.call))
        ],),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (email.text.isEmpty) {
                      return "Please Enter Email";
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: pass,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (pass.text.isEmpty) {
                      return "Please Enter Password";
                    }
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: ()
                  {
                    String a = email.text.toString();
                    String b = pass.text.toString();
                    if(_formkey.currentState!.validate())
                      {
                        if (b == "1234") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Logged in Successfully")),
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Second(email:a)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Credentials are not correct")),
                          );
                        }
                      }

                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  callme(var num)async
  {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: num,
    );
    await launchUrl(launchUri);
  }
}
