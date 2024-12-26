import 'package:animation_practices/core/transitions/extention.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:animation_practices/screens/practices_screens/route_transitions_screens/route_transition_second_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/routes/custom_navigation_2.dart';
import '../../../widgets/main_screen_button.dart';

class RouteTransitionsScreen extends StatefulWidget {
  const RouteTransitionsScreen({super.key});

  @override
  State<RouteTransitionsScreen> createState() => _RouteTransitionsScreenState();
}

class _RouteTransitionsScreenState extends State<RouteTransitionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.routeTransitions.trans()),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          MainScreenButton(
            route: AppRoutes.routeFadeTransitionScreen,
            lecture: '#fade_transition',
            onTap: () =>
                _pushNavigation(
                CustomTransition.fade(page: _routeTransitionSecondScreen)),
          ),
          MainScreenButton(
            route: AppRoutes.routeScaleTransitionScreen,
            lecture: '#scale_transition',
            onTap: ()=> _pushNavigation(CustomTransition.scale(page: _routeTransitionSecondScreen)),
          ),
          MainScreenButton(
            route: AppRoutes.routeSizeTransitionScreen,
            lecture: '#size_transition',
            onTap: ()=> _pushNavigation(CustomTransition.size(page: _routeTransitionSecondScreen)),
          ),
          MainScreenButton(
            route: AppRoutes.routeRotationTransitionScreen,
            lecture: '#rotation_transition',
            onTap: ()=> _pushNavigation(CustomTransition.rotation(page: _routeTransitionSecondScreen)),
          ),
          MainScreenButton(
            route: AppRoutes.routeSlideTransitionScreen,
            lecture: '#slide_transition',
            onTap: () {
              _pushNavigation(CustomTransition.slide(page: _routeTransitionSecondScreen));
            },
          ),
          MainScreenButton(
            route: AppRoutes.routeFadeSizeTransitionScreen,
            lecture: '#fade_size_transition',
            onTap: () {
              _pushNavigation(CustomTransition.fadeSide(page: _routeTransitionSecondScreen));
            },
          ),
          MainScreenButton(
            route: AppRoutes.routeScaleRotateTransitionScreen,
            lecture: '#scale_rotate_transition',
            onTap: () {
              _pushNavigation(CustomTransition.scaleRotate(page: _routeTransitionSecondScreen));
            },
          ),
        ],
      ),
    );
  }

  _pushNavigation(Route route) {
    Navigator.of(context).push(route);
  }
}

const _routeTransitionSecondScreen = RouteTransitionSecondScreen();
