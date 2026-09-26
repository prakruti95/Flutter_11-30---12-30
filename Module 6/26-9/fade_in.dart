import 'package:flutter/material.dart';

class SimpleFadeIn extends StatefulWidget {
  const SimpleFadeIn({super.key});

  @override
  State<SimpleFadeIn> createState() => _SimpleFadeInState();
}

class _SimpleFadeInState extends State<SimpleFadeIn> {
  // Start fully invisible
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 800), // Fade duration
          curve: Curves.easeIn,
          child: const FlutterLogo(size: 150),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _opacity = 1.0; // Trigger the fade-in
            });
          },
          child: const Text('Fade In'),
        ),
      ],
    );
  }
}