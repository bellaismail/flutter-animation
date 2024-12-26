import 'package:animation_practices/core/routes/app_routes.dart';
import 'package:animation_practices/core/routes/custom_navigation.dart';
import 'package:animation_practices/core/routes/custom_navigation_2.dart';
import 'package:animation_practices/screens/excplicit_animation_screen.dart';
import 'package:animation_practices/screens/explicit_animation_lectures/default_text_style_transition_screen.dart';
import 'package:animation_practices/screens/explicit_animation_lectures/fade_transition_screen.dart';
import 'package:animation_practices/screens/explicit_animation_lectures/indexed_stack_screen.dart';
import 'package:animation_practices/screens/explicit_animation_lectures/position_transition_screen.dart';
import 'package:animation_practices/screens/explicit_animation_lectures/positioned_directional_screen.dart';
import 'package:animation_practices/screens/implicit_animation_screen.dart';
import 'package:animation_practices/screens/main_screen.dart';
import 'package:animation_practices/screens/more_animations/lottie_animation_screen.dart';
import 'package:animation_practices/screens/more_animations/more_animations_screen.dart';
import 'package:animation_practices/screens/more_animations/rive_animation_screen.dart';
import 'package:animation_practices/screens/practices_screens/bike_shop_example.dart';
import 'package:animation_practices/screens/practices_screens/practices_screen.dart';
import 'package:animation_practices/screens/practices_screens/route_transitions_screens/route_transitions_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/another_screens/change_language_screen.dart';
import '../../screens/another_screens/dots_widgets/dots_exmaple_screen.dart';
import '../../screens/explicit_animation_lectures/animated_builder_example.dart';
import '../../screens/explicit_animation_lectures/rotation_transition_screen.dart';
import '../../screens/explicit_animation_lectures/sized_transition_screen2.dart';
import '../../screens/explicit_animation_lectures/tween_animation_builder_screen.dart';
import '../../screens/implicit_animation_lectures/animated_align_screen.dart';
import '../../screens/implicit_animation_lectures/animated_container_screen.dart';
import '../../screens/implicit_animation_lectures/animated_cross_fade_and_switcher_screen.dart';
import '../../screens/implicit_animation_lectures/animated_list_state_screen.dart';
import '../../screens/implicit_animation_lectures/animated_opacity_screen.dart';
import '../../screens/implicit_animation_lectures/animated_padding_screen.dart';
import '../../screens/implicit_animation_lectures/animted_physical_model_screen.dart';
import '../../screens/implicit_animation_lectures/animted_position_screen.dart';
import '../../screens/implicit_animation_lectures/animted_text_style_screen.dart';
import '../../screens/implicit_animation_lectures/implicit_revision_screen.dart';
import '../../screens/implicit_animation_lectures/size_transition_screen.dart';
import '../../screens/more_animations/custom_painter_screen.dart';
import '../../screens/practices_screens/earth_rotation_example.dart';

class OnGenerateRoutes {
  static const CustomNavigation _customNavigation = CustomNavigation();

  static Route? generateRoute(RouteSettings routeSetting) {
    final String? routeName = routeSetting.name;
    switch (routeName) {
      case '/':
        return _customNavigation(const MainScreen());
      case AppRoutes.implicitAnimationScreen:
        return _customNavigation(
          const ImplicitAnimationScreen(),
          type: TransitionTypes.scale,
        );
      case AppRoutes.explicitAnimationScreen:
        return _customNavigation(
          const ExcplicitAnimationScreen(),
          type: TransitionTypes.scale,
        );
      case AppRoutes.animatedAlignScreen:
        return _customNavigation(
          const AnimatedAlignScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedContainerScreen:
        return _customNavigation(
          const AnimatedContainerScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedTextStyleScreen:
        return _customNavigation(
          const AnimatedTextStyleScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedOpacityScreen:
        return _customNavigation(
          const AnimatedOpacityScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedPaddingScreen:
        return _customNavigation(
          const AnimatedPaddingScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedPhysicalModelScreen:
        return _customNavigation(
          const AnimatedPhysicalModelScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedPositionScreen:
        return _customNavigation(
          const AnimatedPositionScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedCrossFadeAndSwitcherScreen:
        return _customNavigation(
          const AnimatedCrossFadeAndSwitcherScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.animatedListStateScreen:
        return _customNavigation(
          const AnimatedListStateScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.sizeTransitionScreen:
        return _customNavigation(
          const SizedTransitionScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.changeLangScreen:
        return _customNavigation(
          const ChangeLanguageScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.dotsExampleScreen:
        return _customNavigation(
          const DotsExampleScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.implicitRevisionScreen:
        return _customNavigation(
          const ImplicitRevisionScreen(),
          type: TransitionTypes.rotation,
        );
      case AppRoutes.positionTransitionScreen:
        return _customNavigation(
          const PositionTransitionScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.sizedTransitionScreen:
        return _customNavigation(
          const SizedTransitionScreen2(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.rotationTransitionScreen:
        return _customNavigation(
          const RotationTransitionScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.animatedBuilderExample:
        return _customNavigation(
          const AnimatedBuilderExample(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.fadeTransitionScreen:
        return _customNavigation(
          const FadeTransitionScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.positionDirectionalScreen:
        return _customNavigation(
          const PositionedDirectionalScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.tweenAnimationBuilder:
        return _customNavigation(
          const TweenAnimationBuilderScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.defaultTextStyleTransition:
        return _customNavigation(
          const DefaultTextStyleTransitionScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.indexedStackScreen:
        return _customNavigation(
          const IndexedStackScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.moreAnimationScreens:
        return _customNavigation(
          const MoreAnimationsScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.customPainterAnimation:
        return _customNavigation(
          const CustomPainterScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.lottieAnimation:
        return _customNavigation(
          const LottieAnimationScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.riveAnimation:
        return _customNavigation(
          const RiveAnimationScreen(),
          type: TransitionTypes.fade,
        );
      case AppRoutes.practicesScreens:
        return _customNavigation(
          const PracticesScreen(),
          type: TransitionTypes.slide,
        );
      case AppRoutes.earthRotationScreen:
        return _customNavigation(
          const EarthRotationExample(),
          type: TransitionTypes.slide,
        );
      case AppRoutes.bikeShopScreen:
        return _customNavigation(
          const BikeShopExample(),
          type: TransitionTypes.slide,
        );
      case AppRoutes.routeTransitionScreens:
        return _customNavigation(
          const RouteTransitionsScreen(),
          type: TransitionTypes.slide,
        );
      default:
        return null;
    }
  }
}