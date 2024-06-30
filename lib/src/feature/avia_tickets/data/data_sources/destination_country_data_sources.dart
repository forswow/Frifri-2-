import 'package:frifri/src/core/supabase/client/supabase_app_client.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IDestinationCountryDataSources {
  Future<List<DestinationAirportEntity>> fetchDestinationAirports(
    final String table,
  );
}

final class DestinationCountryDataSources
    with SupaBaseAppClient
    implements IDestinationCountryDataSources {
  @override
  Future<List<DestinationAirportEntity>> fetchDestinationAirports(
    String table,
  ) async {
    try {
      final response = await supaBaseClient.from(table).select();

      final seenDestinations = <String>{};

      return response
          .map(
            (e) => DestinationAirportEntity.fromMap(e),
          )
          .where((e) => seenDestinations.add(e.destination))
          .toList();
    } on PostgrestException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
