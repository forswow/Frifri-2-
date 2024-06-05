import 'package:frifri/src/feature/avia_tickets/domain/entities/direct_oneway_tickets_entity.dart';

abstract interface class IDirectOnewayTicketsRepo {
  Future<DirectOnewayTicketsEntity?> getCheapestDirectOnewayFlight({
    required String originIataCode,
    required String destinationIataCode,
    required String currency,
    required String locale,
  });
}
