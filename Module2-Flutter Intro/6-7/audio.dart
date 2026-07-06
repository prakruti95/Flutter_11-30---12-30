import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioEx extends StatefulWidget
{
  const AudioEx({super.key});

  @override
  State<AudioEx> createState() => _AudioExState();
}

class _AudioExState extends State<AudioEx>
{
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Songs"),),
      body: Center(

          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Transform.scale(scale: 2,
                //     child: Switch(
                //       onChanged: toggleSwitch,
                //       value: isSwitched,
                //       activeColor: Colors.blue,
                //       activeTrackColor: Colors.yellow,
                //       inactiveThumbColor: Colors.redAccent,
                //       inactiveTrackColor: Colors.orange,)),
                // Text('$textValue', style: const TextStyle(fontSize: 20),),

                ElevatedButton(
                  onPressed: () =>
                  {
                    // toggleSwitch(value);
                    player.play(UrlSource('https://prakrutitech.xyz/API/sound.mp3'))
                  },
                  child: Text('Play'),
                )
              ])


      ),

    );
  }
}
