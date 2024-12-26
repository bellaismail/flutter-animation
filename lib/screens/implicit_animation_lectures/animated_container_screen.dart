import 'dart:math';

import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/lectures_FAB.dart';
import 'package:curved_carousel/curved_carousel.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double radius = 12.0;
  Color color = Colors.teal;
  double dimnssion = 200;
  Alignment textAlign = Alignment.center;
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(2),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          width: dimnssion,
          height: dimnssion,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
          alignment: textAlign,
          child: showText
              ? Text(
                  'Pilal',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                )
              : const Icon(Icons.cleaning_services),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }

  _action() {
    setState(() {
      radius = Random().nextDouble() * 50;
      int colorHEX = 0xff;
      int randomHEX = Random().nextInt(100000) * 100000;
      String com = colorHEX.toString() + randomHEX.toString();
      color = Color(int.parse(com));

      // dimnssion = Random().nextDouble() * 200;

      textAlign = _alignments[Random().nextInt(_alignments.length)];

      showText = !showText;
    });
  }

  final List<Alignment> _alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,

    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,

    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];
}