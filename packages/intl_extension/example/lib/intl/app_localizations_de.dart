

import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get t975145968 => 'Flutter Demo Startseite';

  @override
  String get t1017881318 => 'Wechseln zu Englisch';

  @override
  String get t67849586 => 'Wechseln zu Deutsch';

  @override
  String t495287403(num value) {
    return intl.Intl.pluralLogic(
      value,
      locale: localeName,
      zero: 'Du hast die Schaltfläche noch nicht betätigt.',
      one: 'Du hast die Schaltfläche ein Mal betätigt',
      other: 'Du hast die Schaltfläche $value Mal betätigt.',
    );
  }

  @override
  String t907765343(Object value) {
    return intl.Intl.select(
      value,
      {
        'male': 'Ein Mann kommt',
        'female': 'Eine Frau kommt',
        'other': 'Jemand kommt'
      },
      desc: 'Someone comes'
    );
  }
}
