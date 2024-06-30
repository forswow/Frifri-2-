import 'package:dio/dio.dart';
import 'package:frifri/src/core/network/exceptions/nework_exception.dart';
import 'package:frifri/src/feature/shared/data/dto/autocomplete.dart';

import 'package:frifri/src/feature/shared/domain/entities/country_search_entity.dart';

abstract interface class IAutocompleteDataSource {
  Future<List<AutocompleteEntity>> getAutocomplete({
    required AutocompleteQuery options,
  });
}

class AutocompleteDataSourceImpl implements IAutocompleteDataSource {
  AutocompleteDataSourceImpl({
    required Dio dioClient,
  }) : _dio = dioClient;

  final Dio _dio;

  @override
  Future<List<AutocompleteEntity>> getAutocomplete({
    required AutocompleteQuery options,
  }) async {
    try {
      final response = await _dio.get(
          'http://autocomplete.travelpayouts.com/places2?',
          queryParameters: options.toJson());

      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((e) => AutocompleteEntity.fromJson(e))
            .toList();
      }
      throw NetworkException(message: 'message', statusCode: 'statusCode');
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
