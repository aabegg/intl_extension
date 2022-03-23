import 'package:flutter/material.dart';

import 'intl_localizations.dart';

typedef IntlChangeBuilder = Widget Function(
  BuildContext context,
  Locale locale,
);

class IntlChangeListener extends StatefulWidget {
  const IntlChangeListener({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final IntlChangeBuilder builder;

  @override
  State<IntlChangeListener> createState() => _IntlChangeListenerState();
}

class _IntlChangeListenerState extends State<IntlChangeListener>
    with WidgetsBindingObserver {
  late Locale locale;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this); // Subscribe to changes
    locale = IntlLocalizations.locale;
    super.initState();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    setState(() {
      locale = IntlLocalizations.calcAndSetLocale();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, locale);
  }
}
