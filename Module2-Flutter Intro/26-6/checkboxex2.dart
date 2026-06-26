import 'package:flutter/material.dart';

class CheckBoxEx2 extends StatefulWidget {
  const CheckBoxEx2({super.key});

  @override
  State<CheckBoxEx2> createState() => _CheckBoxExState2();
}

class _CheckBoxExState2 extends State<CheckBoxEx2>
{
    bool first=false;
    bool sec=false;
    bool third=false;
    int amount = 0;

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
                          amount+=100;
                        });
                    },title: Text("Pizza - Rs.100"),),
                  CheckboxListTile(value: sec, onChanged:(value)
                  {
                    setState(() {
                      this.sec=value!;
                      amount+=70;
                    });
                  },title: Text("Burger - Rs.70")),
                  CheckboxListTile(value: third, onChanged:(value)
                  {
                    setState(() {
                      this.third=value!;
                      amount+=120;
                    });
                  },title: Text("Coffee - Rs.120")),
                  ElevatedButton(onPressed: ()
                  {
                    print("total $amount");
                  }, child: Text("Order"))

                ],
              ),
          ),
      );
  }
}
