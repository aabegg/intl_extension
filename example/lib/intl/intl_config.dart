// **************************************************************************
// IntlGenerator
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

import "package:flutter/widgets.dart";
import "package:intl_extension/intl_extension.dart";
import "app_localizations.dart";
import "app_localizations_en.dart";
import "app_localizations_de.dart";

class IntlConfig implements IntlConfigScheme {
  @override
  final Locale sourceLocale = const Locale("en");
  @override
  Locale locale;
  @override
  late dynamic localization;
  @override
  late Map<String, Function> mapper;
  @override
  final KeyNotFoundFunction keyNotFound;

  IntlConfig({
    this.locale = const Locale("en"),
    this.keyNotFound = _defaultKeyNotFound,
  }) {
    setLocalization(locale);
    _initializeMapper();
  }

  static _defaultKeyNotFound(String text) {
    print('Translation for [$text] not found');
  }

  @override
  setLocalization(Locale newLocale) {
    locale = newLocale;
    switch (newLocale.toLanguageTag()) {
      case "en":
        localization = AppLocalizationsEn();
        break;
      case "de":
        localization = AppLocalizationsDe();
        break;
    }
  }

  @override
  List<LocalizationsDelegate> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;
  @override
  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  _initializeMapper() {
    mapper = {
      "t975145968": ([Map<String, String> params = const {}]) {
        return localization.t975145968;
      },
      "t1017881318": ([Map<String, String> params = const {}]) {
        return localization.t1017881318;
      },
      "t67849586": ([Map<String, String> params = const {}]) {
        return localization.t67849586;
      },
      "t495287403": (int value, [Map<String, String> params = const {}]) {
        return localization.t495287403(
          value,
        );
      },
    };
  }
}
