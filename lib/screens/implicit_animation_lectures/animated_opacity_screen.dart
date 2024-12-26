import 'dart:math';
import 'dart:ui';

import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/lectures_FAB.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(4),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(opacity.toStringAsFixed(1), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('my name is bilal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Icon(Icons.access_alarm, size: 40),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }
  _action() => setState(() => opacity =Random().nextDouble());
}
