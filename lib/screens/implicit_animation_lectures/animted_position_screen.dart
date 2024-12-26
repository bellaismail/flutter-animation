import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/lectures_FAB.dart';

class AnimatedPositionScreen extends StatefulWidget {
  const AnimatedPositionScreen({super.key});

  @override
  State<AnimatedPositionScreen> createState() => _AnimatedPositionScreenState();
}

class _AnimatedPositionScreenState extends State<AnimatedPositionScreen> {
  bool go = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(7),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            const AnimatedPositioned(
              top: 0,
              left: 0,
              duration: Duration(seconds: 1),
              child: _Container(color: Colors.red, text: '1'),
            ),

            AnimatedPositioned(
              top: 0,
              left: go? 0: MediaQuery.of(context).size.width - (100),
              duration: const Duration(seconds: 1),
              child: const _Container(color: Colors.purple, text: '4'),
            ),
            AnimatedPositioned(
              top: go? 0: MediaQuery.of(context).size.height - (160 + 20),
              left: go? 0: MediaQuery.of(context).size.width - (100),
              duration: const Duration(seconds: 1),
              child: const _Container(color: Colors.brown, text: '4'),
            ),
            AnimatedPositionedDirectional(
              top: go? MediaQuery.of(context).size.height - 300: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height - 160),
              start: go? 50: 10,
              end: go? 50: 10,
              duration: const Duration(seconds: 1),
              child: const _Container(color: Colors.lightGreen, text: 'position Ddirection'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }

  _action() {
    setState(() {
      go = !go;
    });
  }
}

class _Container extends StatelessWidget {
  const _Container({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 80,
      height: 80,
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
