import 'package:dio/dio.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/core/network/exceptions/nework_exception.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/module/country_search/data/interceptor/country_search_interceptor.dart';

import '../../domain/dto/input_dto.dart';
import '../../domain/entity/country_search_entity.dart';

abstract interface class ICountrySearchDataSources {
  Future<List<CountrySearchEntity>> fetchCountrySearch(InputDto inputDto);
}

base class CountrySearchDataSources
    with Network
    implements ICountrySearchDataSources {
  @override
  Future<List<CountrySearchEntity>> fetchCountrySearch(
    InputDto inputDto,
  ) async {
    try {
      dioClient.interceptors.add(CountrySearchInterceptor());

      final response =
          await dioClient.get('/places2?', queryParameters: inputDto.toMap());

      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((e) => CountrySearchEntity.fromJson(e))
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
