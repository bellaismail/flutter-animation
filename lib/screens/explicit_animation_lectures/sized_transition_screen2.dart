import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class SizedTransitionScreen2 extends StatefulWidget {
  const SizedTransitionScreen2({super.key});

  @override
  State<SizedTransitionScreen2> createState() => _SizedTransitionScreen2State();
}

class _SizedTransitionScreen2State extends State<SizedTransitionScreen2> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(2),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
          child: Center(
            child: SizeTransition(
              sizeFactor: _animation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: LecturesFab(
        action: () {
          if(_controller.status == AnimationStatus.forward || _controller.status == AnimationStatus.completed) {
            print('bilal 1');
            _controller.reverse();
            return;
          }
          print('bilal 2');
          _controller.forward();
        },
      ),
    );
  }
}
