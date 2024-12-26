import 'dart:math';
import 'package:animation_practices/core/utils/app_assets.dart';
import 'package:flutter/material.dart';


class EarthRotationExample extends StatefulWidget {
  const EarthRotationExample({super.key});

  @override
  State<EarthRotationExample> createState() => _EarthRotationExampleState();
}

class _EarthRotationExampleState extends State<EarthRotationExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _r;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 8));
    _r = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: AnimatedBuilder(
          animation: _r,
          builder: (context, child) {
            return Transform.rotate(
              angle: _r.value * 2 * pi,
              child: Image.asset(AppAssets.earthImage),
            );
          },
        ),
      ),
    );
  }
}