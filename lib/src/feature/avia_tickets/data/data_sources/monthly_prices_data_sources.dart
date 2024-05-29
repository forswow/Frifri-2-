import 'package:dio/dio.dart';
import 'package:frifri/src/core/network/dio_client.dart';

import '../../../buy_ticket/data/DTO/month_matrix.dart';

final class MonthlyPricesDataSources with Network {
  Future<MonthMatrix> getMonthMatrix({
    required MonthMatrixQuery options,
  }) async {
    try {
      String endpoint = "https://api.travelpayouts.com/v2/prices/month-matrix";

      final allOptions = options.toJson();
      allOptions.removeWhere((key, value) => value == null);

      final response =
          await dioClient.get(endpoint, queryParameters: allOptions);

      final result = response.data as Map<String, dynamic>;

      return MonthMatrix.fromJson(result);
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }



}
