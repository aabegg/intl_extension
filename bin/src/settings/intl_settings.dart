import 'dart:io';
import 'package:yaml/yaml.dart';

class IntlSettings {
  final String sourceLang;
  final List<String> targetLang;
  final String outputDir;
  final IntlExtractSettings extract;

  const IntlSettings({
    this.sourceLang = 'en',
    this.targetLang = const ['en'],
    this.outputDir = '.lib/intl',
    this.extract = const IntlExtractSettings(),
  });

  factory IntlSettings.fromFile({String file = 'intl.yaml'}) {
    const baseSettings = IntlSettings();

    final configFile = File(file);
    if (configFile.existsSync()) {
      final config = loadYaml(configFile.readAsStringSync());

      return IntlSettings(
        sourceLang: config['sourceLang'] ?? baseSettings.sourceLang,
        targetLang:
            YAMLHelper.toListOrNull<String>(config['targetLang']) ?? baseSettings.targetLang,
        outputDir: config['outputDir'] ?? baseSettings.outputDir,
        extract: IntlExtractSettings(
          inputDirs: YAMLHelper.toListOrNull<String>(config['extract']?['inputDirs']) ??
              baseSettings.extract.inputDirs,
          outputDir: config['extract']?['outputDir'] ?? baseSettings.extract.outputDir,
        ),
      );
    }

    return baseSettings;
  }

  List<String> get locales {
    return {sourceLang, ...targetLang}.toList();
  }
}

class IntlExtractSettings {
  final List<String> inputDirs;
  final String outputDir;

  const IntlExtractSettings({
    this.inputDirs = const ['./lib'],
    this.outputDir = './intl',
  });
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
