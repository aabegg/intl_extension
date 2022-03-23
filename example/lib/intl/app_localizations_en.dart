

import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get t975145968 => 'Flutter Demo Home Page';

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
}
