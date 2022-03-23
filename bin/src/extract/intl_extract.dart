// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';
import 'dart:io';

import 'intl_object.dart';

class IntlExtract {
  final String inputDir;

  IntlExtract({
    required this.inputDir,
  });

  List<IntlObject> run() {
    var libDir = Directory(inputDir);
    List<IntlObject> sourceObjects = [];
    for (var f in libDir.listSync(recursive: true)) {
      if (f is File && f.path.endsWith(".dart")) {
        sourceObjects += processFile(f);
      }
    }
    return sourceObjects;
  }

  List<IntlObject> processFile(File f) {
    return parseFile(f.readAsStringSync());
  }

  List<IntlObject> parseFile(String s) {
    return DartFileExtractor(trimLeadingWhitespace(s)).extract();
  }

  String trimLeadingWhitespace(String s) {
    var lines = LineSplitter.split(s);
    final trimmedLines = lines.map((e) => e.trim());
    return trimmedLines.join();
  }
}

class DartFileExtractor {
  final String source;

  final RegExp standardRegex =
      RegExp("(?<=')[^']+(?='[^'a-zA-Z0-9]*\.\\bintl\\b)", dotAll: true);

  final RegExp pluralRegex =
      RegExp("(?<=')[^']+(?='\.\\bintlPlural\(\\b([^)]*)\))", dotAll: true);

  final RegExp pluralExtractZeroRegex = RegExp("(?<=zero:.*')(((?!').)*)(?=')");
  final RegExp pluralExtractOneRegex = RegExp("(?<=one:.*')(((?!').)*)(?=')");

  final RegExp selectRegex =
      RegExp("(?<=')[^']+(?='\.\\bintlSelect\(\\b([^)]*)\))", dotAll: true);

  final RegExp selectExtractRegex = RegExp("{.*}");

  final RegExp placeholderInMessageRegex = RegExp("{(.[^{}]*)}");

  DartFileExtractor(this.source);

  List<IntlObject> extract() {
    return [
      ..._parseStandards(),
      ..._parsePlurals(),
      ..._parseSelects(),
    ];
  }

  List<IntlObject> _parseStandards() {
    final allMatches = standardRegex.allMatches(source);

    return allMatches.map((e) {
      final String message = e.group(0) ?? '';

      return IntlObject(
        message,
        message,
        description: message,
        placeholders: _checkForPlaceholders(message).toSet().toList(),
        type: IntlObjectType.string,
      );
    }).toList();
  }

  List<IntlObject> _parsePlurals() {
    final allMatches = pluralRegex.allMatches(source);

    return allMatches.map((e) {
      List<String> placeholders = ['value'];
      final String message = e.group(0) ?? '';
      final String options = e.group(2) ?? '';

      String icuMessage = '{value, plural,';

      final matchesZero = pluralExtractZeroRegex.firstMatch(options);
      if (matchesZero != null) {
        final String zeroMessage = matchesZero.group(0)!;
        icuMessage += ' =0{$zeroMessage}';
        placeholders.addAll(_checkForPlaceholders(zeroMessage));
      }

      final matchesOne = pluralExtractOneRegex.firstMatch(options);
      if (matchesOne != null) {
        final String oneMessage = matchesOne.group(0)!;
        icuMessage += ' =1{$oneMessage}';
        placeholders.addAll(_checkForPlaceholders(oneMessage));
      }

      icuMessage += ' other{$message}}';
      placeholders.addAll(_checkForPlaceholders(message));

      return IntlObject(
        message,
        icuMessage,
        description: message,
        placeholders: placeholders.toSet().toList(),
        type: IntlObjectType.plural,
      );
    }).toList();
  }

  List<IntlObject> _parseSelects() {
    final allMatches = selectRegex.allMatches(source);

    return allMatches.map((e) {
      List<String> placeholders = ['value'];
      final String message = e.group(0) ?? '';
      final String options = e.group(2) ?? '';

      String icuMessage = '{value, select,';

      final matchVariants = selectExtractRegex.firstMatch(options);
      if (matchVariants != null) {
        final fullString = matchVariants.group(0)!;

        final paramsIndex = fullString.indexOf(',params:');
        final variantsIndex = fullString.indexOf(',variants:');

        String variantsString;
        if (variantsIndex >= 0) {
          variantsString = fullString.substring(variantsIndex + 10);
        } else {
          variantsString = paramsIndex >= 0
              ? fullString.substring(0, paramsIndex - 1) + '}'
              : fullString;
        }

        final Map<String, dynamic> variants = jsonDecode(variantsString);

        variants.forEach((key, value) {
          icuMessage += ' $key{$value}';
          placeholders.addAll(_checkForPlaceholders(value));
        });
      }

      icuMessage += ' other{$message}}';
      placeholders.addAll(_checkForPlaceholders(message));

      return IntlObject(
        message,
        icuMessage,
        description: message,
        placeholders: placeholders.toSet().toList(),
        type: IntlObjectType.select,
      );
    }).toList();
  }

  List<String> _checkForPlaceholders(String message) {
    final allMatches = placeholderInMessageRegex.allMatches(message);
    if (allMatches.isNotEmpty) {
      return allMatches.map((e) => e.group(1) ?? '').toList();
    }

    return [];
  }
}
