import 'package:flutter/material.dart';

class ChangeData extends StatefulWidget {
  const ChangeData({super.key});

  @override
  State<ChangeData> createState() => _ChangeDataState();
}

class _ChangeDataState extends State<ChangeData>
{
  bool _isHappy = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Chnage Data"),),
      body: Center
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
      ),
    );
  }

  void _toggleMood()
  {
    setState(() {
      _isHappy = !_isHappy;
    });
  }
}
