import 'dart:math';

import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({super.key});

  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  double _padding = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(5),
      body: Row(
        children: [
          _container(Colors.teal, 500, _padding),
          _container(Colors.lightGreen, 1500, _padding),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }
  _action() =>
    setState(() => _padding = Random().nextDouble() * 40);

  _container(color, duration, padding) {
    return Expanded(
      child: AnimatedPadding(
        duration: Duration(milliseconds: duration),
        padding: EdgeInsets.symmetric(horizontal: padding),
        curve: Curves.decelerate,
        child: Container(
          height: 150,
          color: color,
        ),
      ),
    );
  }
}