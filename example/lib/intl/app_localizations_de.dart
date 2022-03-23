

import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get t975145968 => 'Flutter Demo Startseite';

  @override
  String t495287403(num value) {
    return intl.Intl.pluralLogic(
      value,
      locale: localeName,
      zero: 'Du hast die Schaltfläche noch nicht betätigt.',
      one: 'Du hast die Schaltfläche ein Mal betätigt.',
      other: 'Du hast die Schaltfläche $value Mal betätigt.',
    );
  }
}
