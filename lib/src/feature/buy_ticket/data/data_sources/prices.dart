import 'package:dio/dio.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/latest_prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/prices_for_dates.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/month_matrix.dart';

abstract interface class IPricesDataSource {
  Future<PricesForDates> getPricesForDates(
      {required PricesForDatesQuery options});
  Future<LatestPrices> getLatestPrices({required LatestPricesQuery options});
  Future<MonthMatrix> getMonthMatrix({required MonthMatrixQuery options});
}

class PricesDataSourceImpl implements IPricesDataSource {
  final Dio _dio;

  PricesDataSourceImpl({required Dio dioClient}) : _dio = dioClient;

  @override
  Future<PricesForDates> getPricesForDates(
      {required PricesForDatesQuery options}) async {
    String endpoint =
        "https://api.travelpayouts.com/aviasales/v3/prices_for_dates";
    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);
    final response = await _dio.get(endpoint, queryParameters: allOptions);
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
    final response = await _dio.get(endpoint, queryParameters: allOptions);
    final result = response.data;
    return LatestPrices.fromJson(result);
  }

  // For calendar forming
  @override
  Future<MonthMatrix> getMonthMatrix(
      {required MonthMatrixQuery options}) async {
    String endpoint = "https://api.travelpayouts.com/v2/prices/month-matrix";
    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);
    final response = await _dio.get(endpoint, queryParameters: allOptions);
    final result = response.data as Map<String, dynamic>;
    return MonthMatrix.fromJson(result);
  }
}
