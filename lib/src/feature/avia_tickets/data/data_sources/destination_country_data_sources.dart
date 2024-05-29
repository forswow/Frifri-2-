import 'package:frifri/src/core/supabase/client/supabase_app_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/destination_country_entity.dart';

abstract interface class IDestinationCountryDataSources {
  Future<List<DestinationCountryEntity>> fetchDestinationCountries(
    final String table,
  );
}


/// Поле [table] является названием таблицы.
///
/// Доступные таблицы TBS KTS BTM

final class DestinationCountryDataSources
    with SupaBaseAppClient
    implements IDestinationCountryDataSources {
  @override
  Future<List<DestinationCountryEntity>> fetchDestinationCountries(
      String table) async {
    try {
      final response = await supaBaseClient.from(table).select();

      return response.map((e) => DestinationCountryEntity.fromMap(e)).toList();
    } on PostgrestException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

/// Возвращаем список стран
///
/// Получаем язык для запроса названия города
/// Получаем список стран для поиска
/// Отправляем запроос на получение цен получения списка
/// отправляем запрос
