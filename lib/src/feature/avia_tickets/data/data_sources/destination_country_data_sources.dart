import 'package:frifri/src/core/supabase/client/supabase_app_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';

abstract interface class IDestinationCountryDataSources {
  Future<List<DestinationCountryEntity>> fetchDestinationCountries(
    final String table,
  );
}

final class DestinationCountryDataSources
    with SupaBaseAppClient
    implements IDestinationCountryDataSources {
  @override
  Future<List<DestinationCountryEntity>> fetchDestinationCountries(
    String table,
  ) async {
    try {
      final response = await supaBaseClient.from(table).select();

      return response.map((e) => DestinationCountryEntity.fromMap(e)).toList();
    } on PostgrestException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
