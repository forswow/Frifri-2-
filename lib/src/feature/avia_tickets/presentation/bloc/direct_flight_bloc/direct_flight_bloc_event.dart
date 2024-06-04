import 'package:equatable/equatable.dart';
import 'package:frifri/src/feature/shared/data/dto/prices_for_dates.dart';

abstract class DirectFlightEvent extends Equatable {}

/// Ивент который передаёт данные для поиска рейсов
final class DirectFlight$Fetch extends DirectFlightEvent {
  DirectFlight$Fetch({
    required this.transfer,
  });

  final PricesForDatesQuery transfer;

  @override
  List<Object> get props => [transfer];
}

/// Ивент, который запрашивает IATA коды аэропортов
/// для дальнейшего поиска
final class DirectFlight$FetchAirportsIataCodes extends DirectFlightEvent {
  DirectFlight$FetchAirportsIataCodes({
    required this.table,
    required this.price,
  });

  final String table;
  final String price;

  @override
  List<Object> get props => [table, price];
}

///
final class FetchTicketPrices extends DirectFlightEvent {
  FetchTicketPrices({
    required this.locale,
    required this.currency,
    required this.origin,
  });

  final String locale;

  final String currency;

  final String origin;

  @override
  List<Object> get props => [currency, locale];
}
