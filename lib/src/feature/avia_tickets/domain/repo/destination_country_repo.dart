import '../entities/destination_country_entity.dart';

abstract interface class IDestinationCountryRepo {
  Future<List<DestinationAirportEntity>> fetchDestinationAirports(
    final String table,
  );
}
