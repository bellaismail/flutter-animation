import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class IndexedStackScreen extends StatefulWidget {
  const IndexedStackScreen({super.key});

  @override
  State<IndexedStackScreen> createState() => _IndexedStackScreenState();
}

class _IndexedStackScreenState extends State<IndexedStackScreen> with SingleTickerProviderStateMixin{
  int index = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(9),
      body: Center(
        child: LayoutBuilder(
          builder: (_, c) {
            return IndexedStack(
              sizing: StackFit.expand,
              index: index,
              children: const [
                _Container(color: Colors.green),
                _Container(color: Colors.red),
                _Container(color: Colors.black),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(
        action: _action,
      ),
    );
  }

  _action() => setState(() {
        if (index == 2) {
          index = 0;
          return;
        }
        index++;
        _controller.reset();
        _controller.forward();
      });
}

class _Container extends StatefulWidget {
  const _Container({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<_Container> createState() => _ContainerState();
}

class _ContainerState extends State<_Container> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _scale = Tween<double>(begin: .5, end: 1.0).animate(_controller);
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _controller.reset();
    _controller.forward();
    return FadeTransition(
      opacity: _fade,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}