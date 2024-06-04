/// {@template direct_fligths_entity}
/// DirectFligthsEntity class.
/// {@endtemplate}
class DirectFlightEntity {
  /// {@macro direct_fligths_entity}

  DirectFlightEntity({
    required this.uuid,
    required this.departureLocation,
    required this.placeOfArrival,
    required this.placeOfArrivalIataCode,
    required this.departureLocationIataCode,
    required this.flightTimeInMinutes,
    required this.price,
  });

  final String uuid;
  final String departureLocation;
  final String placeOfArrival;
  final String placeOfArrivalIataCode;
  final String departureLocationIataCode;
  final int flightTimeInMinutes;
  final int price;
}
