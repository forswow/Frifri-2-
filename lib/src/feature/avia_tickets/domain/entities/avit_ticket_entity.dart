/// {@template direct_fligths_entity}
/// DirectFligthsEntity class.
/// {@endtemplate}
class DirectFlightEntity {
  /// {@macro direct_fligths_entity}

  DirectFlightEntity({
    required this.uuid,
    required this.departureLocationIataCode,
    required this.placeOfArrivalIataCode,
    required this.placeOfArrival,
    required this.departureLocation,
    required this.flightTimeInMinutes,
    required this.price,
    required this.departureDate,
  });

  final String uuid;
  final String departureLocationIataCode;
  final String placeOfArrivalIataCode;
  final String placeOfArrival;
  final String departureLocation;
  final int flightTimeInMinutes;
  final int price;

  final DateTime departureDate;
}
