import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';

/// Сущность билета, содержит всю необходимую инфу
/// для отображения как миниатюр, бронирования, подробной информации
class TicketEntity {
  TicketEntity({
    required this.originAirport,
    required this.destinationAirport,
    required this.flightDuration,
    required this.segmentsList,
    required this.departureTime,
    required this.arrivalTime,
    required this.formattedPrice,
    required this.price,
    required this.termsUrl,
    required this.searchId,
  });

  final AirportEntity originAirport;
  final AirportEntity destinationAirport;

  // In [2h 45m] format
  final String flightDuration;

  // In [HH:mm] format
  final String departureTime;
  final String arrivalTime;

  final List<SegmentEntity> segmentsList;

  final int price;
  final String formattedPrice;

  final int termsUrl;
  final String searchId;
}

class SegmentEntity {
  final String airlineLogo;
  final String airlineName;

  final String departureTime;
  final DateTime departureDate;

  final String departureCityName;
  final String departureAirportName;

  final String arrivalTime;
  final DateTime arrivalDate;

  final String arrivalCityName;
  final String arrivalAirportName;

  SegmentEntity({
    required this.airlineLogo,
    required this.airlineName,
    required this.departureTime,
    required this.departureDate,
    required this.departureCityName,
    required this.departureAirportName,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.arrivalCityName,
    required this.arrivalAirportName,
  });
}
