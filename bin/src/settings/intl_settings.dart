import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

part 'intl_settings.freezed.dart';
part 'intl_settings.g.dart';

@freezed
class IntlSettings with _$IntlSettings {
  const IntlSettings._();
  const factory IntlSettings({
    @Default('en') String sourceLang,
    @Default(['en']) List<String> targetLang,
    @Default('./lib/intl') String outputDir,
    @Default(IntlExtractSettings()) IntlExtractSettings extract,
  }) = _IntlSettings;

  factory IntlSettings.fromJson(Map<String, dynamic> json) =>
      _$IntlSettingsFromJson(json);

  factory IntlSettings.fromFile({String file = 'intl.yaml'}) {
    const baseSettings = IntlSettings();

    final configFile = File(file);
    if (configFile.existsSync()) {
      final config = loadYaml(configFile.readAsStringSync());

      return baseSettings.copyWith(
        sourceLang: config['sourceLang'] ?? baseSettings.sourceLang,
        targetLang: YAMLHelper.toListOrNull<String>(config['targetLang']) ??
            baseSettings.targetLang,
        outputDir: config['outputDir'] ?? baseSettings.outputDir,
        extract: baseSettings.extract.copyWith(
          inputDir:
              config['extract']?['inputDir'] ?? baseSettings.extract.inputDir,
          outputDir:
              config['extract']?['outputDir'] ?? baseSettings.extract.outputDir,
        ),
      );
    }

    return baseSettings;
  }

  List<String> get locales {
    return {sourceLang, ...targetLang}.toList();
  }
}

@freezed
class IntlExtractSettings with _$IntlExtractSettings {
  const factory IntlExtractSettings({
    @Default('./lib') String inputDir,
    @Default('./intl') String outputDir,
  }) = _IntlExtractSettings;

  factory IntlExtractSettings.fromJson(Map<String, dynamic> json) =>
      _$IntlExtractSettingsFromJson(json);
}

class YAMLHelper {
  static List<T>? toListOrNull<T>(YamlList? list) {
    if (list != null) {
      return YAMLHelper.toList(list);
    }

    return null;
  }

  static List<T> toList<T>(YamlList list) {
    return list.map((e) => e as T).toList();
  }
}
