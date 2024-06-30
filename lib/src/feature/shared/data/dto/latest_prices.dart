// To parse this JSON data, do
//
//     final ticketInfo = ticketInfoFromJson(jsonString);

import 'dart:convert';

LatestPricesQuery pricesForDatesQueryFromJson(String str) =>
    LatestPricesQuery.fromJson(json.decode(str));

String pricesForDatesQueryToJson(LatestPricesQuery data) =>
    json.encode(data.toJson());

class LatestPricesQuery {
  final String origin;
  final String destination;
  final String? currency;
  final int? beginningOfPeriod;
  final String? periodType;
  final String? groupBy;
  final bool? oneWay;
  final int? page;
  final String? market;
  final int? limit;
  final String? sorting;
  final int? tripDuration;
  final int? tripClass;

  LatestPricesQuery({
    required this.origin,
    required this.destination,
    this.currency,
    this.beginningOfPeriod,
    this.periodType,
    this.groupBy,
    this.oneWay,
    this.page,
    this.market,
    this.limit,
    this.sorting,
    this.tripDuration,
    this.tripClass,
  });

  factory LatestPricesQuery.fromJson(Map<String, dynamic> json) =>
      LatestPricesQuery(
        currency: json['currency'],
        origin: json['origin'],
        destination: json['destination'],
        beginningOfPeriod: json['beginning_of_period'],
        periodType: json['period_type'],
        groupBy: json['group_by'],
        oneWay: json['one_way '],
        page: json['page'],
        market: json['market'],
        limit: json['limit'],
        sorting: json['sorting'],
        tripDuration: json['trip_duration'],
        tripClass: json['trip_class'],
      );

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'origin': origin,
        'destination': destination,
        'beginning_of_period': beginningOfPeriod,
        'period_type': periodType,
        'group_by': groupBy,
        'one_way ': oneWay,
        'page': page,
        'market': market,
        'limit': limit,
        'sorting': sorting,
        'trip_duration': tripDuration,
        'trip_class': tripClass,
      };
}

LatestPrices ticketInfoFromJson(String str) =>
    LatestPrices.fromJson(json.decode(str));

String ticketInfoToJson(LatestPrices data) => json.encode(data.toJson());

class LatestPrices {
  final List<PriceInfo> data;
  final String currency;
  final bool success;

  LatestPrices({
    required this.data,
    required this.currency,
    required this.success,
  });

  factory LatestPrices.fromJson(Map<String, dynamic> json) => LatestPrices(
        data: List<PriceInfo>.from(
            json['data'].map((x) => PriceInfo.fromJson(x))),
        currency: json['currency'],
        success: json['success'],
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'currency': currency,
        'success': success,
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
        departDate: DateTime.parse(json['depart_date']),
        origin: json['origin'],
        destination: json['destination'],
        gate: json['gate'],
        returnDate: json['return_date'],
        foundAt: DateTime.parse(json['found_at']),
        tripClass: json['trip_class'],
        value: json['value'],
        numberOfChanges: json['number_of_changes'],
        duration: json['duration'],
        distance: json['distance'],
        showToAffiliates: json['show_to_affiliates'],
        actual: json['actual'],
      );

  Map<String, dynamic> toJson() => {
        'depart_date': departDate.toIso8601String(),
        'origin': origin,
        'destination': destination,
        'gate': gate,
        'return_date': returnDate,
        'found_at': foundAt.toIso8601String(),
        'trip_class': tripClass,
        'value': value,
        'number_of_changes': numberOfChanges,
        'duration': duration,
        'distance': distance,
        'show_to_affiliates': showToAffiliates,
        'actual': actual,
      };

  @override
  String toString() {
    return 'PriceInfo{'
        'departDate: $departDate, '
        'origin: $origin, '
        'destination: $destination, '
        'gate: $gate, '
        'returnDate: $returnDate, '
        'foundAt: $foundAt, '
        'tripClass: $tripClass, '
        'value: $value, '
        'numberOfChanges: $numberOfChanges, '
        'duration: $duration, '
        'distance: $distance, '
        'showToAffiliates: $showToAffiliates, '
        'actual: $actual'
        '}';
  }
}
