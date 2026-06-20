import 'package:firstproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
      return Scaffold
        (
          appBar: AppBar(title: Text("Screen 1"),backgroundColor: Colors.orange,),
          body: SingleChildScrollView(
            child: Center
              (
                child: Column
                  (
                    children: 
                    [
                        Image.asset("assets/a.png",width:100,height: 100,),
                        SizedBox(height: 10,),
                        Text("Image 1",style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      Image.network("https://flutter.dev/assets/lockup_flutter_vertical.7e432d07dc23bc4f2c04fbaac8d8670e.png",width:100,height: 100,),
                      SizedBox(height: 10,),
                      Text("Image 1",style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      Image.asset("assets/a.png",width:100,height: 100,),
                      SizedBox(height: 10,),
                      Text("Image 1",style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      Image.asset("assets/a.png",width:100,height: 100,),
                      SizedBox(height: 10,),
                      Text("Image 1",style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      Image.asset("assets/a.png",width:100,height: 100,),
                      SizedBox(height: 10,),
                      Text("Image 1",style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      ElevatedButton(onPressed: ()
                      {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => FirstScreen()));
                      }, child: Text("Submit"),)
                      
                    ],
                  ),
              ),
          ),
        );
  }
  
}