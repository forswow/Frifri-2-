import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';

abstract interface class IMonthlyPricesRepo {
  Future<DirectFlightEntity> getCheapestDirectOnewayFlight({
    required String originIataCode,
    required String destinationIataCode,
    required String currency,
  });
}
