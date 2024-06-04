import 'package:equatable/equatable.dart';
import 'package:frifri/src/feature/avia_tickets/domain/tranfers/direct_flight_transfer.dart';

abstract class DirectFlightEvent extends Equatable {}

final class DirectFlight$Fetch extends DirectFlightEvent {
  DirectFlight$Fetch({
    required this.transfer,
  });

  final DirectFlightTransfer transfer;

  @override
  List<Object> get props => [transfer];
}

final class DirectFlight$FetchCountries extends DirectFlightEvent {
  DirectFlight$FetchCountries({
    required this.table,
    required this.price,
  });

  final String table;
  final String price;

  @override
  List<Object> get props => [table, price];
}

final class FetchMonth extends DirectFlightEvent {
  FetchMonth({
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
