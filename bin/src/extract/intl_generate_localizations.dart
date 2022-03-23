import 'dart:io';
import 'package:recase/recase.dart';
import '../settings/intl_settings.dart';
import 'intl_object.dart';

class IntlGenerateLocalizations {
  final List<IntlObject> objects;
  final IntlSettings settings;

  IntlGenerateLocalizations({
    required this.objects,
    required this.settings,
  });

  Future<void> generate() async {
    await generateBaseFile();
  }

  Future<void> generateBaseFile() async {
    StringBuffer fileString = StringBuffer();

    fileString.writeln(
        '// **************************************************************************');
    fileString.writeln('// IntlGenerator');
    fileString.writeln(
        '// **************************************************************************');
    fileString.writeln('');
    fileString.writeln('// coverage:ignore-file');
    fileString.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    fileString.writeln('// ignore_for_file: type=lint');
    fileString.writeln(
        '// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target');
    fileString.writeln('');

    fileString.writeln('import "package:flutter/widgets.dart";');
    fileString.writeln('import "package:intl_extension/intl_extension.dart";');
    fileString.writeln('import "app_localizations.dart";');

    final List<String> locales =
        settings.locales.map((e) => e.split('_')[0]).toSet().toList();
    for (final locale in locales) {
      fileString.writeln('import "app_localizations_$locale.dart";');
    }

    fileString.writeln('');
    fileString.writeln('class IntlConfig implements IntlConfigScheme {');
    fileString.writeln('@override');
    fileString.writeln('Locale locale;');
    fileString.writeln('@override');
    fileString.writeln('late dynamic localization;');
    fileString.writeln('@override');
    fileString.writeln('late Map<String, Function> mapper;');
    fileString.writeln('');

    fileString.writeln('IntlConfig({');
    fileString.writeln('this.locale = const Locale("${settings.sourceLang}"),');
    fileString.writeln('}) {');
    fileString.writeln('setLocalization(locale);');
    fileString.writeln('_initializeMapper();');
    fileString.writeln('}');
    fileString.writeln('');

    fileString.writeln('@override');
    fileString.writeln('setLocalization(Locale locale) {');
    fileString.writeln('locale = locale;');
    fileString.writeln('switch (locale.toLanguageTag()) {');

    for (final locale in settings.locales) {
      fileString.writeln('case "${locale.replaceFirst("_", "-")}":');
      fileString.writeln(
          'localization = AppLocalizations${locale.toLowerCase().pascalCase}();');
      fileString.writeln('break;');
    }

    fileString.writeln('}');
    fileString.writeln('}');
    fileString.writeln('');

    fileString.writeln('@override');
    fileString.writeln(
        'List<LocalizationsDelegate> get localizationsDelegates => AppLocalizations.localizationsDelegates;');

    fileString.writeln('@override');
    fileString.writeln(
        'List<Locale> get supportedLocales => AppLocalizations.supportedLocales;');
    fileString.writeln('');

    fileString.writeln('_initializeMapper() {');
    fileString.writeln('mapper = {');

    final List<String> addKeys = [];

    for (final obj in objects) {
      if (addKeys.contains(obj.key)) {
        continue;
      }

      addKeys.add(obj.key);

      switch (obj.type) {
        case IntlObjectType.string:
          if (obj.hasParams) {
            fileString.writeln(
                '"${obj.key}": ([Map<String, String> params = const {}]) {');
            fileString.writeln('return localization.${obj.key}(');

            for (final param in obj.placeholders) {
              fileString.writeln('params["$param"] as Object,');
            }

            fileString.writeln(');');
            fileString.writeln('},');
          } else {
            fileString.writeln(
                '"${obj.key}": ([Map<String, String> params = const {}]) {');
            fileString.writeln('return localization.${obj.key};');
            fileString.writeln('},');
          }

          break;
        case IntlObjectType.plural:
          fileString.writeln(
              '"${obj.key}": (int value, [Map<String, String> params = const {}]) {');
          fileString.writeln('return localization.${obj.key}(');
          fileString.writeln('value,');
          for (final param in obj.params) {
            fileString.writeln('params["$param"] as Object,');
          }
          fileString.writeln(');');
          fileString.writeln('},');

          break;
        case IntlObjectType.select:
          fileString.writeln(
              '"${obj.key}": (String value, [Map<String, String> params = const {}]) {');
          fileString.writeln('return localization.${obj.key}(');
          fileString.writeln('value,');
          for (final param in obj.params) {
            fileString.writeln('params["$param"] as Object,');
          }
          fileString.writeln(');');
          fileString.writeln('},');

          break;
      }
    }

    fileString.writeln('};');
    fileString.writeln('}');
    fileString.writeln('}');

    if (!await Directory(settings.outputDir).exists()) {
      await Directory(settings.outputDir).create(recursive: true);
    }

    final file = File('${settings.outputDir}/intl_config.dart');
    await file.writeAsString(fileString.toString());

    await Process.run('flutter dartfmt', [file.path], runInShell: true);
  }
}
