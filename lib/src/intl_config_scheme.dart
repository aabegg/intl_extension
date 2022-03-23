import 'package:flutter/material.dart';

abstract class IntlConfigScheme {
  Locale locale;
  late dynamic localization;
  late Map<String, Function> mapper;

  IntlConfigScheme({this.locale = const Locale('de')});

  void setLocalization(Locale locale);

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates;
  List<Locale> get supportedLocales;
}
