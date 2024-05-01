import 'package:dio/dio.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/ticket_info.dart';
import 'package:retrofit/retrofit.dart';

part 'avia_tickets_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class AviaTicketsApiClient {
  factory AviaTicketsApiClient(Dio dio, {String baseUrl}) =
      _AviaTicketsApiClient;

  /// Method docs:
  /// https://support.travelpayouts.com/hc/en-us/articles/203956163-Travel-insights-with-Aviasales-Data-API#chapter_2
  @GET('/aviasales/v3/get_latest_prices')
  Future<TicketInfoResult> getTickets({
    @Query('currency') String? currency = null,
    @Query('origin') required String originIataCode,
    @Query('destination') String? destinationIataCode = null,
    @Query('beginning_of_period') String? beginningOfPeriod = null,
    @Query('period_type') String? periodType = null,
    @Query('one_way') bool? oneWay = null,
    @Query('page') int? page = null,
    @Query('market') String? market = null,
    @Query('limit') int? limit = null,
    @Query('sorting') String? sorting = null,
    @Query('trip_duration') int? tripDuration = null,
    @Query('trip_class') int? tripClass = null,
  });
}
