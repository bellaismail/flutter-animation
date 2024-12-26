import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class FadeTransitionScreen extends StatefulWidget {
  const FadeTransitionScreen({super.key});

  @override
  State<FadeTransitionScreen> createState() => _FadeTransitionScreenState();
}

class _FadeTransitionScreenState extends State<FadeTransitionScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _a;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _a = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(5),
      body: Center(
        child: FadeTransition(
          opacity: _a,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.purpleAccent,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: () {
        if(_controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if(_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        }
      }),
    );
  }
}
