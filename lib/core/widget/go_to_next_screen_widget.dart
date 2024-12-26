import 'package:flutter/material.dart';

class GoToNextScreenWidget extends StatelessWidget {
  const GoToNextScreenWidget({super.key, required this.routeName});

  final String routeName;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: const Text('go to next screen'),
    );
  }
}
