// To parse this JSON data, do
//
//     final userLocation = userLocationFromJson(jsonString);

import 'dart:convert';

UserLocationQuery pricesForDatesQueryFromJson(String str) =>
    UserLocationQuery.fromJson(json.decode(str));

String pricesForDatesQueryToJson(UserLocationQuery data) =>
    json.encode(data.toJson());

class UserLocationQuery {
  final String locale;
  final String? ip;

  UserLocationQuery({
    required this.locale,
    this.ip,
  });

  factory UserLocationQuery.fromJson(Map<String, dynamic> json) =>
      UserLocationQuery(
        locale: json["locale"],
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "locale": locale,
        "ip": ip,
      };
}

UserLocation userLocationFromJson(String str) =>
    UserLocation.fromJson(json.decode(str));

String userLocationToJson(UserLocation data) => json.encode(data.toJson());

class UserLocation {
  final String iata;
  final String cityName;
  final String countryName;
  final String coordinates;

  UserLocation({
    required this.iata,
    required this.cityName,
    required this.countryName,
    required this.coordinates,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        iata: json["iata"],
        cityName: json["name"],
        countryName: json["country_name"],
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {
        "iata": iata,
        "name": cityName,
        "country_name": countryName,
        "coordinates": coordinates,
      };

  @override
  String toString() =>
      "{iata: $iata, cityName: $cityName, countryName: $countryName, coordinates: $coordinates}";
}
