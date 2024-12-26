import 'package:animation_practices/core/transitions/extention.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RouteTransitionSecondScreen extends StatelessWidget {
  const RouteTransitionSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.withOpacity(0.5),
      appBar: AppBar(
        title: Text(AppStrings.routeTransitionSecondScreen.trans()),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppStrings.back.trans(),
          ),
        ),
      ),
    );
  }
}