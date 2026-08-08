import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> 
{
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text("Add data"),),
        body:  Center
            (
              child: Column
                (
                  children:
                  [
                      TextFormField(controller:pname,decoration: InputDecoration(hintText: "Enter Product Name"),),
                      SizedBox(height: 10,),
                      TextFormField(controller:pprice,decoration: InputDecoration(hintText: "Enter Product Price"),),
                      SizedBox(height: 10,),
                      TextFormField(controller:pdes,decoration: InputDecoration(hintText: "Enter Product Description"),),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: ()
                      {
                          String pn = pname.text.toString();
                          String pp = pprice.text.toString();
                          String pd = pdes.text.toString();

                            adddata(pn,pp,pd);
                          }, child: Text("Add"))
                  ],
                ),
            ),
      );
  }

  void adddata(String pn, String pp, String pd) async
  {
     var resp = await http.post(Uri.parse("https://prakrutitech.xyz/hiren/insertproduct.php"),body:
      {
         "product_name":pn,
         "product_price":pp,
         "product_des":pd
      });

     print(resp.toString());
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyApp()));
  }
}
