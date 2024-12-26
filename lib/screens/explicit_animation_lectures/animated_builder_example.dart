import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // _controller.repeat(reverse: true, period: const Duration(seconds: 1));
    _controller.forward();
    _controller.addStatusListener(_statusListener);
  }

  _statusListener(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      _controller.reverse();
    } else if(status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(4, ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                alignment: Alignment.topLeft,
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 10,
                ),
              ),
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_controller.value.toStringAsFixed(1)),
                    Text('${_controller.status}'),
                    const SizedBox(height: 50),
                    Transform.rotate(angle: 2 * pi * _controller.value, child: child),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.decelerate,
              onEnd: () => print('onEnd'),
              duration: const Duration(milliseconds: 800),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              builder: (_, value, child) => Transform.rotate(angle: value * 2 * pi, child: child),
            ),
          ],
        ),
      ),
    );
  }
}
