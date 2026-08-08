import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
class EditScreen extends StatefulWidget
{
  var id;
  var pname;
  var pprice;
  var pdes;

  EditScreen({required this.id,required this.pname,required this.pprice,required this.pdes});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>
{

  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  @override
  void initState()
  {
      pname.text = widget.pname;
      pprice.text = widget.pprice;
      pdes.text = widget.pdes;

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Edit : ${widget.id}"),),
        body: Center
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

                updatedata(pn,pp,pd,widget.id);
              }, child: Text("Add"))
            ],
          ),
        ),
      );
  }

  void updatedata(String pn, String pp, String pd, id)async
  {
    var resp = await http.post(Uri.parse("https://prakrutitech.xyz/hiren/updateproduct.php"),body:
    {
      "id":id,
      "product_name":pn,
      "product_price":pp,
      "product_des":pd
    });

    print(resp.toString());
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyApp()));
  }
}
