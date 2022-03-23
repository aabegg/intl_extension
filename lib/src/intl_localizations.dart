import 'dart:io';
import 'package:flutter/widgets.dart';

import 'intl_config_scheme.dart';

class IntlLocalizations {
  static late IntlConfigScheme _intlConfig;

  static void init(IntlConfigScheme config, {initLocale = true}) {
    _intlConfig = config;
    if (initLocale) {
      calcAndSetLocale();
    }
  }

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      _intlConfig.localizationsDelegates;

  static List<Locale> get supportedLocales => _intlConfig.supportedLocales;

  static Locale get locale => _intlConfig.locale;

  static Locale calcLocale() {
    final Locale defaultSystemLocale =
        _defaultLocaleStringAsLocale(Platform.localeName);
    final cleanSupportedLocales =
        supportedLocales.map((e) => e.languageCode).toList();

    if (supportedLocales.contains(defaultSystemLocale)) {
      // Prüft ob die Systemsprache inkl. Ländercode verfügbar ist
      return defaultSystemLocale;
    } else if (supportedLocales
        .contains(Locale(defaultSystemLocale.languageCode))) {
      // Prüft ob die Systemsprache ohne Ländercode verfügbar ist
      return Locale(defaultSystemLocale.languageCode);
    } else if (cleanSupportedLocales
        .contains(defaultSystemLocale.languageCode)) {
      return supportedLocales.elementAt(
          cleanSupportedLocales.indexOf(defaultSystemLocale.languageCode));
    } else {
      return supportedLocales.first;
    }
  }

  static Locale calcAndSetLocale() {
    final locale = calcLocale();
    _intlConfig.setLocalization(locale);
    return locale;
  }

  static String i18n(String text, {Map<String, String> params = const {}}) {
    try {
      return _intlConfig.mapper['t${text.hashCode}']!.call(params);
    } catch (e) {
      return text;
    }
  }

  static String i18nSelect(
    String text, {
    required String value,
    Map<String, String> params = const {},
  }) {
    try {
      return _intlConfig.mapper['t${text.hashCode}']!.call(value, params);
    } catch (e) {
      return text;
    }
  }

  static String i18nPlural(
    String text, {
    required int value,
    Map<String, String> params = const {},
  }) {
    try {
      return _intlConfig.mapper['t${text.hashCode}']!.call(value, params);
    } catch (e) {
      return text;
    }
  }

  static Locale _defaultLocaleStringAsLocale(String locale) {
    final splitted = locale.split('_');
    return Locale(splitted[0], splitted[1]);
  }
}
