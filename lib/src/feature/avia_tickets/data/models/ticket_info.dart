// To parse this JSON data, do
//
//     final pricesForDates = pricesForDatesFromJson(jsonString);

import 'dart:convert';

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
