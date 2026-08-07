import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex/main.dart';
class Model extends StatelessWidget
{
  final List list;
  final RefreshCallback onRefresh;

  Model({Key? key, required this.list, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder
        (
          itemCount: list.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context,index)
          {
              return ListTile
                (
                    title: Text(list[index]["product_name"]),
                    subtitle: Text(list[index]["product_price"]),
                    trailing: Wrap(children:
                    [
                      IconButton(onPressed: ()
                      {

                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: ()
                      {
                          deletedata(context,list[index]["id"]);
                      }, icon: Icon(Icons.delete)),
                    ],),
                );
          }
        ),
    );
  }

  void deletedata(BuildContext context, id)
  {
      print("My id is : $id");
      var resp = http.post(Uri.parse("https://prakrutitech.xyz/hiren/deleteproduct.php"),body:
      {
        "id":id
      });
      //print(resp.);
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyApp()));
  }
}
