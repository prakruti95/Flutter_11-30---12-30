import 'package:flutter/material.dart';

class RadioEx extends StatefulWidget {
  const RadioEx({super.key});

  @override
  State<RadioEx> createState() => _RadioExState();
}
enum MySite {w3schools,tutorialspoint,javatpoint}
class _RadioExState extends State<RadioEx>
{
    MySite _mysite = MySite.w3schools;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Data"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                   ListTile
                     (
                        leading: Radio(value: MySite.w3schools,onChanged:(value)
                        {
                          setState(() {
                            _mysite = value!;
                          });

                        },groupValue:_mysite,),
                      title: Text("W3schools"),),
                  ListTile
                    (
                    leading: Radio(value: MySite.tutorialspoint,onChanged:(value)
                    {
                      setState(() {
                        _mysite = value!;
                      });
                    },groupValue:_mysite,),
                    title: Text("tutorialspoint"),
                  ),

                  ListTile
                    (
                    leading: Radio(value: MySite.javatpoint,onChanged:(value)
                    {
                      setState(() {
                        _mysite = value!;
                      });
                    },groupValue:_mysite,),
                    title: Text("javatpoint"),
                  )
                ],
              ),
          ),
      );
  }
}
