import 'dart:convert';

base class FlightModel {
  String arrival;
  String aircraft;
  int localDepartureTimestamp;
  String operatingCarrier;
  String operatedBy;
  int duration;
  int localArrivalTimestamp;
  String departureDate;
  String departureTime;
  int departureTimestamp;
  String arrivalDate;
  String arrivalTime;
  int arrivalTimestamp;
  int delay;
  String departure;
  String equipment;
  String marketingCarrier;
  double rating;
  dynamic technicalStops;
  String tripClass;
  int number;

  FlightModel({
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

  factory FlightModel.fromJson(String jsonStr) {
    final Map<String, dynamic> json = jsonDecode(jsonStr);
    final flight = json['segment'][0]['flight'];
    return FlightModel(
      arrival: flight['arrival'],
      aircraft: flight['aircraft'],
      localDepartureTimestamp: flight['local_departure_timestamp'],
      operatingCarrier: flight['operating_carrier'],
      operatedBy: flight['operated_by'],
      duration: flight['duration'],
      localArrivalTimestamp: flight['local_arrival_timestamp'],
      departureDate: flight['departure_date'],
      departureTime: flight['departure_time'],
      departureTimestamp: flight['departure_timestamp'],
      arrivalDate: flight['arrival_date'],
      arrivalTime: flight['arrival_time'],
      arrivalTimestamp: flight['arrival_timestamp'],
      delay: flight['delay'],
      departure: flight['departure'],
      equipment: flight['equipment'],
      marketingCarrier: flight['marketing_carrier'],
      rating: flight['rating'],
      technicalStops: flight['technical_stops'],
      tripClass: flight['trip_class'],
      number: flight['number'],
    );
  }

  @override
  String toString() {
    return 'FlightSegment{'
        'arrival: $arrival, '
        'aircraft: $aircraft, '
        'localDepartureTimestamp: $localDepartureTimestamp, '
        'operatingCarrier: $operatingCarrier, '
        'operatedBy: $operatedBy, '
        'duration: $duration, '
        'localArrivalTimestamp: $localArrivalTimestamp, '
        'departureDate: $departureDate, '
        'departureTime: $departureTime, '
        'departureTimestamp: $departureTimestamp, '
        'arrivalDate: $arrivalDate, '
        'arrivalTime: $arrivalTime, '
        'arrivalTimestamp: $arrivalTimestamp, '
        'delay: $delay, '
        'departure: $departure, '
        'equipment: $equipment, '
        'marketingCarrier: $marketingCarrier, '
        'rating: $rating, '
        'technicalStops: $technicalStops, '
        'tripClass: $tripClass, '
        'number: $number}';
  }
}
