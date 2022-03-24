// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'intl_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IntlSettings _$IntlSettingsFromJson(Map<String, dynamic> json) {
  return _IntlSettings.fromJson(json);
}

/// @nodoc
class _$IntlSettingsTearOff {
  const _$IntlSettingsTearOff();

  _IntlSettings call(
      {String sourceLang = 'en',
      List<String> targetLang = const ['en'],
      String outputDir = './lib/intl',
      IntlExtractSettings extract = const IntlExtractSettings()}) {
    return _IntlSettings(
      sourceLang: sourceLang,
      targetLang: targetLang,
      outputDir: outputDir,
      extract: extract,
    );
  }

  IntlSettings fromJson(Map<String, Object?> json) {
    return IntlSettings.fromJson(json);
  }
}

/// @nodoc
const $IntlSettings = _$IntlSettingsTearOff();

/// @nodoc
mixin _$IntlSettings {
  String get sourceLang => throw _privateConstructorUsedError;
  List<String> get targetLang => throw _privateConstructorUsedError;
  String get outputDir => throw _privateConstructorUsedError;
  IntlExtractSettings get extract => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntlSettingsCopyWith<IntlSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntlSettingsCopyWith<$Res> {
  factory $IntlSettingsCopyWith(
          IntlSettings value, $Res Function(IntlSettings) then) =
      _$IntlSettingsCopyWithImpl<$Res>;
  $Res call(
      {String sourceLang,
      List<String> targetLang,
      String outputDir,
      IntlExtractSettings extract});

  $IntlExtractSettingsCopyWith<$Res> get extract;
}

/// @nodoc
class _$IntlSettingsCopyWithImpl<$Res> implements $IntlSettingsCopyWith<$Res> {
  _$IntlSettingsCopyWithImpl(this._value, this._then);

  final IntlSettings _value;
  // ignore: unused_field
  final $Res Function(IntlSettings) _then;

  @override
  $Res call({
    Object? sourceLang = freezed,
    Object? targetLang = freezed,
    Object? outputDir = freezed,
    Object? extract = freezed,
  }) {
    return _then(_value.copyWith(
      sourceLang: sourceLang == freezed
          ? _value.sourceLang
          : sourceLang // ignore: cast_nullable_to_non_nullable
              as String,
      targetLang: targetLang == freezed
          ? _value.targetLang
          : targetLang // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outputDir: outputDir == freezed
          ? _value.outputDir
          : outputDir // ignore: cast_nullable_to_non_nullable
              as String,
      extract: extract == freezed
          ? _value.extract
          : extract // ignore: cast_nullable_to_non_nullable
              as IntlExtractSettings,
    ));
  }

  @override
  $IntlExtractSettingsCopyWith<$Res> get extract {
    return $IntlExtractSettingsCopyWith<$Res>(_value.extract, (value) {
      return _then(_value.copyWith(extract: value));
    });
  }
}

/// @nodoc
abstract class _$IntlSettingsCopyWith<$Res>
    implements $IntlSettingsCopyWith<$Res> {
  factory _$IntlSettingsCopyWith(
          _IntlSettings value, $Res Function(_IntlSettings) then) =
      __$IntlSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sourceLang,
      List<String> targetLang,
      String outputDir,
      IntlExtractSettings extract});

  @override
  $IntlExtractSettingsCopyWith<$Res> get extract;
}

