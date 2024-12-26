import 'package:flutter/material.dart';

class AnimatedAlignContainer extends StatelessWidget {
  const AnimatedAlignContainer({super.key, required this.alignment, required this.color});

  final Alignment alignment;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: alignment,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}