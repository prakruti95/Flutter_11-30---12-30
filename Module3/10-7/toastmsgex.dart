import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastmsg extends StatefulWidget
{
  const Toastmsg({super.key});

  @override
  State<Toastmsg> createState() => _ToastmsgState();
}

class _ToastmsgState extends State<Toastmsg>
{
  var image = ["https://thumbs.dreamstime.com/b/incredibly-beautiful-sunset-sun-lake-sunrise-landscape-panorama-nature-sky-amazing-colorful-clouds-fantasy-design-115177001.jpg","https://png.pngtree.com/background/20250207/original/pngtree-soft-pastel-floral-design-light-blue-background-picture-image_16257054.jpg","https://i0.wp.com/picjumbo.com/wp-content/uploads/picjumbo-premium-watercolor-backgrounds-30.jpeg?w=600&quality=80","https://i0.wp.com/picjumbo.com/wp-content/uploads/picjumbo-premium-watercolor-backgrounds-30.jpeg?w=600&quality=80","https://i0.wp.com/picjumbo.com/wp-content/uploads/picjumbo-premium-watercolor-backgrounds-30.jpeg?w=600&quality=80"];
  var text12 = ["A","B","C","D","E"];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Toast Message"),),
        body: Center
          (
            child: Column
              (
                children:
                [

                    Expanded(
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index)
                      {
                        return ListTile
                          (
                            leading: Image.network(image[index]),
                            title: Text(text12[index]),);
                          },itemCount:image.length),
                    ),

                    ElevatedButton(onPressed: ()
                    {
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }, child: Text("Click Me"))

                ],
              ),
          ),
      );
  }
}
