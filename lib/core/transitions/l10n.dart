import 'package:flutter/material.dart';

final class L10n{

  const L10n._();
  static L10n instance()=> const L10n._();

  final Locale _en = const Locale('en', 'US');
  final Locale _ar = const Locale('ar', 'EG');
  static Locale get ar => const L10n._()._ar;
  static Locale get en => const L10n._()._en;

  static List<Locale> locales()=> [ar, en];

  static String path = 'assets/translations';
}