import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';

abstract interface class IDestinationCountryRepo {
  Future<List<DestinationAirportEntity>> fetchDestinationAirports(
    String table,
  );
}
