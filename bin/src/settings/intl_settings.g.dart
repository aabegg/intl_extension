// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intl_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IntlSettings _$$_IntlSettingsFromJson(Map<String, dynamic> json) =>
    _$_IntlSettings(
      sourceLang: json['sourceLang'] as String? ?? 'en',
      targetLang: (json['targetLang'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['en'],
      outputDir: json['outputDir'] as String? ?? './lib/intl',
      extract: json['extract'] == null
          ? const IntlExtractSettings()
          : IntlExtractSettings.fromJson(
              json['extract'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_IntlSettingsToJson(_$_IntlSettings instance) =>
    <String, dynamic>{
      'sourceLang': instance.sourceLang,
      'targetLang': instance.targetLang,
      'outputDir': instance.outputDir,
      'extract': instance.extract,
    };

_$_IntlExtractSettings _$$_IntlExtractSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_IntlExtractSettings(
      inputDir: json['inputDir'] as String? ?? './lib',
      outputDir: json['outputDir'] as String? ?? './intl',
    );

Map<String, dynamic> _$$_IntlExtractSettingsToJson(
        _$_IntlExtractSettings instance) =>
    <String, dynamic>{
      'inputDir': instance.inputDir,
      'outputDir': instance.outputDir,
    };
