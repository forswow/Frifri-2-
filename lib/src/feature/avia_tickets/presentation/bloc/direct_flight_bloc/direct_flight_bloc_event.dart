import 'package:equatable/equatable.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';

abstract class DirectFlightEvent extends Equatable {}

/// Ивент, который запрашивает IATA коды аэропортов
/// для дальнейшего поиска
final class DirectFlight$FetchDestinationAirportsIataCodes
    extends DirectFlightEvent {
  DirectFlight$FetchDestinationAirportsIataCodes({
    required this.originIataCode,
  });

  final String originIataCode;

  @override
  List<Object> get props => [
        originIataCode,
      ];
}

///
final class DirectFlight$FetchTickets extends DirectFlightEvent {
  DirectFlight$FetchTickets({
    required this.currency,
    required this.originIataCode,
    required this.destinationIataCodes,
  });

  final String currency;
  final String originIataCode;
  final List<DestinationAirportEntity> destinationIataCodes;

  @override
  List<Object> get props => [
        currency,
        originIataCode,
        destinationIataCodes,
      ];
}
