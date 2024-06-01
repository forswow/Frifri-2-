import 'package:dio/dio.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/latest_prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/prices_for_dates.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/month_matrix.dart';

import '../dto/autocomplete.dart';

abstract interface class IPricesDataSource {
  Future<PricesForDates> getPricesForDates(
      {required PricesForDatesQuery options});

  Future<LatestPrices> getLatestPrices({required LatestPricesQuery options});

  Future<MonthMatrix> getMonthMatrix(
    MonthMatrixQuery options,
    final String locale,
  );
}

final class PricesDataSourceImpl with Network implements IPricesDataSource {
  PricesDataSourceImpl({required this.autocompleteDataSourceImpl});

  final IAutocompleteDataSource autocompleteDataSourceImpl;

  @override
  Future<PricesForDates> getPricesForDates(
      {required PricesForDatesQuery options}) async {
    String endpoint =
        "https://api.travelpayouts.com/aviasales/v3/prices_for_dates";
    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);
    final response = await dioClient.get(endpoint, queryParameters: allOptions);
    final result = response.data;
    return PricesForDates.fromJson(result);
  }

  @override
  Future<LatestPrices> getLatestPrices(
      {required LatestPricesQuery options}) async {
    String endpoint =
        "http://api.travelpayouts.com/aviasales/v3/get_latest_prices";
    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);
    final response = await dioClient.get(endpoint, queryParameters: allOptions);
    final result = response.data;
    return LatestPrices.fromJson(result);
  }

  // For calendar forming
  @override
  Future<MonthMatrix> getMonthMatrix(
    MonthMatrixQuery options,
    final String locale,
  ) async {
    try {
      String endpoint = "https://api.travelpayouts.com/v2/prices/month-matrix";
      final allOptions = options.toJson();
      allOptions.removeWhere((key, value) => value == null);
      final response =
          await dioClient.get(endpoint, queryParameters: allOptions);
      final result = response.data as Map<String, dynamic>;
      final origin = await autocompleteDataSourceImpl.getAutocomplete(
          options: AutocompleteQuery(
              term: options.origin,
              locale: locale,
              types: ['city, country, airport']));
      final destination = await autocompleteDataSourceImpl.getAutocomplete(
          options: AutocompleteQuery(
              term: options.destination,
              locale: locale,
              types: ['city, country, airport']));

      MonthMatrix monthMatrix = MonthMatrix.fromJson(result);

      final data = monthMatrix.copyWith(
          origin: origin.first.name,
          destination: destination.first.name);

      return data;
    } on DioException catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }
}
