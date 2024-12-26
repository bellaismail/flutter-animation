import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class PositionTransitionScreen extends StatefulWidget {
  const PositionTransitionScreen({super.key});

  @override
  State<PositionTransitionScreen> createState() => _PositionTransitionScreenState();
}

class _PositionTransitionScreenState extends State<PositionTransitionScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<RelativeRect> _animation;
  late Animation<RelativeRect> _animation2;
  late Animation<RelativeRect> _animation3;

  @override
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    const begin = RelativeRect.fill;
    const end = RelativeRect.fromLTRB(250, 250, 20, 40);
    const end2 = RelativeRect.fromLTRB(150, 150, 20, 40);
    const end3 = RelativeRect.fromLTRB(50, 50, 20, 40);
    _animation = RelativeRectTween(begin: begin, end: end)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_controller);
    _animation2 = RelativeRectTween(begin: begin, end: end2).animate(_controller);
    _animation3 = RelativeRectTween(begin: begin, end: end3).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(1),
      body: Stack(
        children: List.generate(3, (index)=> _body(index)),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LecturesFab(
            heroTag: '1',
            icon: Icons.arrow_back,
            action: () => _controller.forward(),
          ),
          LecturesFab(
            heroTag: '2',
            icon: Icons.arrow_forward,
            action: () => _controller.reverse(),
          ),
        ],
      ),
    );
  }

  _body(int index) {
    switch(index) {
      case 0:
        return PositionedTransition(
          rect: _animation3,
          child: const _Container(color: Colors.tealAccent, icon: Icons.play_circle_fill_sharp),
        );
      case 1:
        return PositionedTransition(
          rect: _animation2,
          child: const _Container(color: Colors.red, icon: Icons.ac_unit),
        );
      case 2:
        return PositionedTransition(
          rect: _animation,
          child: const _Container(color: Colors.brown, icon: Icons.accessible_forward),
        );
    }
  }
}

class _Container extends StatelessWidget {
  const _Container({super.key, required this.color, required this.icon});

  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 100),
    );
  }
}