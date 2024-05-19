import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/latest_prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/month_matrix.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/prices_for_dates.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets_result.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/user_location.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';

import '../../../../core/helpers/signature/signature_helper.dart';
import '../dto/ticket_search_query.dart';

class AviaTicketsApiClientImpl implements IAviaTicketsApiClient {
  AviaTicketsApiClientImpl() : _dio = Network().dioClient;

  final Dio _dio;

  @override
  Future<List<AutocompleteResult>> getAutocomplete(
      {required AutocompleteQuery options}) async {
    String endpoint = "https://autocomplete.travelpayouts.com/places2";

    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);

    final response = await _dio.get(
      endpoint,
      queryParameters: allOptions,
    );

    final result = response.data as List<dynamic>;

    return result
        .map(
          (acItem) => AutocompleteResult.fromJson(acItem),
        )
        .toList();
  }

  @override
  Future<BookingTicketEntity> getABookingLink(String searchId) {
    // TODO: implement getABookingLink
    throw UnimplementedError();
  }

  @override
  Future<PricesForDates> getPricesForDates({
    required PricesForDatesQuery options,
  }) async {
    String endpoint =
        "https://api.travelpayouts.com/aviasales/v3/prices_for_dates";

    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);

    final response = await _dio.get(
      endpoint,
      queryParameters: allOptions,
    );

    final result = response.data;

    return PricesForDates.fromJson(result);
  }

  @override
  Future<LatestPrices> getLatestPrices({
    required LatestPricesQuery options,
  }) async {
    String endpoint =
        "http://api.travelpayouts.com/aviasales/v3/get_latest_prices";

    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);

    final response = await _dio.get(
      endpoint,
      queryParameters: allOptions,
    );

    final result = response.data;

    return LatestPrices.fromJson(result);
  }

  @override
  Future<UserLocation> getUserLocation({
    required UserLocationQuery options,
  }) async {
    String endpoint = "http://www.travelpayouts.com/whereami";

    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);

    final response = await _dio.get(
      endpoint,
      queryParameters: allOptions,
    );

    final result = response.data;

    return UserLocation.fromJson(result);
  }

  @override
  Future<TicketsSearchIdResult> searchTickets({
    required TicketsSearchQuery options,
  }) async {
    try {
      String endpoint = "http://api.travelpayouts.com/v1/flight_search";

      final apiKey = dotenv.get("API_KEY");

      final allOptions = options.toJson();
      allOptions.removeWhere((key, value) => value == null);

      final signature = Signature().createSignature(allOptions, apiKey);

      allOptions.addAll(
        {"signature": signature},
      );

      final response = await _dio.post(
        endpoint,
        data: allOptions,
      );

      logger.i("URL: ${response.requestOptions.uri}");
      logger.i("Data: ${response.requestOptions.data}");

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
  Future<List<TicketsSearchResultBySearchId>> getTicketsBySearchId({
    required String searchId,
  }) async {
    String endpoint = "http://api.travelpayouts.com/v1/flight_search_results";

    final response = await _dio.post(endpoint, queryParameters: {
      "uuid": searchId,
    });

    final result = response.data as List<dynamic>;

    return result
        .map(
          (e) => TicketsSearchResultBySearchId.fromJson(e),
        )
        .toList();
  }

  @override
  Future<MonthMatrix> getMonthMatrix({
    required MonthMatrixQuery options,
  }) async {
    String endpoint = "https://api.travelpayouts.com/v2/prices/month-matrix";

    final allOptions = options.toJson();
    allOptions.removeWhere((key, value) => value == null);

    final response = await _dio.get(endpoint, queryParameters: allOptions);
    print(response.requestOptions.uri);

    final result = response.data as Map<String, dynamic>;

    return MonthMatrix.fromJson(result);
  }
}

// +---------------------------------------------+
// |    Helper functions for signing requests    |
// +---------------------------------------------+
