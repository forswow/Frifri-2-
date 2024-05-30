import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/network/exceptions/nework_exception.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';

abstract interface class IBookingDataSource {
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  });
}

class BookingDataSourceImpl implements IBookingDataSource {
  final Dio _dio;
  BookingDataSourceImpl({required Dio dioClient}) : _dio = dioClient;

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
          await _dio.get(endPoint, queryParameters: {"marker": marker});

      if (response.statusCode == 200) {
        return BookingTicketEntity.fromJson(response.data);
      }

      throw NetworkException(
        message: '${response.statusCode}',
        statusCode: "${response.statusCode}",
      );
    } on DioException catch (error, stack) {
      logger.e("[DIO Error]: ${error.message}");
      logger.e("[Request Data]: ${error.requestOptions.data}");
      Error.throwWithStackTrace(error, stack);
    } on Object catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }
}
