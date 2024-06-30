import 'package:dio/dio.dart';
import 'package:frifri/src/feature/shared/data/dto/latest_prices.dart';
import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/shared/data/dto/prices_for_dates.dart';

abstract interface class IPricesDataSource {
  Future<PricesForDates> getPricesForDates(
      {required PricesForDatesQuery options});

  Future<LatestPrices> getLatestPrices({required LatestPricesQuery options});

  Future<MonthMatrix> getMonthMatrix({
    required MonthMatrixQuery options,
  });
}

final class PricesDataSourceImpl implements IPricesDataSource {
  PricesDataSourceImpl({required Dio dioClient}) : _dioClient = dioClient;

  final Dio _dioClient;

  @override
  Future<PricesForDates> getPricesForDates(
      {required PricesForDatesQuery options}) async {
    const String endpoint =
        'https://api.travelpayouts.com/aviasales/v3/prices_for_dates';
    final allOptions = options.toJson()
      ..removeWhere((key, value) => value == null);
    final response =
        await _dioClient.get(endpoint, queryParameters: allOptions);
    final result = response.data;
    return PricesForDates.fromJson(result);
  }

  @override
  Future<LatestPrices> getLatestPrices(
      {required LatestPricesQuery options}) async {
    const String endpoint =
        'http://api.travelpayouts.com/aviasales/v3/get_latest_prices';
    final allOptions = options.toJson()
      ..removeWhere((key, value) => value == null);
    final response =
        await _dioClient.get(endpoint, queryParameters: allOptions);
    final result = response.data;
    return LatestPrices.fromJson(result);
  }

  // For calendar forming
  @override
  Future<MonthMatrix> getMonthMatrix({
    required MonthMatrixQuery options,
  }) async {
    try {
      const String endpoint =
          'https://api.travelpayouts.com/v2/prices/month-matrix';
      final allOptions = options.toJson()
        ..removeWhere((key, value) => value == null);
      final response =
          await _dioClient.get(endpoint, queryParameters: allOptions);
      final result = response.data as Map<String, dynamic>;

      final MonthMatrix monthMatrix = MonthMatrix.fromJson(result);

      return monthMatrix;
    } on DioException catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }
}
