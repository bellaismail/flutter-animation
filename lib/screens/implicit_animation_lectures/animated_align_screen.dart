import 'dart:math';

import 'package:flutter/material.dart';
import '../../widgets/animated_align_widgets/animted_align_containter.dart';
import '../../widgets/lectures_FAB.dart';
import '../../widgets/lectures_app_bar.dart';

class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({super.key});

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {

  Alignment pinkAlign = Alignment.bottomRight;
  Alignment tealAlign = Alignment.topLeft;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            AnimatedAlignContainer(alignment: tealAlign, color: Colors.teal),
            AnimatedAlignContainer(alignment: pinkAlign, color: Colors.pinkAccent),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }

  void _action() {
    _alignments = _alignments;
    setState(() {
      int r1 = Random().nextInt(_alignments.length);
      int r2 = Random().nextInt(_alignments.length);
      if(r1 == r2) {
        if(r1 == _alignments.length-1) {
          r2 = Random().nextInt(_alignments.length - 1);
        } else if(r1 == 0){
          r2 = Random().nextInt(_alignments.length) * 1;
        } else{
          r2 = Random().nextInt(_alignments.length);
        }
      }
      Alignment random1 = _alignments[r1];
      Alignment random2 = _alignments[r2];
      pinkAlign = random1;
      tealAlign = random2;
    });
  }
  List<Alignment> _alignments = [
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

