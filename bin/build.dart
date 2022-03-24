import 'dart:io';

import 'src/extract/intl_extract.dart';
import 'src/extract/intl_generate_arb.dart';
import 'src/extract/intl_generate_localizations.dart';
import 'src/settings/intl_settings.dart';

void main() async {
  final settings = IntlSettings.fromFile();
  var objects = IntlExtract(inputDirs: settings.extract.inputDirs).run();

  await IntlGenerateArb(objects: objects, settings: settings).generate();

  await IntlGenerateLocalizations(objects: objects, settings: settings)
      .generate();

  await Process.run(
    'flutter gen-l10n --arb-dir ${settings.extract.outputDir} --output-dir ${settings.outputDir} --template-arb-file intl_${settings.sourceLang}.arb --output-localization-file app_localizations.dart --no-nullable-getter --no-synthetic-package',
    [],
    runInShell: true,
  );
}
