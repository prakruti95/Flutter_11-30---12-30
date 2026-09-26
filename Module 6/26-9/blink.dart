import 'package:flutter/material.dart';


class BlinkWidget extends StatefulWidget {
  const BlinkWidget({super.key});

  @override
  State<BlinkWidget> createState() => _BlinkWidgetState();
}

class _BlinkWidgetState extends State<BlinkWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 1. Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 2. Tell the animation to repeat continuously and reverse at each end
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // 3. Clean up the controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 4. Use FadeTransition to smoothly animate the opacity of any child widget
    return FadeTransition(
      opacity: _controller,
      child: const Text(
        'Blinking Text!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}