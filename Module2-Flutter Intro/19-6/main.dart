import 'package:flutter/material.dart';

void main() 
{
  runApp(MaterialApp(home:FirstScreen()));
}
class FirstScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("MyApp"),backgroundColor: Colors.blue,),
        body: SingleChildScrollView(
          child: Center
            (
              child:Column
                (
                  children:
                  [
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Yogesh",style: TextStyle(fontSize: 20.00),),
                    Text("Hiren",style: TextStyle(fontSize: 20.00),),
          
                  ],
                )
          
            ),
        ),
      );
  }
}