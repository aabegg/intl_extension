

import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get t975145968 => 'Flutter Demo Home Page';

  @override
  String get t1017881318 => 'SWITCH TO ENGLISH';

  @override
  String get t67849586 => 'SWITCH TO GERMAN';

  @override
  String t495287403(num value) {
    return intl.Intl.pluralLogic(
      value,
      locale: localeName,
      zero: 'You have not pushed the button yet.',
      one: 'You pushed the button one',
      other: 'You have pushed the button $value times.',
    );
  }

  @override
  String t907765343(Object value) {
    return intl.Intl.select(
      value,
      {
        'male': 'A man comes',
        'female': 'A woman comes',
        'other': 'Someone comes'
      },
      desc: 'Someone comes'
    );
  }
}
