import 'package:animation_practices/core/routes/app_routes.dart';
import 'package:animation_practices/core/transitions/extention.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:animation_practices/widgets/main_screen_button.dart';
import 'package:flutter/material.dart';

class MoreAnimationsScreen extends StatelessWidget {
  const MoreAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.moreAnimation.trans()),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [
          MainScreenButton(route: AppRoutes.customPainterAnimation, lecture: '#custom_painter'),
          MainScreenButton(route: AppRoutes.lottieAnimation, lecture: '#lottie_animation'),
          MainScreenButton(route: AppRoutes.riveAnimation, lecture: '#rive_animation'),
        ],
      ),
    );
  }
}