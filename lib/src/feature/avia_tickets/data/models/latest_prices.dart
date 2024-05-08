// To parse this JSON data, do
//
//     final ticketInfo = ticketInfoFromJson(jsonString);

import 'dart:convert';

LatestPricesResult ticketInfoFromJson(String str) =>
    LatestPricesResult.fromJson(json.decode(str));

String ticketInfoToJson(LatestPricesResult data) => json.encode(data.toJson());

class LatestPricesResult {
  final List<PriceInfo> data;
  final String currency;
  final bool success;

  LatestPricesResult({
    required this.data,
    required this.currency,
    required this.success,
  });

  factory LatestPricesResult.fromJson(Map<String, dynamic> json) =>
      LatestPricesResult(
        data: List<PriceInfo>.from(
            json["data"].map((x) => PriceInfo.fromJson(x))),
        currency: json["currency"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "currency": currency,
        "success": success,
      };
}

class PriceInfo {
  final DateTime departDate;
  final String origin;
  final String destination;
  final String gate;
  final String returnDate;
  final DateTime foundAt;
  final int tripClass;
  final int value;
  final int numberOfChanges;
  final int duration;
  final int distance;
  final bool showToAffiliates;
  final bool actual;

  PriceInfo({
    required this.departDate,
    required this.origin,
    required this.destination,
    required this.gate,
    required this.returnDate,
    required this.foundAt,
    required this.tripClass,
    required this.value,
    required this.numberOfChanges,
    required this.duration,
    required this.distance,
    required this.showToAffiliates,
    required this.actual,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        departDate: DateTime.parse(json["depart_date"]),
        origin: json["origin"],
        destination: json["destination"],
        gate: json["gate"],
        returnDate: json["return_date"],
        foundAt: DateTime.parse(json["found_at"]),
        tripClass: json["trip_class"],
        value: json["value"],
        numberOfChanges: json["number_of_changes"],
        duration: json["duration"],
        distance: json["distance"],
        showToAffiliates: json["show_to_affiliates"],
        actual: json["actual"],
      );

  Map<String, dynamic> toJson() => {
        "depart_date": departDate.toIso8601String(),
        "origin": origin,
        "destination": destination,
        "gate": gate,
        "return_date": returnDate,
        "found_at": foundAt.toIso8601String(),
        "trip_class": tripClass,
        "value": value,
        "number_of_changes": numberOfChanges,
        "duration": duration,
        "distance": distance,
        "show_to_affiliates": showToAffiliates,
        "actual": actual,
      };
}
