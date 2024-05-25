final class CountrySearchEntity {
  CountrySearchEntity({
    required this.name,
    required this.airport,
    required this.code,
    required this.countryName
  });

  final String name;
  final String? airport;
  final String code;
  final String countryName;

  factory CountrySearchEntity.fromJson(Map<String, dynamic> json) {
    return CountrySearchEntity(
      name: json['name'],
      airport: json['main_airport_name'] ?? '',
      code: json['code'],
      countryName: json['country_name']
    );
  }

  @override
  String toString() {
    return 'CountrySearchEntity{name: $name, airport: $airport, code: $code, countryName: $countryName}';
  }
}
