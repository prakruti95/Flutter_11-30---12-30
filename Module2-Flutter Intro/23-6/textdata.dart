import 'package:flutter/material.dart';

class Textdata extends StatefulWidget {
  const Textdata({super.key});

  @override
  State<Textdata> createState() => _TextdataState();
}

class _TextdataState extends State<Textdata>
{
  TextEditingController d1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text("Hello"),),
        body: Center
          (
            child: Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child:
                    TextField(decoration: InputDecoration(hintText: "Enter Your Amount",border: OutlineInputBorder()),controller: d1,),

                  ),
                  ElevatedButton(onPressed: ()
                  {
                    String a1 = d1.text.toString();
                    print(a1);
                  }, child: Text("OK"))

              ],
            ),
          ),
      );
  }
}
