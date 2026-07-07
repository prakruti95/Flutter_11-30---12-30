import 'package:flutter/material.dart';

import 'bottom.dart';

void main()
{
  runApp(MaterialApp(home:BottomEx()));
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
    return Scaffold
      (
        appBar: AppBar(),
        body: Center(),
        drawer: Drawer
          (
            child: ListView
              (
                padding: EdgeInsets.zero,
                children: <Widget>
                [
                  UserAccountsDrawerHeader(
                    accountName: Text("Abhishek Mishra"),
                    accountEmail: Text("abhishekm977@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home), title: Text("Home"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings), title: Text("Settings"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts), title: Text("Contact Us"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                ]
            ),
          ),
      );
  }
}
