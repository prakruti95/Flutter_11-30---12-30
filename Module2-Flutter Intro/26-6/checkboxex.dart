import 'package:flutter/material.dart';

class CheckBoxEx extends StatefulWidget {
  const CheckBoxEx({super.key});

  @override
  State<CheckBoxEx> createState() => _CheckBoxExState();
}

class _CheckBoxExState extends State<CheckBoxEx>
{
    bool first=false;
    bool sec=false;
    bool third=false;

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
                    CheckboxListTile(value: first, onChanged:(value)
                    {
                        setState(() {
                          this.first=value!;
                        });
                    },title: Text("A"),),
                  CheckboxListTile(value: sec, onChanged:(value)
                  {
                    setState(() {
                      this.sec=value!;
                    });
                  },title: Text("B")),
                  CheckboxListTile(value: third, onChanged:(value)
                  {
                    setState(() {
                      this.third=value!;
                    });
                  },title: Text("C"))

                ],
              ),
          ),
      );
  }
}
