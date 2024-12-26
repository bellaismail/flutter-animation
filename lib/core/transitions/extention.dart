
import 'package:animation_practices/core/transitions/l10n.dart';
import 'package:animation_practices/core/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

extension Transition on String{
  String trans({
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
    BuildContext? context,
  }) =>
      this.tr(
        args: args,
        namedArgs: namedArgs,
        gender: gender,
        context: context,
      );
}

extension FirstCharOnly on String {
  firstChar() => (this).split('').first.toString();
}

extension TranslationsFuns on BuildContext{
  Locale? getCurrentLanguage()=> EasyLocalization.of(this)?.currentLocale;
  Future<void> changeLang() async{
    Phoenix.rebirth(this);
    if(getCurrentLanguage() == L10n.ar) {
      await EasyLocalization.of(this)?.setLocale(L10n.en);
    } else{
      await EasyLocalization.of(this)?.setLocale(L10n.ar);
    }
  }
  String langText() {
    if(getCurrentLanguage() == L10n.ar) {
      return AppStrings.arabic;
    } else{
      return AppStrings.english;
    }
  }
}

extension MyTestReverse on bool{
  bool reverse()=> !this;
}