import 'package:animation_practices/widgets/app_custom_wave_widget.dart';
import 'package:flutter/material.dart';

class OverlapLoading extends StatelessWidget {
  const OverlapLoading({
    super.key,
    this.appBar,
    required this.body,
  });

  final AppBar? appBar;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: appBar,
          body: body,
        ),
        Align(
          alignment: Alignment.center,
          child: AppCustomWaveWidget(
            widget: (sizeVal, colorVal) => Container(
              width: sizeVal,
              height: sizeVal,
              decoration: BoxDecoration(
                color: colorVal,
                shape: BoxShape.circle,
              ),
            ),
            begin: 20,
            end: 50,
          ),
        ),
      ],
    );
  }
}
