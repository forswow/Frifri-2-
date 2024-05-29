import '../entities/destination_country_entity.dart';

abstract interface class IDestinationCountryRepo {
  Future<List<DestinationCountryEntity>> fetchDestinationCountries(
    final String table,
  );
}
