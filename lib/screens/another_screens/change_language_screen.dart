import 'package:animation_practices/core/transitions/extention.dart';
import 'package:animation_practices/core/transitions/l10n.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settingScreen.trans()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: context.getCurrentLanguage() == L10n.ar,
              onChanged: (val) async => context.changeLang(),
            ),
            const SizedBox(height: 10),
            Text(
                context.langText().trans(),
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}