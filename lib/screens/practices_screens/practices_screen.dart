import 'package:animation_practices/core/transitions/extention.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../widgets/main_screen_button.dart';

class PracticesScreen extends StatelessWidget {
  const PracticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.practicesScreens.trans()),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const BouncingScrollPhysics(),
        children: const [
          MainScreenButton(route: AppRoutes.earthRotationScreen, lecture: '#earth_rotation_example'),
          MainScreenButton(route: AppRoutes.bikeShopScreen, lecture: '#bike_shop_example'),
        ],
      ),
    );
  }
}
