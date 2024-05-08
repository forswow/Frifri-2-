// To parse this JSON data, do
//
//     final autocompleteResult = autocompleteResultFromJson(jsonString);

import 'dart:convert';

List<AutocompleteResult> autocompleteResultFromJson(String str) =>
    List<AutocompleteResult>.from(
        json.decode(str).map((x) => AutocompleteResult.fromJson(x)));

String autocompleteResultToJson(List<AutocompleteResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AutocompleteResult {
  final String id;
  final String type;
  final String code;
  final String name;
  final String countryCode;
  final String countryName;
  final String? stateCode;
  final Coordinates coordinates;
  final List<dynamic> indexStrings;
  final int weight;
  final Cases? cases;
  final Cases countryCases;
  final String? mainAirportName;
  final String? cityCode;
  final String? cityName;
  final Cases? cityCases;

  AutocompleteResult({
    required this.id,
    required this.type,
    required this.code,
    required this.name,
    required this.countryCode,
    required this.countryName,
    required this.stateCode,
    required this.coordinates,
    required this.indexStrings,
    required this.weight,
    required this.cases,
    required this.countryCases,
    this.mainAirportName,
    this.cityCode,
    this.cityName,
    this.cityCases,
  });

  factory AutocompleteResult.fromJson(Map<String, dynamic> json) =>
      AutocompleteResult(
        id: json["id"],
        type: json["type"],
        code: json["code"],
        name: json["name"],
        countryCode: json["country_code"],
        countryName: json["country_name"],
        stateCode: json["state_code"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        indexStrings: List<dynamic>.from(json["index_strings"].map((x) => x)),
        weight: json["weight"],
        cases: json["cases"] == null ? null : Cases.fromJson(json["cases"]),
        countryCases: Cases.fromJson(json["country_cases"]),
        mainAirportName: json["main_airport_name"],
        cityCode: json["city_code"],
        cityName: json["city_name"],
        cityCases: json["city_cases"] == null
            ? null
            : Cases.fromJson(json["city_cases"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "code": code,
        "name": name,
        "country_code": countryCode,
        "country_name": countryName,
        "state_code": stateCode,
        "coordinates": coordinates.toJson(),
        "index_strings": List<dynamic>.from(indexStrings.map((x) => x)),
        "weight": weight,
        "cases": cases?.toJson(),
        "country_cases": countryCases.toJson(),
        "main_airport_name": mainAirportName,
        "city_code": cityCode,
        "city_name": cityName,
        "city_cases": cityCases?.toJson(),
      };
}

class Cases {
  final String vi;
  final String tv;
  final String su;
  final String ro;
  final String pr;
  final String da;

  Cases({
    required this.vi,
    required this.tv,
    required this.su,
    required this.ro,
    required this.pr,
    required this.da,
  });

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        vi: json["vi"],
        tv: json["tv"],
        su: json["su"],
        ro: json["ro"],
        pr: json["pr"],
        da: json["da"],
      );

  Map<String, dynamic> toJson() => {
        "vi": vi,
        "tv": tv,
        "su": su,
        "ro": ro,
        "pr": pr,
        "da": da,
      };
}

class Coordinates {
  final double lon;
  final double lat;

  Coordinates({
    required this.lon,
    required this.lat,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
