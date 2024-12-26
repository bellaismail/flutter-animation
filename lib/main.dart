import 'package:animation_practices/app.dart';
import 'package:animation_practices/core/transitions/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _asyncFun();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => EasyLocalization(
        supportedLocales: L10n.locales(),
        path: L10n.path,
        startLocale: L10n.ar,
        fallbackLocale: L10n.en,
        saveLocale: true,
        useOnlyLangCode: true,
        child: Phoenix(
          child: const MyAnimationApp(),
        ),
      ),
    ),
  );
}

_asyncFun() async {
  await Future.wait([
    EasyLocalization.ensureInitialized(),
  ]);
}