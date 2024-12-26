import 'dart:math';
import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  const AnimatedPhysicalModelScreen({super.key});

  @override
  State<AnimatedPhysicalModelScreen> createState() => _AnimatedPhysicalModelScreenState();
}

class _AnimatedPhysicalModelScreenState extends State<AnimatedPhysicalModelScreen> {

  BoxShape _shape = BoxShape.rectangle;
  double _elevation = 0;
  Color _color = Colors.teal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(6),
      body: Center(
        child: AnimatedPhysicalModel(
          shape: _shape,
          elevation: _elevation,
          duration: const Duration(milliseconds: 2000),
          color: _color,
          shadowColor: Colors.grey,
          animateColor: true,
          animateShadowColor: true,
          curve: Curves.bounceInOut,
          child: const SizedBox(
            width: 200,
            height: 200,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }

  _action() => setState(() {
        _shape == BoxShape.rectangle
            ? _shape = BoxShape.circle
            : _shape = BoxShape.rectangle;
     _elevation = Random().nextDouble() * 90;
    if(_color == Colors.teal) {
      _color = Colors.lightGreen;
    } else{
      _color =  Colors.teal;
    }
    _color == Colors.teal? Colors.lightGreen: Colors.teal;
  });
}
