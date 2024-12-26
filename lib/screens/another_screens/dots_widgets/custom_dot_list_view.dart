import 'package:flutter/material.dart';

import 'dot_widget.dart';

class CustomDotListView extends StatelessWidget {
  const CustomDotListView({
    super.key,
    required this.count,
    required this.select,
    required this.dotColor,
  });

  final int count;
  final int select;
  final Color dotColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(count, (index) => DotWidget(current: select == index, dotColor: dotColor)),
    );
  }
}
