// The whole data class

import 'dart:convert';

import 'package:frifri/src/core/utils/logger.dart';

class TicketsSearchResultBySearchId {
  final List<TicketsChunkData> data;

  TicketsSearchResultBySearchId({required this.data});

  factory TicketsSearchResultBySearchId.fromJson(List<dynamic> json) {
    try {
      return TicketsSearchResultBySearchId(
        data: json
            .map((e) => TicketsChunkData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e, s) {
      logger.e(
        "TicketsSearchResultBySearchId.fromJson error: $e\n$s",
      );
      logger.e("--------------------");
      logger.e(
        "Response: ${jsonEncode(json)}",
      );
      Error.throwWithStackTrace(e, s);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

// The data chunk, has list of results as proposals
class TicketsChunkData {
  final List<Proposals> proposals;
  final Map<String, Airport> airports;
  final Map<String, Airlines> airlines;

  TicketsChunkData({
    required this.proposals,
    required this.airports,
    required this.airlines,
  });

  factory TicketsChunkData.fromJson(Map<String, dynamic> json) {
    // If data has ended
    if (json['proposals'] == null) {
      return TicketsChunkData(
        proposals: [],
        airports: {},
        airlines: {},
      );
    }

    return TicketsChunkData(
      proposals: (json['proposals'] as List<dynamic>)
          .map((e) => Proposals.fromJson(e))
          .toList(),
      airports: (json['airports'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, Airport.fromJson(value))),
      airlines: (json['airlines'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, Airlines.fromJson(value))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proposals': proposals.map((e) => e.toJson()).toList(),
      'airports': airports.map((key, value) => MapEntry(key, value.toJson())),
      'airlines': airlines.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class Airlines {
  final int? id;
  final String name;
  final String iataCode;

  Airlines({
    required this.id,
    required this.name,
    required this.iataCode,
  });

  factory Airlines.fromJson(Map<String, dynamic> json) {
    return Airlines(
      id: json['id'],
      name: json['name'],
      iataCode: json['iata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iata': iataCode,
    };
  }
}

class Airport {
  final String name;
  final String city;
  final String cityCode;
  final String country;
  final String countryCode;
  final String timeZone;
  final Coordinates coordinates;

  Airport({
    required this.name,
    required this.city,
    required this.cityCode,
    required this.country,
    required this.countryCode,
    required this.timeZone,
    required this.coordinates,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      name: json['name'] as String,
      city: json['city'] as String,
      cityCode: json['city_code'] as String,
      country: json['country'] as String,
      countryCode: json['country_code'] as String,
      timeZone: json['time_zone'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'city_code': cityCode,
      'country': country,
      'country_code': countryCode,
      'time_zone': timeZone,
      'coordinates': coordinates.toJson(),
    };
  }
}

class Coordinates {
  final double lat;
  final double lon;

  Coordinates({required this.lat, required this.lon});

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json['lat'].toDouble(),
        lon: json['lon'].toDouble(),
      );
}

class Proposals {
  final Terms terms;
  final List<Segment> segments;
  final int totalDurationInMinutes;

  final bool isDirect;
  final bool isCharter;
  final int maxStops;

  final List<String>? tagsAsString;

  Proposals({
    required this.terms,
    required this.segments,
    required this.totalDurationInMinutes,
    required this.tagsAsString,
    required this.isDirect,
    required this.isCharter,
    required this.maxStops,
  });

  factory Proposals.fromJson(Map<String, dynamic> json) {
    final termsAccessKey = json['terms'].keys.first;

    return Proposals(
      terms: Terms.fromJson(json['terms'][termsAccessKey]),
      segments: (json['segment'] as List<dynamic>)
          .map((e) => Segment.fromJson(e))
          .toList(),
      totalDurationInMinutes: json['total_duration'],
      tagsAsString: List<String>.from(json['tags']?.cast<String>() ?? []),
      isDirect: json['is_direct'],
      isCharter: json['is_charter'],
      maxStops: json['max_stops'],
    );
  }

  Map<String, dynamic> toJson() => {
        'terms': terms.toJson(),
        'segments': segments.map((e) => e.toJson()).toList(),
        'total_duration_in_minutes': totalDurationInMinutes,
        'tags': tagsAsString,
        'is_direct': isDirect,
        'is_charter': isCharter,
        'max_stops': maxStops,
      };
}

class Terms {
  final String currency;
  final int priceInRubles;
  final int urlCode;

  Terms({
    required this.currency,
    required this.priceInRubles,
    required this.urlCode,
  });

  factory Terms.fromJson(Map<String, dynamic> json) {
    return Terms(
      currency: json['currency'],
      priceInRubles: json['unified_price'],
      urlCode: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'unified_price': priceInRubles,
        'urlCode': urlCode,
      };
}

class Segment {
  final List<Flight> flight;

  Segment({required this.flight});

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      flight: (json['flight'] as List<dynamic>).map<Flight>((jsonObject) {
        return Flight.fromJson(jsonObject);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'flight': flight.map((flight) => flight.toJson()).toList(),
      };
}

class Flight {
  final String? aircraftName;

  final String arrivalAt; // IATA code
  final String arrivalDate; // Format: YYYY-MM-DD
  final String arrivalTime; // Format: HH:mm

  final String departureAt; // IATA code
  final String departureDate; // Format: YYYY-MM-DD
  final String departureTime; // Format: HH:mm

  final int duration; // Duration of flight in minutes

  final int delay; // Duration of stops during flight in minutes

  final String tripClass; // Y or C

  final String operatedByAirlineIataCode;

  final int departureTimestamp;
  final int arrivalTimestamp;

  Flight({
    required this.aircraftName,
    required this.arrivalAt,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.departureAt,
    required this.departureDate,
    required this.departureTime,
    required this.duration,
    required this.delay,
    required this.tripClass,
    required this.operatedByAirlineIataCode,
    required this.departureTimestamp,
    required this.arrivalTimestamp,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      aircraftName: json["aircraft"],
      arrivalAt: json["arrival"],
      arrivalDate: json["arrival_date"],
      arrivalTime: json["arrival_time"],
      departureAt: json["departure"],
      departureDate: json["departure_date"],
      departureTime: json["departure_time"],
      duration: json["duration"],
      delay: json["delay"],
      tripClass: json["trip_class"],
      operatedByAirlineIataCode: json["operated_by"],
      departureTimestamp: json["departure_timestamp"],
      arrivalTimestamp: json["arrival_timestamp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "aircraft": aircraftName,
        "arrival": arrivalAt,
        "arrival_date": arrivalDate,
        "arrival_time": arrivalTime,
        "departure": departureAt,
        "departure_date": departureDate,
        "departure_time": departureTime,
        "duration": duration,
        "delay": delay,
        "trip_class": tripClass,
        "operated_by": operatedByAirlineIataCode,
        "departure_timestamp": departureTimestamp,
        "arrival_timestamp": arrivalTimestamp,
      };
}
