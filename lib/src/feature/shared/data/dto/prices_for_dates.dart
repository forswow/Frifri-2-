// To parse this JSON data, do
//
//     final pricesForDates = pricesForDatesFromJson(jsonString);

import 'dart:convert';

PricesForDatesQuery pricesForDatesQueryFromJson(String str) =>
    PricesForDatesQuery.fromJson(json.decode(str));

String pricesForDatesQueryToJson(PricesForDatesQuery data) =>
    json.encode(data.toJson());

class PricesForDatesQuery {
  final String origin;
  final String? destination;
  final String? currency;
  final String? departureAt;
  final String? returnAt;
  final bool? unique;
  final String? sorting;
  final bool? direct;
  final int? limit;
  final int? page;
  final bool? oneWay;
  final String? market;

  PricesForDatesQuery({
    required this.origin,
    required this.destination,
    this.departureAt,
    this.currency,
    this.returnAt,
    this.unique,
    this.sorting,
    this.direct,
    this.limit,
    this.page,
    this.oneWay,
    this.market,
  });

  factory PricesForDatesQuery.fromJson(Map<String, dynamic> json) =>
      PricesForDatesQuery(
        currency: json["currency"],
        origin: json["origin"],
        destination: json["destination"],
        departureAt: json["departure_at"],
        returnAt: json["return_at"],
        unique: json["unique"],
        sorting: json["sorting"],
        direct: json["direct"],
        limit: json["limit"],
        page: json["page"],
        oneWay: json["one_way"],
        market: json["market"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "origin": origin,
        "destination": destination,
        "departure_at": departureAt,
        "return_at": returnAt,
        "unique": unique,
        "sorting": sorting,
        "direct": direct,
        "limit": limit,
        "page": page,
        "one_way": oneWay,
        "market": market,
      };
}

PricesForDates pricesForDatesFromJson(String str) =>
    PricesForDates.fromJson(json.decode(str));

String pricesForDatesToJson(PricesForDates data) => json.encode(data.toJson());

class PricesForDates {
  final List<TicketInfo> data;
  final String currency;
  final bool success;

  PricesForDates({
    required this.data,
    required this.currency,
    required this.success,
  });

  factory PricesForDates.fromJson(Map<String, dynamic> json) => PricesForDates(
        data: List<TicketInfo>.from(
            json["data"].map((x) => TicketInfo.fromJson(x))),
        currency: json["currency"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "currency": currency,
        "success": success,
      };
}

class TicketInfo {
  final String flightNumber;
  final String link;
  final String originAirport;
  final String destinationAirport;
  final DateTime departureAt;
  final String airline;
  final String destination;
  final String origin;
  final int price;
  final int returnTransfers;
  final int duration;
  final int durationTo;
  final int durationBack;
  final int transfers;

  TicketInfo({
    required this.flightNumber,
    required this.link,
    required this.originAirport,
    required this.destinationAirport,
    required this.departureAt,
    required this.airline,
    required this.destination,
    required this.origin,
    required this.price,
    required this.returnTransfers,
    required this.duration,
    required this.durationTo,
    required this.durationBack,
    required this.transfers,
  });

  factory TicketInfo.fromJson(Map<String, dynamic> json) => TicketInfo(
        flightNumber: json["flight_number"],
        link: json["link"],
        originAirport: json["origin_airport"],
        destinationAirport: json["destination_airport"],
        departureAt: DateTime.parse(json["departure_at"]),
        airline: json["airline"],
        destination: json["destination"],
        origin: json["origin"],
        price: json["price"],
        returnTransfers: json["return_transfers"],
        duration: json["duration"],
        durationTo: json["duration_to"],
        durationBack: json["duration_back"],
        transfers: json["transfers"],
      );

  Map<String, dynamic> toJson() => {
        "flight_number": flightNumber,
        "link": link,
        "origin_airport": originAirport,
        "destination_airport": destinationAirport,
        "departure_at": departureAt.toIso8601String(),
        "airline": airline,
        "destination": destination,
        "origin": origin,
        "price": price,
        "return_transfers": returnTransfers,
        "duration": duration,
        "duration_to": durationTo,
        "duration_back": durationBack,
        "transfers": transfers,
      };
}
