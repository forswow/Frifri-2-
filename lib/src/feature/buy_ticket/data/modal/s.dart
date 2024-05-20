// i
//
//   Map<String, dynamic> jsonData = jsonDecode(jsonString);
//
//   // Parse JSON data
//   List<Proposal> proposals = (jsonData['proposals'] as List)
//       .map((proposal) => Proposal.fromJson(proposal))
//       .toList();
//
//   proposals.forEach((proposal) {
//     print(proposal);
//   });
// }

class Proposal {
  // final Map<String, dynamic> terms;
  final List<Segment>? segments;

  Proposal({ this.segments});

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      // terms: json['terms'],
      segments: json['segment'] != null
          ? (json['segment'] as List)
          .map((segment) => Segment.fromJson(segment))
          .toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'Proposal(terms:  segments: $segments)';
  }
}

class Segment {
  final List<Flight> flights;
  final Rating? rating;
  final List<Transfer>? transfers;

  Segment({required this.flights, this.rating, this.transfers});

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      flights: (json['flight'] as List)
          .map((flight) => Flight.fromJson(flight))
          .toList(),
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      transfers: json['transfers'] != null
          ? (json['transfers'] as List)
          .map((transfer) => Transfer.fromJson(transfer))
          .toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'Segment(flights: $flights, rating: $rating, transfers: $transfers)';
  }
}

class Flight {
  final String arrival;
  final String aircraft;
  final int localDepartureTimestamp;
  final String operatingCarrier;
  final String operatedBy;
  final int duration;
  final int localArrivalTimestamp;
  final String departureDate;
  final String departureTime;
  final int departureTimestamp;
  final String arrivalDate;
  final String arrivalTime;
  final int arrivalTimestamp;
  final int delay;
  final String departure;
  final String equipment;
  final String marketingCarrier;
  final double rating;
  final dynamic technicalStops;
  final String tripClass;
  final String number;

  Flight({
    required this.arrival,
    required this.aircraft,
    required this.localDepartureTimestamp,
    required this.operatingCarrier,
    required this.operatedBy,
    required this.duration,
    required this.localArrivalTimestamp,
    required this.departureDate,
    required this.departureTime,
    required this.departureTimestamp,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.arrivalTimestamp,
    required this.delay,
    required this.departure,
    required this.equipment,
    required this.marketingCarrier,
    required this.rating,
    required this.technicalStops,
    required this.tripClass,
    required this.number,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      arrival: json['arrival'],
      aircraft: json['aircraft'],
      localDepartureTimestamp: json['local_departure_timestamp'],
      operatingCarrier: json['operating_carrier'],
      operatedBy: json['operated_by'],
      duration: json['duration'],
      localArrivalTimestamp: json['local_arrival_timestamp'],
      departureDate: json['departure_date'],
      departureTime: json['departure_time'],
      departureTimestamp: json['departure_timestamp'],
      arrivalDate: json['arrival_date'],
      arrivalTime: json['arrival_time'],
      arrivalTimestamp: json['arrival_timestamp'],
      delay: json['delay'],
      departure: json['departure'],
      equipment: json['equipment'],
      marketingCarrier: json['marketing_carrier'],
      rating: json['rating'].toDouble(),
      technicalStops: json['technical_stops'],
      tripClass: json['trip_class'],
      number: json['number'],
    );
  }

  @override
  String toString() {
    return 'Flight(arrival: $arrival, aircraft: $aircraft, localDepartureTimestamp: $localDepartureTimestamp, operatingCarrier: $operatingCarrier, operatedBy: $operatedBy, duration: $duration, localArrivalTimestamp: $localArrivalTimestamp, departureDate: $departureDate, departureTime: $departureTime, departureTimestamp: $departureTimestamp, arrivalDate: $arrivalDate, arrivalTime: $arrivalTime, arrivalTimestamp: $arrivalTimestamp, delay: $delay, departure: $departure, equipment: $equipment, marketingCarrier: $marketingCarrier, rating: $rating, technicalStops: $technicalStops, tripClass: $tripClass, number: $number)';
  }
}

class Rating {
  final double total;
  final DetailedRating detailed;

  Rating({required this.total, required this.detailed});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      total: json['total'].toDouble(),
      detailed: DetailedRating.fromJson(json['detailed']),
    );
  }

  @override
  String toString() {
    return 'Rating(total: $total, detailed: $detailed)';
  }
}

class DetailedRating {
  final double arrivalTime;
  final double departureTime;
  final double transfer;

  DetailedRating({
    required this.arrivalTime,
    required this.departureTime,
    required this.transfer,
  });

  factory DetailedRating.fromJson(Map<String, dynamic> json) {
    return DetailedRating(
      arrivalTime: json['arrival_time'].toDouble(),
      departureTime: json['departure_time'].toDouble(),
      transfer: json['transfer'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'DetailedRating(arrivalTime: $arrivalTime, departureTime: $departureTime, transfer: $transfer)';
  }
}

class Transfer {
  final String at;
  final String to;
  final List<String> airports;
  final List<String> airlines;
  final String countryCode;
  final String cityCode;
  final VisaRules visaRules;
  final bool nightTransfer;
  final int durationSeconds;
  final Duration duration;

  Transfer({
    required this.at,
    required this.to,
    required this.airports,
    required this.airlines,
    required this.countryCode,
    required this.cityCode,
    required this.visaRules,
    required this.nightTransfer,
    required this.durationSeconds,
    required this.duration,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      at: json['at'],
      to: json['to'],
      airports: List<String>.from(json['airports']),
      airlines: List<String>.from(json['airlines']),
      countryCode: json['country_code'],
      cityCode: json['city_code'],
      visaRules: VisaRules.fromJson(json['visa_rules']),
      nightTransfer: json['night_transfer'],
      durationSeconds: json['duration_seconds'],
      duration: Duration(seconds: json['duration']['seconds']),
    );
  }

  @override
  String toString() {
    return 'Transfer(at: $at, to: $to, airports: $airports, airlines: $airlines, countryCode: $countryCode, cityCode: $cityCode, visaRules: $visaRules, nightTransfer: $nightTransfer, durationSeconds: $durationSeconds, duration: $duration)';
  }
}

class VisaRules {
  final bool required;

  VisaRules({required this.required});

  factory VisaRules.fromJson(Map<String, dynamic> json) {
    return VisaRules(
      required: json['required'],
    );
  }

  @override
  String toString() {
    return 'VisaRules(required: $required)';
  }
}
