// In app display language setting
// language setting also can be config based from device's default as well

import 'dart:ui';
import 'package:language_code/language_code.dart';
import 'package:flutter/foundation.dart';

class InAppLangConf {
  final supportedLocales = [
    const Locale("th"), // Thai
    const Locale('en', 'US'), // American English
    const Locale('zh', 'CN'), // Simp Chinese
    const Locale('zh', 'TW') // Trad (TW) Chinese
  ];
  Locale deviceDefaultLocale = LanguageCode.locale;
  Locale currentLangLocale = LanguageCode.locale;
  // String currentLangRawCode = LanguageCode.rawCode;
  LanguageCodes currentLangCodeObj = LanguageCode.code;
  late bool enable;
  dynamic language;

  InAppLangConf({this.enable = false, this.language}); // constructor

  List<Locale> getAvailableLocales() => supportedLocales;

  // Locale getLocaleObjFromRawCode(String rawCode) =>
  void refresh() {
    if (isEnabled()) {
      currentLangLocale = language ?? deviceDefaultLocale;
      language = null;
    }
  }

  void overrideDefaultLocale(Locale locale) {
    deviceDefaultLocale = locale;
  }

  void enableInAppLangConf() {
    language = deviceDefaultLocale;
    enable = true;
  }

  void disableInAppLangConf() {
    language = deviceDefaultLocale;
    enable = false;
  }

  bool isEnabled() {
    if (!enable) {
      return false;
    }
    return true;
  }

  String getCurrentLangCodeStr() => currentLangCodeObj.code; // {
  // (isEnabled()) ? currentLangCodeObj.code: null;
  // }

  Locale getCurrentLangLocale() => currentLangLocale;

  void setLang({String langCode = "_auto_", String regionCode = 'TH'}) {
    if (isEnabled()) {
      switch (langCode) {
        case "zh":
          switch (regionCode) {
            case "TW":
              language = const Locale('zh', 'TW');
              break;
            default:
              language = const Locale('zh', 'CN');
              break;
          }
          break;
        case "th":
          language = const Locale("th");
          break;
        case "en":
          language = const Locale('en', 'US');
          break;
        default:
          language = deviceDefaultLocale;
          break;
      }
    }
    currentLangLocale = language;
  }
}

var langConfig = InAppLangConf();
