// This is a playground view to make it easy to play around with Flutter Animate.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 58, fontWeight: FontWeight.bold),
        child: const Text("Playground 🛝")
            .animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .shimmer(color: Colors.blue,angle: 90,duration: const Duration(milliseconds: 1200))
            .fadeIn(curve:Curves.easeOutQuad),
      ),
    );
  }
}
