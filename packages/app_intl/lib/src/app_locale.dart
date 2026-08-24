// Flutter imports:
import 'package:flutter/material.dart';

class AppLocale {
  static const String vi = 'vi';
  static const String en = 'en';
  static const String ja = 'ja';

  static final Map<String, String> supportedLanguageMap = <String, String>{
    vi: 'Tiếng Việt',
    en: 'English',
    ja: '日本語',
  };
  static const Locale localeVi = Locale(vi);
  static const Locale localeEn = Locale(en);
  static const Locale localeJa = Locale(ja);
}
