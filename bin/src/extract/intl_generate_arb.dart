import 'dart:convert';
import 'dart:io';

import 'package:arb_utils/arb_utils.dart';

import '../settings/intl_settings.dart';
import 'intl_object.dart';

class IntlGenerateArb {
  final List<IntlObject> objects;
  final IntlSettings settings;
  final encoder = const JsonEncoder.withIndent('  ');

  IntlGenerateArb({
    required this.objects,
    required this.settings,
  });

  Future<void> generate() async {
    final baseMap = await _generateBaseI18nMap();
    await _checkOutputDir();

    for (final locale in settings.locales) {
      await _createArbFileByLocale(baseMap, locale);
    }
  }

  Future<Map<String, dynamic>> _generateBaseI18nMap() async {
    final Map<String, dynamic> baseMap = {"@@locale": settings.sourceLang};
    for (var obj in objects) {
      baseMap.addEntries([
        MapEntry(obj.key, obj.icu),
        MapEntry('@${obj.key}', {
          "description": obj.description,
          "placeholders": _checkPlaceholders(obj.placeholders),
        }),
      ]);
    }

    return baseMap;
  }

  Map<String, dynamic> _checkPlaceholders(List<String> placeholders) {
    final Map<String, dynamic> placeholderMap = {};
    placeholderMap
        .addEntries(placeholders.map((e) => MapEntry(e, {})).toList());

    return placeholderMap;
  }

  Future<void> _checkOutputDir() async {
    if (!await Directory(settings.extract.outputDir).exists()) {
      await Directory(settings.extract.outputDir).create(recursive: true);
    }
  }

  Future<void> _createArbFileByLocale(
    Map<String, dynamic> baseMap,
    String locale,
  ) async {
    final localeMap = {
      ...baseMap,
      ...{
        "@@locale": locale,
      }
    };

    final localeFile = File('${settings.extract.outputDir}/intl_$locale.arb');
    final existLocaleFileString =
        localeFile.existsSync() ? await localeFile.readAsString() : '{}';

    final newLocaleMap =
        json.decode(mergeARBs(json.encode(localeMap), existLocaleFileString));

    final newMap = {
      ...newLocaleMap,
      ...{"@@last_modified": DateTime.now().toIso8601String()}
    };

    await localeFile.writeAsString(encoder.convert(newMap));
  }
}
