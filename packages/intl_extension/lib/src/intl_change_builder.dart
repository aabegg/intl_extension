import 'package:flutter/widgets.dart';

import 'intl_localizations.dart';

typedef IntlLocaleBuilder = Widget Function(
  BuildContext context,
  Locale locale,
);

class IntlChangeBuilder extends StatefulWidget {
  const IntlChangeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final IntlLocaleBuilder builder;

  @override
  State<IntlChangeBuilder> createState() => _IntlChangeBuilderState();
}

class _IntlChangeBuilderState extends State<IntlChangeBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: IntlLocalizations.locale,
      stream: IntlLocalizations.stream,
      builder: (context, AsyncSnapshot<Locale> snapshot) {
        if (snapshot.hasData) {
          return widget.builder(context, snapshot.data!);
        }
        return Container();
      },
    );
  }
}
