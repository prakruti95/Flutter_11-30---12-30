import 'package:demo1/page1.dart';
import 'package:demo1/page2.dart';
import 'package:demo1/page3.dart';
import 'package:demo1/page4.dart';
import 'package:flutter/material.dart';


class Mypageview extends StatefulWidget
{
  const Mypageview({super.key});

  @override
  State<Mypageview> createState() => _MypageviewState();
}

class _MypageviewState extends State<Mypageview>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Page View Example"),),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center
            (
              child: Column
                (
                  children:
                  [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                      child: MaterialButton(
                        onPressed: ()
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageViewTest1()));
                        },
                        child: Text(
                          'PageView Example',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.amber[800],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageViewBuild()));
                        },
                        child: Text(
                          'PageView.builder Example',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.orange[900],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageViewCustom()));
                        },
                        child: Text(
                          'PageView.custom Example',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomizedPageView()));
                        },
                        child: Text(
                          ' Customized PageView',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green[800],
                      ),
                    ),
                  ],
                ),
            ),
        ),
      );
  }
}
