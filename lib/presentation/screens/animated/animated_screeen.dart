import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: _AnimatedContainer(),
    );
  }
}

class _AnimatedContainer extends StatefulWidget {
  @override
  State<_AnimatedContainer> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<_AnimatedContainer> {
  @override
  double width = 50;
  double height = 50;
  Color color = Colors.red;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(10);

  void changeShape() {
    final random = Random();

    width = random.nextInt(300).toDouble() + 50;
    height = random.nextInt(300).toDouble() + 50;
    color = Color(random.nextInt(0xffffffff));
    borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.refresh_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        ),
      ),
    );
  }
}
