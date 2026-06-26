import 'package:flutter/material.dart';

class Dynamiclist extends StatefulWidget {
  const Dynamiclist({super.key});

  @override
  State<Dynamiclist> createState() => _DynamiclistState();
}

class _DynamiclistState extends State<Dynamiclist>
{

  var iconlist = [Icons.ten_k_outlined,Icons.person,Icons.ten_k_outlined,Icons.person,Icons.ten_k_outlined,Icons.person,Icons.ten_k_outlined,Icons.person,Icons.ten_k_outlined,Icons.person,Icons.ten_k_outlined,Icons.person];
  var titlelist=["abcd","pqrs","abcd","pqrs","abcd","pqrs","abcd","pqrs","abcd","pqrs","abcd","pqrs"];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Dynamic List"),),
      body: Center
        (
        child: ListView.builder(
            itemBuilder: (context,index)
          {
            return ListTile
              (
                leading: Icon(iconlist[index]),
                title: Text(titlelist[index]),
              );
          },itemCount: titlelist.length,)


      ),
    );
  }
}
