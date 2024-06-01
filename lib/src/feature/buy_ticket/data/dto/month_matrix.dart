// To parse this JSON data, do
//
//     final monthMatrixQuery = monthMatrixQueryFromJson(jsonString);

import 'dart:convert';

MonthMatrixQuery monthMatrixQueryFromJson(String str) =>
    MonthMatrixQuery.fromJson(json.decode(str));

String monthMatrixQueryToJson(MonthMatrixQuery data) =>
    json.encode(data.toJson());

class MonthMatrixQuery {
  final String currency;
  final String origin;
  final String destination;
  final DateTime month;
  final bool? showToAffiliates;
  final String? market;
  final int? tripDuration;
  final bool? oneWay;

  MonthMatrixQuery({
    required this.currency,
    required this.origin,
    required this.destination,
    required this.month,
    this.showToAffiliates,
    this.market,
    this.tripDuration,
    this.oneWay,
  });

  factory MonthMatrixQuery.fromJson(Map<String, dynamic> json) =>
      MonthMatrixQuery(
        currency: json["currency"],
        origin: json["origin"],
        destination: json["destination"],
        month: DateTime.parse(json["month"]),
        showToAffiliates: json["show_to_affiliates"],
        market: json["market"],
        tripDuration: json["trip_duration"],
        oneWay: json["one_way"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "origin": origin,
        "destination": destination,
        "month":
            "${month.year.toString().padLeft(4, '0')}-${month.month.toString().padLeft(2, '0')}-${month.day.toString().padLeft(2, '0')}",
        "show_to_affiliates": showToAffiliates,
        "market": market,
        "trip_duration": tripDuration,
        "one_way": oneWay,
      };
}

MonthMatrix monthMatrixFromJson(String str) =>
    MonthMatrix.fromJson(json.decode(str));

String monthMatrixToJson(MonthMatrix data) => json.encode(data.toJson());

class MonthMatrix {
  final List<MonthMatrixDayInfo> data;
  final String currency;
  final bool success;

  final String origin;
  final String destination;

  MonthMatrix({
    required this.data,
    required this.currency,
    required this.success,
    required this.origin,
    required this.destination,
  });

  factory MonthMatrix.fromJson(Map<String, dynamic> json) => MonthMatrix(
        data: List<MonthMatrixDayInfo>.from(
            json["data"].map((x) => MonthMatrixDayInfo.fromJson(x))),
        currency: json["currency"],
        success: json["success"],
    origin: '',
    destination: ''
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "currency": currency,
        "success": success,
      };

  MonthMatrix copyWith({
    List<MonthMatrixDayInfo>? data,
    String? currency,
    bool? success,
    String? origin,
    String? destination,
  }) {
    return MonthMatrix(
      data: data ?? this.data,
      currency: currency ?? this.currency,
      success: success ?? this.success,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
    );
  }
}

class MonthMatrixDayInfo {
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

  MonthMatrixDayInfo({
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

  factory MonthMatrixDayInfo.fromJson(Map<String, dynamic> json) =>
      MonthMatrixDayInfo(
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
        "depart_date":
            "${departDate.year.toString().padLeft(4, '0')}-${departDate.month.toString().padLeft(2, '0')}-${departDate.day.toString().padLeft(2, '0')}",
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
