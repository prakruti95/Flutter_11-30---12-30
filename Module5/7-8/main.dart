import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add.dart';
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
  late Future dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getdata();
  }

  Future<void> _refresh() async {
    setState(() {
      dataFuture = getdata();
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Json data"),),
      body: FutureBuilder
        (
          future: dataFuture,
          builder: (context,snapshot)
          {
              if(snapshot.hasError)
              {
                print("Network not found");
              }
              if(snapshot.hasData)
              {
                return Model(list:snapshot.data, onRefresh: _refresh);
              }

              return Center(child: CircularProgressIndicator());
          }
        ),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Adddata()));
      },child: Icon(Icons.add),),
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
