import 'package:flutter/material.dart';

class PageViewContainer extends StatelessWidget {
  const PageViewContainer({super.key, required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
