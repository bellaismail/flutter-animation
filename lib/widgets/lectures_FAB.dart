import 'package:flutter/material.dart';

class LecturesFab extends StatelessWidget {
  const LecturesFab({
    super.key,
    required this.action,
    this.icon,
    this.heroTag,
  });

  final void Function()? action;
  final IconData? icon;
  final String? heroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: action,
      child: Icon(icon?? Icons.sos_rounded),
    );
  }
}