/// @nodoc
class __$IntlSettingsCopyWithImpl<$Res> extends _$IntlSettingsCopyWithImpl<$Res>
    implements _$IntlSettingsCopyWith<$Res> {
  __$IntlSettingsCopyWithImpl(
      _IntlSettings _value, $Res Function(_IntlSettings) _then)
      : super(_value, (v) => _then(v as _IntlSettings));

  @override
  _IntlSettings get _value => super._value as _IntlSettings;

  @override
  $Res call({
    Object? sourceLang = freezed,
    Object? targetLang = freezed,
    Object? outputDir = freezed,
    Object? extract = freezed,
  }) {
    return _then(_IntlSettings(
      sourceLang: sourceLang == freezed
          ? _value.sourceLang
          : sourceLang // ignore: cast_nullable_to_non_nullable
              as String,
      targetLang: targetLang == freezed
          ? _value.targetLang
          : targetLang // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outputDir: outputDir == freezed
          ? _value.outputDir
          : outputDir // ignore: cast_nullable_to_non_nullable
              as String,
      extract: extract == freezed
          ? _value.extract
          : extract // ignore: cast_nullable_to_non_nullable
              as IntlExtractSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IntlSettings extends _IntlSettings {
  const _$_IntlSettings(
      {this.sourceLang = 'en',
      this.targetLang = const ['en'],
      this.outputDir = './lib/intl',
      this.extract = const IntlExtractSettings()})
      : super._();

  factory _$_IntlSettings.fromJson(Map<String, dynamic> json) =>
      _$$_IntlSettingsFromJson(json);

  @JsonKey()
  @override
  final String sourceLang;
  @JsonKey()
  @override
  final List<String> targetLang;
  @JsonKey()
  @override
  final String outputDir;
  @JsonKey()
  @override
  final IntlExtractSettings extract;

  @override
  String toString() {
    return 'IntlSettings(sourceLang: $sourceLang, targetLang: $targetLang, outputDir: $outputDir, extract: $extract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IntlSettings &&
            const DeepCollectionEquality()
                .equals(other.sourceLang, sourceLang) &&
            const DeepCollectionEquality()
                .equals(other.targetLang, targetLang) &&
            const DeepCollectionEquality().equals(other.outputDir, outputDir) &&
            const DeepCollectionEquality().equals(other.extract, extract));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sourceLang),
      const DeepCollectionEquality().hash(targetLang),
      const DeepCollectionEquality().hash(outputDir),
      const DeepCollectionEquality().hash(extract));

  @JsonKey(ignore: true)
  @override
  _$IntlSettingsCopyWith<_IntlSettings> get copyWith =>
      __$IntlSettingsCopyWithImpl<_IntlSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IntlSettingsToJson(this);
  }
}

abstract class _IntlSettings extends IntlSettings {
  const factory _IntlSettings(
      {String sourceLang,
      List<String> targetLang,
      String outputDir,
      IntlExtractSettings extract}) = _$_IntlSettings;
  const _IntlSettings._() : super._();

  factory _IntlSettings.fromJson(Map<String, dynamic> json) =
      _$_IntlSettings.fromJson;

  @override
  String get sourceLang;
  @override
  List<String> get targetLang;
  @override
  String get outputDir;
  @override
  IntlExtractSettings get extract;
  @override
  @JsonKey(ignore: true)
  _$IntlSettingsCopyWith<_IntlSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

IntlExtractSettings _$IntlExtractSettingsFromJson(Map<String, dynamic> json) {
  return _IntlExtractSettings.fromJson(json);
}

/// @nodoc
class _$IntlExtractSettingsTearOff {
  const _$IntlExtractSettingsTearOff();

  _IntlExtractSettings call(
      {List<String> inputDirs = const ['./lib'], String outputDir = './intl'}) {
    return _IntlExtractSettings(
      inputDirs: inputDirs,
      outputDir: outputDir,
    );
  }

  IntlExtractSettings fromJson(Map<String, Object?> json) {
    return IntlExtractSettings.fromJson(json);
  }
}

/// @nodoc
const $IntlExtractSettings = _$IntlExtractSettingsTearOff();

/// @nodoc
mixin _$IntlExtractSettings {
  List<String> get inputDirs => throw _privateConstructorUsedError;
  String get outputDir => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntlExtractSettingsCopyWith<IntlExtractSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntlExtractSettingsCopyWith<$Res> {
  factory $IntlExtractSettingsCopyWith(
          IntlExtractSettings value, $Res Function(IntlExtractSettings) then) =
      _$IntlExtractSettingsCopyWithImpl<$Res>;
  $Res call({List<String> inputDirs, String outputDir});
}

/// @nodoc
class _$IntlExtractSettingsCopyWithImpl<$Res>
    implements $IntlExtractSettingsCopyWith<$Res> {
  _$IntlExtractSettingsCopyWithImpl(this._value, this._then);

  final IntlExtractSettings _value;
  // ignore: unused_field
  final $Res Function(IntlExtractSettings) _then;

  @override
  $Res call({
    Object? inputDirs = freezed,
    Object? outputDir = freezed,
  }) {
    return _then(_value.copyWith(
      inputDirs: inputDirs == freezed
          ? _value.inputDirs
          : inputDirs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outputDir: outputDir == freezed
          ? _value.outputDir
          : outputDir // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$IntlExtractSettingsCopyWith<$Res>
    implements $IntlExtractSettingsCopyWith<$Res> {
  factory _$IntlExtractSettingsCopyWith(_IntlExtractSettings value,
          $Res Function(_IntlExtractSettings) then) =
      __$IntlExtractSettingsCopyWithImpl<$Res>;
  @override
  $Res call({List<String> inputDirs, String outputDir});
}

/// @nodoc
class __$IntlExtractSettingsCopyWithImpl<$Res>
    extends _$IntlExtractSettingsCopyWithImpl<$Res>
    implements _$IntlExtractSettingsCopyWith<$Res> {
  __$IntlExtractSettingsCopyWithImpl(
      _IntlExtractSettings _value, $Res Function(_IntlExtractSettings) _then)
      : super(_value, (v) => _then(v as _IntlExtractSettings));

  @override
  _IntlExtractSettings get _value => super._value as _IntlExtractSettings;

  @override
  $Res call({
    Object? inputDirs = freezed,
    Object? outputDir = freezed,
  }) {
    return _then(_IntlExtractSettings(
      inputDirs: inputDirs == freezed
          ? _value.inputDirs
          : inputDirs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outputDir: outputDir == freezed
          ? _value.outputDir
          : outputDir // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IntlExtractSettings implements _IntlExtractSettings {
  const _$_IntlExtractSettings(
      {this.inputDirs = const ['./lib'], this.outputDir = './intl'});

  factory _$_IntlExtractSettings.fromJson(Map<String, dynamic> json) =>
      _$$_IntlExtractSettingsFromJson(json);

  @JsonKey()
  @override
  final List<String> inputDirs;
  @JsonKey()
  @override
  final String outputDir;

  @override
  String toString() {
    return 'IntlExtractSettings(inputDirs: $inputDirs, outputDir: $outputDir)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IntlExtractSettings &&
            const DeepCollectionEquality().equals(other.inputDirs, inputDirs) &&
            const DeepCollectionEquality().equals(other.outputDir, outputDir));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inputDirs),
      const DeepCollectionEquality().hash(outputDir));

  @JsonKey(ignore: true)
  @override
  _$IntlExtractSettingsCopyWith<_IntlExtractSettings> get copyWith =>
      __$IntlExtractSettingsCopyWithImpl<_IntlExtractSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IntlExtractSettingsToJson(this);
  }
}

abstract class _IntlExtractSettings implements IntlExtractSettings {
  const factory _IntlExtractSettings(
      {List<String> inputDirs, String outputDir}) = _$_IntlExtractSettings;

  factory _IntlExtractSettings.fromJson(Map<String, dynamic> json) =
      _$_IntlExtractSettings.fromJson;

  @override
  List<String> get inputDirs;
  @override
  String get outputDir;
  @override
  @JsonKey(ignore: true)
  _$IntlExtractSettingsCopyWith<_IntlExtractSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
