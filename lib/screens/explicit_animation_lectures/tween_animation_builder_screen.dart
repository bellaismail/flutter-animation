import 'dart:math';

import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimationBuilderScreen extends StatefulWidget {
  const TweenAnimationBuilderScreen({super.key});

  @override
  State<TweenAnimationBuilderScreen> createState() => _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState extends State<TweenAnimationBuilderScreen> {
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(7),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 900),
          tween: Tween<double>(begin: .2, end: _opacity),
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: value,
                  child: child,
                ),
                const SizedBox(height: 50),
                Transform.rotate(angle: value *2 * pi, child: child,),
                const SizedBox(height: 50),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  width: 150 * value,
                  height: 150 * value,
                  child: child,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () => setState(
                          () => _opacity = _opacity == 1 ? 0 : 1,
                        ),
                    child: const Text('execute')),
              ],
            );
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
