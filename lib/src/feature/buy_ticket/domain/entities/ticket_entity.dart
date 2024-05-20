import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';

/// Сущность билета, содержит всю необходимую инфу
/// для отображения как миниатюр, бронирования, подробной информации
class TicketEntity {
  final AirportEntity originAirport;
  final AirportEntity destinationAirport;

  // In [2h 45m] format
  final String flightDuration;

  // In [HH:mm] format
  final String departureTime;
  final String arrivalTime;

  final List<SegmentEntity> segmentsList;

  final int price;

  final String bookingLink;

  TicketEntity({
    required this.originAirport,
    required this.destinationAirport,
    required this.flightDuration,
    required this.segmentsList,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.bookingLink,
  });
}

class SegmentEntity {
  final String airlineLogo;
  final String airlineName;

  final String departureTime;
  final DateTime departureDate;

  final String cityName;
  final String airportName;

  final DateTime arrivalDate;

  SegmentEntity({
    required this.airlineLogo,
    required this.airlineName,
    required this.departureTime,
    required this.departureDate,
    required this.cityName,
    required this.airportName,
    required this.arrivalDate,
  });
}
