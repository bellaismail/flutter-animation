import 'package:flutter/material.dart';

class MainScreenButton extends StatelessWidget {
  const MainScreenButton({
    super.key,
    required this.route,
    required this.lecture,
    this.onTap,
  });

  final String route;
  final String lecture;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: route,
      child: ElevatedButton(
        onPressed: onTap?? () => Navigator.pushNamed(context, route),
        child: Text(lecture),
      ),
    );
  }
}
