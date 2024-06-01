import 'package:dio/dio.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/core/network/exceptions/nework_exception.dart';
import 'package:frifri/src/feature/avia_tickets/data/iterceptors/countries_fetch_interceptor.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/monthly_ticket_prices.dart';
import 'package:frifri/src/feature/avia_tickets/domain/tranfers/direct_flight_transfer.dart';

abstract interface class IMonthlyTicketPriceDataSources {
  Future<MonthlyTicketPricesEntity> fetchMonthlyTicketPrices(
    // final List<DestinationCountryEntity> destinationCountry,
    final DirectFlightTransfer directFlightTransfer,
  );
}

final class MonthlyTicketPriceDataSources
    with Network
    implements IMonthlyTicketPriceDataSources {
  @override
  Future<MonthlyTicketPricesEntity> fetchMonthlyTicketPrices(
    final DirectFlightTransfer directFlightTransfer,
  ) async {
    try {
      final response = await dioClient.get(
        '/aviasales/v3/prices_for_dates',
        queryParameters: directFlightTransfer.toMap(),
      );

      if (response.statusCode == 200) {

        return MonthlyTicketPricesEntity.fromJson(response.data);

      }
      throw NetworkException(
        message: response.statusMessage!,
        statusCode: response.statusCode.toString(),
      );
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<String> getCountryName() async {
    try {
      dioClient.interceptors.add(CountrySearchInterceptor());

      dioClient.get('/places2?', queryParameters: {'': ''});
      throw Exception();
    } on DioException catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }
}
