import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedTextStyleScreen extends StatefulWidget {
  const AnimatedTextStyleScreen({super.key});
  @override
  State<AnimatedTextStyleScreen> createState() => _AnimatedTextStyleScreenState();
}

class _AnimatedTextStyleScreenState extends State<AnimatedTextStyleScreen> with SingleTickerProviderStateMixin{

  Color _color = Colors.teal;
  double _size = 20;
  bool text = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            curve: Curves.bounceInOut,
            style: TextStyle(color: _color, fontSize: _size),
            duration: const Duration(milliseconds: 400),
            child: text
                ? const Text('my name is bilal')
                : Icon(Icons.ac_unit, size: _size),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => _onPressed(true),
                child: const Icon(Icons.add),
              ),
              MaterialButton(
                onPressed: () => _onPressed(false),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onPressed(plus) {
    if (plus) {
      _color = Colors.teal;
      _size = 20;
    } else {
      _color = Colors.red;
      _size = 14;
    }
    setState(() {});
  }
}
