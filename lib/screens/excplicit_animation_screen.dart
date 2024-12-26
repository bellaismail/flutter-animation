import 'package:animation_practices/core/transitions/extention.dart';
import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import '../core/utils/app_strings.dart';
import '../widgets/main_screen_button.dart';

class ExcplicitAnimationScreen extends StatelessWidget {
  const ExcplicitAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.explicitAnimation.trans()),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const BouncingScrollPhysics(),
        children: const [
          MainScreenButton(route: AppRoutes.positionTransitionScreen, lecture: '#positioned_transition'),
          MainScreenButton(route: AppRoutes.sizedTransitionScreen, lecture: '#sized_transition'),
          MainScreenButton(route: AppRoutes.rotationTransitionScreen, lecture: '#rotation_transition'),
          MainScreenButton(route: AppRoutes.animatedBuilderExample, lecture: '#animated_builder'),
          MainScreenButton(route: AppRoutes.fadeTransitionScreen, lecture: '#fade_transition'),
          MainScreenButton(route: AppRoutes.positionDirectionalScreen, lecture: '#positioned_directional'),
          MainScreenButton(route: AppRoutes.tweenAnimationBuilder, lecture: '#tween_animation_builder'),
          MainScreenButton(route: AppRoutes.defaultTextStyleTransition, lecture: '#default_text_style_transtition'),
          MainScreenButton(route: AppRoutes.indexedStackScreen, lecture: '#indexed_stack'),
        ],
      ),
    );
  }
}
