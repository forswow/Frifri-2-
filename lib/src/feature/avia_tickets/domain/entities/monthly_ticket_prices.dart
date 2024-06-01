class MonthlyTicketPricesEntity {
  List<Datum> data;
  String currency;

  final String originName;
  final String destinationName;

  MonthlyTicketPricesEntity({
    required this.data,
    required this.currency,
    required this.destinationName,
    required this.originName,
  });

  factory MonthlyTicketPricesEntity.fromJson(Map<String, dynamic> json) =>
      MonthlyTicketPricesEntity(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        currency: json["currency"],
        originName: '',
        destinationName: '',
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "currency": currency,
      };

  @override
  String toString() {
    return 'MonthlyTicketPricesEntity{data: ${data.toString()}';
  }

  MonthlyTicketPricesEntity copyWith({
    List<Datum>? data,
    String? currency,
    String? originName,
    String? destinationName,
  }) {
    return MonthlyTicketPricesEntity(
      data: data ?? this.data,
      currency: currency ?? this.currency,
      originName: originName ?? this.originName,
      destinationName: destinationName ?? this.destinationName,
    );
  }
}

class Datum {
  String origin;
  String destination;
  String originAirport;
  String destinationAirport;
  int price;
  String airline;
  String flightNumber;
  DateTime departureAt;
  DateTime returnAt;
  int transfers;
  int returnTransfers;
  int duration;
  int durationTo;
  int durationBack;
  String link;

  Datum({
    required this.origin,
    required this.destination,
    required this.originAirport,
    required this.destinationAirport,
    required this.price,
    required this.airline,
    required this.flightNumber,
    required this.departureAt,
    required this.returnAt,
    required this.transfers,
    required this.returnTransfers,
    required this.duration,
    required this.durationTo,
    required this.durationBack,
    required this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        origin: json["origin"],
        destination: json["destination"],
        originAirport: json["origin_airport"],
        destinationAirport: json["destination_airport"],
        price: json["price"],
        airline: json["airline"],
        flightNumber: json["flight_number"],
        departureAt: DateTime.parse(json["departure_at"]),
        returnAt: DateTime.parse(json["return_at"]),
        transfers: json["transfers"],
        returnTransfers: json["return_transfers"],
        duration: json["duration"],
        durationTo: json["duration_to"],
        durationBack: json["duration_back"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "origin_airport": originAirport,
        "destination_airport": destinationAirport,
        "price": price,
        "airline": airline,
        "flight_number": flightNumber,
        "departure_at": departureAt.toIso8601String(),
        "return_at": returnAt.toIso8601String(),
        "transfers": transfers,
        "return_transfers": returnTransfers,
        "duration": duration,
        "duration_to": durationTo,
        "duration_back": durationBack,
        "link": link,
      };

  @override
  String toString() {
    return 'Datum{origin: $origin, destination: $destination, originAirport: $originAirport, destinationAirport: $destinationAirport, price: $price, airline: $airline, flightNumber: $flightNumber, departureAt: $departureAt, returnAt: $returnAt, transfers: $transfers, returnTransfers: $returnTransfers, duration: $duration, durationTo: $durationTo, durationBack: $durationBack, link: $link}';
  }
}
