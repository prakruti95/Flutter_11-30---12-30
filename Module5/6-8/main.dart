import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Json data"),),
      body: FutureBuilder
        (
          future: getdata(),
          builder: (context,snapshot)
          {
              if(snapshot.hasError)
              {
                print("Network not found");
              }
              if(snapshot.hasData)
              {
                return Model(list:snapshot.data);
              }

              return CircularProgressIndicator();
          }
        ),
    );
  }

   getdata() async
  {
    var url = "https://prakrutitech.xyz/hiren/viewproducts.php";
    var url2=Uri.parse(url);
    var resp = await http.get(url2);
    return jsonDecode(resp.body);
  }
}

