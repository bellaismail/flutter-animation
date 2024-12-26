import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class RotationTransitionScreen extends StatefulWidget {
  const RotationTransitionScreen({super.key});

  @override
  State<RotationTransitionScreen> createState() => _RotationTransitionScreenState();
}

class _RotationTransitionScreenState extends State<RotationTransitionScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<Offset> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 2).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _animation1 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation2 = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _animation3 = Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0)).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(3),
      body: Center(
        child: SlideTransition(
          position: _animation3,
          child: FadeTransition(
            opacity: _animation2,
            child: RotationTransition(
              turns: _animation,
              filterQuality: FilterQuality.high,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: RotationTransition(
                  turns: _animation1,
                  child: const Icon(
                    Icons.ac_unit,
                    size: 70,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: () {
        if(_controller.status == AnimationStatus.completed) {
           _controller.reverse();
           return;
        }
        _controller.forward();
      }),
    );
  }
}
