import 'package:animation_practices/widgets/app_custom_wave_widget.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

class SizedTransitionScreen extends StatefulWidget {
  const SizedTransitionScreen({super.key});

  @override
  State<SizedTransitionScreen> createState() => _SizedTransitionScreenState();
}

class _SizedTransitionScreenState  extends State<SizedTransitionScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> a2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    a2 = Tween<double>(begin: 10, end: 100).animate(_controller);
    _controller.addListener(_listener);
    _controller.repeat();
  }

  _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(10),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizeTransition(
                //   axisAlignment: .3,
                //   axis: Axis.horizontal,
                //   sizeFactor: _animation,
                //   child: const Icon(
                //     Icons.play_circle_fill_sharp,
                //     size: 100,
                //     color: Colors.teal,
                //   ),
                // ),

                // Icon(
                //   Icons.abc,
                //   size: a2.value,
                //   color: Colors.teal,
                // ),

                //app custom wave widget
                AppCustomWaveWidget(
                  widget: (sizeVal, colorVal) => Container(
                    width: sizeVal,
                    height: sizeVal,
                    decoration: BoxDecoration(
                      color: colorVal,
                      shape: BoxShape.circle,
                    ),
                  ),
                  begin: 20,
                  end: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}