import 'package:flutter/material.dart';

class MyScreen1 extends StatelessWidget
{
  const MyScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container
        (
            color: Colors.blue.shade50,
            height: 100,
            padding: EdgeInsets.all(16.0),
            child: Row
              (
                children:
                [
                    SizedBox(width: 20,),
                    CircleAvatar(backgroundImage: NetworkImage("https://yt3.googleusercontent.com/MHTwB2uD9JCbsZYOhU5MCdZ-8V-f3WQKB0sDqtqmn9ZFBrJTrDaPGkDBKGUjBOR2LMRwj1C_-Q=s900-c-k-c0x00ffffff-no-rj",),radius: 40,),
                    SizedBox(width: 16),
                    Column
                      (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [

                          Text("John Doe",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.00),),
                          Text("Flutter Developer"),
                        ],
                      ),

                ],
              ),
        ),
    );
  }
}
