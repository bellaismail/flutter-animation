import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class PositionedDirectionalScreen extends StatefulWidget {
  const PositionedDirectionalScreen({super.key});

  @override
  State<PositionedDirectionalScreen> createState() => _PositionedDirectionalScreenState();
}

class _PositionedDirectionalScreenState extends State<PositionedDirectionalScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<RelativeRect> _a;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _a = RelativeRectTween(
      begin: RelativeRect.fill,
      end: const RelativeRect.fromLTRB(100, 100, 0, 0),).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(6),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _a,
            builder: (context, child) => PositionedDirectional(
              bottom: _a.value.bottom,
              top: _a.value.top,
              start: _a.value.right,
              end: _a.value.left,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: () {
        if(_a.status == AnimationStatus.completed) {
          _controller.reverse();
        } else if(_a.status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      }),
    );
  }
}
