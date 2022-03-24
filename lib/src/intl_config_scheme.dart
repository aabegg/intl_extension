import 'package:flutter/material.dart';

typedef KeyNotFoundFunction = void Function(
  String text,
);

abstract class IntlConfigScheme {
  final Locale sourceLocale = const Locale('en');
  Locale locale;
  late dynamic localization;
  late Map<String, Function> mapper;
  final KeyNotFoundFunction keyNotFound;

  IntlConfigScheme({
    this.locale = const Locale('de'),
    this.keyNotFound = _defaultKeyNotFound,
  });

  void setLocalization(Locale locale);
  static _defaultKeyNotFound(String text) {
    // ignore: avoid_print
    print('Translation for [$text] not found');
  }

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates;
  List<Locale> get supportedLocales;
}
