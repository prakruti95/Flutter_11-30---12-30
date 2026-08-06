import 'package:flutter/material.dart';

class Model extends StatelessWidget
{
  var list;
  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
        itemCount: list.length,
        itemBuilder: (context,index)
        {
            return ListTile
              (
                  title: Text(list[index]["product_name"]),
                  subtitle: Text(list[index]["product_price"]),
              );
        }
      );
  }
}
