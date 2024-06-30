import 'dart:convert';

String ticketsSearchQueryToJson(TicketsSearchQuery data) =>
    json.encode(data.toJson());

class TicketsSearchQuery {
  TicketsSearchQuery({
    this.marker = '406687',
    this.host = 'frifri.ge',
    this.userIp = '200.44.76.149',
    this.locale = 'ru',
    this.tripClass = 'Y',
    this.passengers,
    this.segments = const [],
  });

  String marker;
  String host;
  String? userIp;
  String locale;
  String tripClass;
  Passengers? passengers;
  List<Segment> segments;

  TicketsSearchQuery copyWith({
    String? marker,
    String? host,
    String? userIp,
    String? locale,
    String? tripClass,
    Passengers? passengers,
    List<Segment>? segments,
  }) {
    return TicketsSearchQuery(
      marker: marker ?? this.marker,
      host: host ?? this.host,
      userIp: userIp ?? this.userIp,
      locale: locale ?? this.locale,
      tripClass: tripClass ?? this.tripClass,
      passengers: passengers ?? this.passengers,
      segments: segments ?? this.segments,
    );
  }

  Map<String, dynamic> toJson() => {
        'marker': marker,
        'host': host,
        'user_ip': userIp,
        'locale': locale,
        'trip_class': tripClass,
        'passengers': passengers!.toJson(),
        'segments': List<dynamic>.from(segments.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'TicketsSearchQuery{'
        'marker: $marker, '
        'host: $host, '
        'userIp: $userIp, '
        'locale: $locale, '
        'tripClass: $tripClass, '
        'passengers: $passengers, '
        'segments: $segments'
        '}';
  }
}

class Passengers {
  final int? adults;
  final int? children;
  final int? infants;

  Passengers({
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
  });

  Passengers copyWith({
    final int? adults,
    final int? children,
    final int? infants,
  }) {
    return Passengers(
      adults: adults ?? this.adults,
      children: children ?? this.children,
      infants: infants ?? this.infants,
    );
  }

  factory Passengers.fromJson(Map<String, dynamic> json) => Passengers(
        adults: json['adults'],
        children: json['children'],
        infants: json['infants'],
      );

  Map<String, dynamic> toJson() => {
        'adults': adults,
        'children': children,
        'infants': infants,
      };
}

class Segment {
  Segment({
    this.origin = '',
    this.destination = '',
    this.date = '',
  });

  final String origin;
  final String destination;
  final String date;

  Segment copyWith({
    final String? origin,
    final String? destination,
    final String? date,
  }) {
    return Segment(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      date: date ?? this.date,
    );
  }

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        origin: json['origin'],
        destination: json['destination'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'origin': origin,
        'destination': destination,
        'date': date,
      };
}
