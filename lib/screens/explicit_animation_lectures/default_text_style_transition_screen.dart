import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class DefaultTextStyleTransitionScreen extends StatefulWidget {
  const DefaultTextStyleTransitionScreen({super.key});

  @override
  State<DefaultTextStyleTransitionScreen> createState() => _DefaultTextStyleTransitionScreenState();
}

class _DefaultTextStyleTransitionScreenState extends State<DefaultTextStyleTransitionScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late TextStyleTween _a2;
  late Animation<double> _a;
  final begin = const TextStyle(
    fontSize: 16,
    color: Colors.green,
    fontWeight: FontWeight.w400,
  );
  final end = const TextStyle(
    fontSize: 34,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _a = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
    _a2 = TextStyleTween(begin: begin, end: end);
    _controller.repeat(reverse: true);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(8),
      body: Center(
        child: DefaultTextStyleTransition(
          style: _a.drive(_a2),
          child: Container(
            width: 400,
            height: 200,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('my name is bilal'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: LecturesFab(action: () {
        _controller.stop();
      }),
    );
  }
}