import 'package:animation_practices/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.current, required this.dotColor});

  final bool current;
  final Color dotColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: (current? 22: 8).w,
      height: 8.h,
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: current? dotColor: Colors.grey,
      ),
    );
  }
}
