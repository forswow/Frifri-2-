import 'package:frifri/src/feature/avia_tickets/data/data_sources/destination_country_data_sources.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/destination_country_repository.dart';

final class DestinationCountryRepoImpl implements IDestinationCountryRepo {
  DestinationCountryRepoImpl({required this.destinationCountryDataSources});

  final IDestinationCountryDataSources destinationCountryDataSources;

  @override
  Future<List<DestinationAirportEntity>> fetchDestinationAirports(
    String table,
  ) async {
    return destinationCountryDataSources.fetchDestinationAirports(table);
  }
}
