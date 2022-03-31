enum IntlObjectType {
  string,
  select,
  plural,
}

class IntlObject {
  final String message;
  final String icu;
  final String? description;
  final List<String> placeholders;
  final IntlObjectType type;

  IntlObject(
    this.message,
    this.icu, {
    this.description,
    this.placeholders = const [],
    this.type = IntlObjectType.string,
  });

  String get key {
    return 't${message.hashCode}';
  }

  bool get hasParams {
    return placeholders.isNotEmpty;
  }

  List<String> get params {
    final newList = [...placeholders];
    newList.removeAt(0);
    return newList;
  }

  @override
  String toString() {
    return '{message: $message, icu: $icu, decription: $description, placeholders: $placeholders}';
  }
}
