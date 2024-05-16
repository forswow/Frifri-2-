class TicketEntity {
  final String originIataCode;
  final String destinationIataCode;

  DateTime departureAt;
  DateTime arrivalAt;

  // В минутах
  int tripDuration;
  int price;
  String logoUrl;
  String airlineName;

  // Количество пересадок
  int countOfTransfers;
  String transferAirlineIataCode;

  TicketEntity({
    required this.originIataCode,
    required this.destinationIataCode,
    required this.departureAt,
    required this.arrivalAt,
    required this.tripDuration,
    required this.price,
    required this.logoUrl,
    required this.airlineName,
    required this.countOfTransfers,
    required this.transferAirlineIataCode,
  });
}
