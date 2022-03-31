import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

import 'intl_config_scheme.dart';

class IntlLocalizations {
  static final _controller = BehaviorSubject<Locale>();
  static late IntlConfigScheme _intlConfig;
  static bool _ignoreSystemLocale = false;

  static void init(IntlConfigScheme config, {ignoreSystemLocale = false}) {
    _intlConfig = config;
    _ignoreSystemLocale = ignoreSystemLocale;

    // Locale anhand System festlegen
    if (!_ignoreSystemLocale) {
      setPossibleLocaleBySystem();
      WidgetsBinding.instance?.window.onLocaleChanged = () => setPossibleLocaleBySystem();
    }
  }

  static Stream<Locale> get stream => _controller.stream;

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      _intlConfig.localizationsDelegates;

  static List<Locale> get supportedLocales => _intlConfig.supportedLocales;

  static Locale get locale => _intlConfig.locale;

  static void setLocale(Locale locale) {
    if (supportedLocales.contains(locale)) {
      _intlConfig.setLocalization(locale);
    } else {
      _intlConfig.setLocalization(supportedLocales.first);
    }

    _controller.add(_intlConfig.locale);
  }

  static Locale _getPossibleLocaleBySystem() {
    final Locale defaultSystemLocale = _defaultLocaleStringAsLocale(Platform.localeName);

    final cleanSupportedLocales = supportedLocales.map((e) => e.languageCode).toList();

    if (supportedLocales.contains(defaultSystemLocale)) {
      // Prüft ob die Systemsprache inkl. Ländercode verfügbar ist
      return defaultSystemLocale;
    } else if (supportedLocales.contains(Locale(defaultSystemLocale.languageCode))) {
      // Prüft ob die Systemsprache ohne Ländercode verfügbar ist
      return Locale(defaultSystemLocale.languageCode);
    } else if (cleanSupportedLocales.contains(defaultSystemLocale.languageCode)) {
      return supportedLocales
          .elementAt(cleanSupportedLocales.indexOf(defaultSystemLocale.languageCode));
    } else {
      return _intlConfig.sourceLocale;
    }
  }

  static Locale setPossibleLocaleBySystem() {
    final locale = _getPossibleLocaleBySystem();
    _intlConfig.setLocalization(locale);
    _controller.add(_intlConfig.locale);
    return locale;
  }

  static String i18n(String text, {Map<String, String> params = const {}}) {
    try {
      return _intlConfig.mapper['t${text.hashCode}']!.call(params);
    } catch (e) {
      _intlConfig.keyNotFound(text);
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
      _intlConfig.keyNotFound(text);
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
      _intlConfig.keyNotFound(text);
      return text;
    }
  }

  static Locale _defaultLocaleStringAsLocale(String locale) {
    final splitted = locale.split('_');
    return Locale(splitted[0], splitted[1]);
  }
}
