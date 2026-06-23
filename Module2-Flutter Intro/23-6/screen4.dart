import 'package:flutter/material.dart';

class MyScreen3 extends StatefulWidget {
  const MyScreen3({super.key});

  @override
  State<MyScreen3> createState() => _MyScreen3State();
}

class _MyScreen3State extends State<MyScreen3>
{
  bool _isHappy = true;
  @override
  Widget build(BuildContext context) {
    return Container
      (
        child: Column(
          children: [
            Text('Current Mood:', style: TextStyle(fontSize: 18)),
            Text
              (
              _isHappy ? '😊 Happy' : '😔 Sad',
              style: TextStyle(fontSize: 24),
            ),
            TextButton
              (
              onPressed: _toggleMood,
              child: Text('Change Mood'),
            ),
          ],
        )
      );
  }

  void _toggleMood()
  {
    setState(() {
      _isHappy = !_isHappy;
    });
  }
}
