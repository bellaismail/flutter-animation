import 'package:animation_practices/core/transitions/extention.dart';
import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import '../core/utils/app_strings.dart';
import '../widgets/main_screen_button.dart';

class ImplicitAnimationScreen extends StatelessWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.implicitAnimation.trans()),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const BouncingScrollPhysics(),
        children: const [
          MainScreenButton(route: AppRoutes.animatedAlignScreen, lecture: '#animated_align'),
          MainScreenButton(route: AppRoutes.animatedContainerScreen, lecture: '#animated_container'),
          MainScreenButton(route: AppRoutes.animatedTextStyleScreen, lecture: '#animated_text_style'),
          MainScreenButton(route: AppRoutes.animatedOpacityScreen, lecture: '#animated_opacity'),
          MainScreenButton(route: AppRoutes.animatedPaddingScreen, lecture: '#animated_padding'),
          MainScreenButton(route: AppRoutes.animatedPhysicalModelScreen, lecture: '#animated_physical_model'),
          MainScreenButton(route: AppRoutes.animatedPositionScreen, lecture: '#animated_position'),
          MainScreenButton(route: AppRoutes.animatedCrossFadeAndSwitcherScreen, lecture: '#animated_crossfade_and_swicher'),
          MainScreenButton(route: AppRoutes.animatedListStateScreen, lecture: '#animated_list_state'),
          MainScreenButton(route: AppRoutes.sizeTransitionScreen, lecture: '#size_transition'),
          MainScreenButton(route: AppRoutes.changeLangScreen, lecture: '#change_lang'),
          MainScreenButton(route: AppRoutes.dotsExampleScreen, lecture: '#dots_example'),
          MainScreenButton(route: AppRoutes.implicitRevisionScreen, lecture: '#implicit_revision'),
        ],
      ),
    );
  }
}
