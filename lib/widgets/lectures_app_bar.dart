import 'package:animation_practices/core/transitions/extention.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

AppBar lecturesAppBar(int lecture) {
  return AppBar(
    title: Text('${AppStrings.lecture.trans()} #$lecture'),
  );
}