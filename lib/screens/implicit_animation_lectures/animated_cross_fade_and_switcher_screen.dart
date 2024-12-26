import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadeAndSwitcherScreen extends StatefulWidget {
  const AnimatedCrossFadeAndSwitcherScreen({super.key});

  @override
  State<AnimatedCrossFadeAndSwitcherScreen> createState() => _AnimatedCrossFadeAndSwitcherScreenState();
}

class _AnimatedCrossFadeAndSwitcherScreenState extends State<AnimatedCrossFadeAndSwitcherScreen> {

  bool start = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('animated cross fade'),
                const SizedBox(height: 30),
                AnimatedCrossFade(
                  reverseDuration: const Duration(seconds: 1),
                  firstChild: const _Container(
                    radius: 8,
                    borderColor: Colors.brown,
                    containerColor: Colors.purple,
                  ),
                  secondChild: const _Container(
                    radius: 16,
                    borderColor: Colors.grey,
                    containerColor: Colors.amber,
                  ),
                  crossFadeState: start? CrossFadeState.showFirst: CrossFadeState.showSecond,
                  duration: const Duration(seconds: 1),
                ),
              ],
            ),

            Column(
              children: [
                const Text('animated switcher'),
                const SizedBox(height: 30),
                AnimatedSwitcher(
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                    // return ScaleTransition(scale: animation, child: child);
                  },
                    layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                    return Stack(
                        alignment: Alignment.center,
                        children: [
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      );
                    },
                    duration: const Duration(milliseconds: 600),
                    child: start? const _Container(
                      containerColor: Colors.green,
                      radius: 8,
                      borderColor: Colors.grey,
                    ): const CircularProgressIndicator(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }
  _action() {
    setState(() {
      start = !start;
    });
  }
}

class _Container extends StatelessWidget {
  const _Container({
    super.key,
    this.containerColor,
    required this.radius,
    required this.borderColor,
  });

  final Color borderColor;
  final Color? containerColor;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: containerColor,
      ),
    );
  }
}

