import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messaging/src/core/helpers/cache_data.dart';

abstract class EasyLocalizationHelper {
  static Future<void> changeLanguage(
    BuildContext context, {
    required Locale locale,
  }) async {
    await EasyLocalization.of(context)?.setLocale(locale);
    await CacheHelper.setStringData(
      key: 'app_locale',
      value: locale.languageCode,
    );
  }

  static Future<Locale> getSavedLocale() async {
    String? savedLanguageCode = CacheHelper.getStringData(key: 'app_locale');

    if (savedLanguageCode != null) {
      return Locale(savedLanguageCode);
    }
    return const Locale('ar');
  }

  static String? currentLanguage(BuildContext context) =>
      EasyLocalization.of(context)?.currentLocale?.languageCode;

  static String? deviceLanguage(BuildContext context) =>
      EasyLocalization.of(context)?.deviceLocale.languageCode;
}

abstract class Config {
  static bool isArabic(BuildContext context) =>
      EasyLocalizationHelper.currentLanguage(context) == "ar";
}
