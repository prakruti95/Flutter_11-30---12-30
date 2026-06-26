import 'package:flutter/material.dart';

class Staticlist extends StatefulWidget {
  const Staticlist({super.key});

  @override
  State<Staticlist> createState() => _StaticlistState();
}

class _StaticlistState extends State<Staticlist>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Static List"),),
        body: Center
          (
            child: ListView
              (
                children:
                        [
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.eighteen_mp),
                            title: Text("ABCD"),
                          ),
                          ListTile
                            (
                            leading: Icon(Icons.ten_k_outlined),
                            title: Text("PQRS"),
                          )

                        ],
                      ),


          ),
      );
  }
}
