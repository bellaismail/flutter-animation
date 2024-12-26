import 'package:animation_practices/core/routes/app_routes.dart';
import 'package:animation_practices/core/transitions/extention.dart';
import 'package:flutter/material.dart';
import '../core/utils/app_strings.dart';
import '../widgets/main_screen_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.mainScreen.trans()),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const BouncingScrollPhysics(),
        children: const [
          MainScreenButton(route: AppRoutes.implicitAnimationScreen, lecture: '#implicit_animation_screen'),
          MainScreenButton(route: AppRoutes.explicitAnimationScreen, lecture: '#explicit_animation_screen'),
          MainScreenButton(route: AppRoutes.routeTransitionScreens, lecture: '#route_transiton_screen'),
          MainScreenButton(route: AppRoutes.moreAnimationScreens, lecture: '#more_animations_screen'),
          MainScreenButton(route: AppRoutes.practicesScreens, lecture: '#practices_examples'),
        ],
      ),
    );
  }
}