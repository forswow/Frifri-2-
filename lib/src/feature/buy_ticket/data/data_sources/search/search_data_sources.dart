import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frifri/src/core/network/exceptions/nework_exception.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import '../../../../../core/helpers/signature/signature_helper.dart';
import '../../../domain/entities/booking_ticket_entity.dart';
import '../../dto/ticket_search_query.dart';
import 'package:http/http.dart' as http;

abstract interface class ISearchDataSources {
  /// Main request with params.
  Future<TicketsSearchIdResult> searchTickets({
    required TicketsSearchQuery options,
  });

  /// Get list companies offers.
  Future<TicketsSearchResultBySearchId> getTicketsBySearchId(
    final String searchId,
  );

  /// Get companies buy ticket link.
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  });
}

final class SearchDataSources
    with Network, Signature
    implements ISearchDataSources {
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

      final response = await dioClient.post(
        endpoint,
        data: allOptions,
      );

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
    String searchId,
  ) async {
    String endpoint = "http://api.travelpayouts.com/v1/flight_search_results";

    final response = await dioClient.get(endpoint, queryParameters: {
      "uuid": searchId,
    });

    final result = response.data;

    return TicketsSearchResultBySearchId.fromJson(result);
  }

  @override
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  }) async {
    try {
      final marker = dotenv.get('API_MARKER');

      final endPoint =
          'http://api.travelpayouts.com/v1/flight_searches/$searchId/clicks/$termsUrl.json';

      final response =
          await dioClient.get(endPoint, queryParameters: {"marker": marker});

      if (response.statusCode == 200) {
        return BookingTicketEntity.fromJson(response.data);
      }

      throw NetworkException(
        message: '${response.statusCode}',
        statusCode: "${response.statusCode}",
      );
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }

  Future<void> httpRequest(final String searchId) async {
    try {
      logger.i(searchId);
      final response = await http.get(
        Uri.parse(
            'http://api.travelpayouts.com/v1/flight_search_results?uuid=$searchId'),
        headers: <String, String>{
          'X-Access-Token': '31c30d4e58d9cd3a3dc5cd2b8123e1b1',
          'Content-Type': 'application/json; charset=utf-8'
        },
      );

      /// search_id
      ///[airlines] airlines_name. CompanyName
      /// [proposals] segment transfers info transfer
      /// proposals.segment.terms price. Field currency
      /// proposals.segment.terms.url for generate link.

      if (response.statusCode == 200) {
        // logger.i(jsonDecode(response.body));
        final json = jsonDecode(utf8.decode(response.bodyBytes));
        // final ticketList = (json as List<dynamic>)
        //     .map((e) => e['proposals'])
        //     .toList()
        //     .expand((element) => element)
        //     .map((e) => e['segments'])
        //     .map((e) => e)
        //     .toList();

        logger.i(json);
        final ticketList = (json as List<dynamic>).map((e) => e['proposals']);

        logger.i(ticketList);
        for (var element in ticketList) {
          print('run');
        }
        //
        // final myList =
        //     (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>)
        //         .map((e) => e['proposals']);

        // for (var elements in data) {
        //   logger.i(data.map((e) => logger.i(elements['proposals'])));
        // }
        //
        // // logger.i(jsonDecode(response.body));
        // logger.i(response.headers);
      }

      logger.i(response.statusCode);
      //
      // throw NetworkException(
      //     message: 'Error ', statusCode: '${response.statusCode}');
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
      logger.e('message', error: error, stackTrace: stack);
    }
  }

  Future<void> mock(final String searchId) async {
    try {
      String endpoint = "http://api.travelpayouts.com/v1/flight_search_results";

      final response = await dioClient.post(endpoint, queryParameters: {
        "uuid": searchId,
      });

      final responseList = (response.data as List<dynamic>);

      final segments = responseList.first;
      logger.i(segments);

      // debugPrint(response.data.toString(), wrapWidth: 1000);
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }

  Future<List<dynamic>> d(final String searchId) async {
    try {
      String endpoint = "http://api.travelpayouts.com/v1/flight_search_results";

      final response = await dioClient.post(endpoint, queryParameters: {
        "uuid": searchId,
      });

      final responseList = (response.data as List<dynamic>);

      return responseList;

      // debugPrint(response.data.toString(), wrapWidth: 1000);
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }

  Future<void> getSearch() async {
    try {
      final response =
          await dioClient.get('/v1/prices/calendar', queryParameters: {
        'origin': 'MOW',
        'destination': 'LED',
        'departure_date': '2024-05-18',
        'limit': '50',
        'currency': 'USD',
      });

      logger.i(response.realUri);

      logger.i(response);
    } on Object catch (error, stack) {
      logger.e('', error: error, stackTrace: stack);
    }
  }
}
