import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/helpers/signature_helper.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/shared/data/dto/search_tickets.dart';
import 'package:frifri/src/feature/shared/data/dto/search_tickets_result.dart';
import 'package:frifri/src/feature/shared/data/dto/ticket_search_query.dart';

abstract interface class ITicketsDataSource {
  Future<TicketsSearchIdResult> searchTickets(
      {required TicketsSearchQuery options});

  Future<TicketsSearchResultBySearchId> getTicketsBySearchId(
      {required String searchId});
}

class TicketsDataSourceImpl implements ITicketsDataSource {
  final Dio _dio;

  TicketsDataSourceImpl({required Dio dioClient}) : _dio = dioClient;

  @override
  Future<TicketsSearchIdResult> searchTickets(
      {required TicketsSearchQuery options}) async {
    try {
      String endpoint = "http://api.travelpayouts.com/v1/flight_search";

      final apiKey = dotenv.get("API_KEY");

      final allOptions = options.toJson();
      allOptions.removeWhere((key, value) => value == null);

      final signature = Signature().createSignature(allOptions, apiKey);

      allOptions.addAll({"signature": signature});

      final response = await _dio.post(endpoint, data: allOptions);

      final result = response.data;
      return TicketsSearchIdResult.fromJson(result);
    } on DioException catch (error, stack) {
      logger.e("[DIO Error]: ${error.message}");
      logger.e("[Request Data]: ${error.requestOptions.data}");
      Error.throwWithStackTrace(error, stack);
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }

  @override
  Future<TicketsSearchResultBySearchId> getTicketsBySearchId(
      {required String searchId}) async {
    String endpoint = "http://api.travelpayouts.com/v1/flight_search_results";
    final response =
        await _dio.get(endpoint, queryParameters: {"uuid": searchId});
    final result = response.data;
    return TicketsSearchResultBySearchId.fromJson(result);
  }
}
