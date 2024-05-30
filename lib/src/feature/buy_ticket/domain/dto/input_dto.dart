class AutocompleteInputDTO {
  AutocompleteInputDTO({required this.locale, required this.term});

  final String locale;
  final String term;

  // static const _types = <String>['city', 'airport', 'country'];

  Map<String, dynamic> toMap() {
    return {
      'locale': locale,
      // 'types[]': ['airport', 'city'],
      'term': term,
    };
  }
}
