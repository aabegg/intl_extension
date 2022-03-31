import 'intl_localizations.dart';

extension IntlExtension on String {
  String intl({
    Map<String, String> params = const {},
  }) {
    return IntlLocalizations.i18n(this, params: params);
  }

  String intlSelect({
    required String value,
    required Map<String, String>? variants,
    Map<String, String> params = const {},
  }) {
    return IntlLocalizations.i18nSelect(this, value: value, params: params);
  }

  String intlPlural({
    required int value,
    String? zero,
    String? one,
    Map<String, String> params = const {},
  }) {
    return IntlLocalizations.i18nPlural(this, value: value, params: params);
  }
}
