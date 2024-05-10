import 'package:dio/dio.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/autocomplete.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/latest_prices.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/prices_for_dates.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/user_location.dart';
import 'package:frifri/src/feature/avia_tickets/data/sources/avia_tickets_api_client.dart';

class AviaTicketsApiClientImpl implements AviaTicketsApiClient {
  final Dio _dio;

  AviaTicketsApiClientImpl({required Dio apiClient}) : _dio = apiClient;

  @override
  Future<List<AutocompleteResult>> getAutocomplete(
      {required AutocompleteQuery options}) async {
    String endpoint = "https://autocomplete.travelpayouts.com/places2";

    final response = await _dio.get(
      endpoint,
      queryParameters: options.toJson(),
    );

    final result = response.data as List<dynamic>;

    return result
        .map(
          (ac_item) => AutocompleteResult.fromJson(ac_item),
        )
        .toList();
  }

  @override
  Future<PricesForDates> getPricesForDates({
    required PricesForDatesQuery options,
  }) async {
    String endpoint =
        "https://api.travelpayouts.com/aviasales/v3/prices_for_dates";

    final response = await _dio.get(
      endpoint,
      queryParameters: options.toJson(),
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

    final response = await _dio.get(
      endpoint,
      queryParameters: options.toJson(),
    );

    final result = response.data;

    return LatestPrices.fromJson(result);
  }

  @override
  Future<UserLocation> getUserLocation({
    required UserLocationQuery options,
  }) async {
    String endpoint = "http://www.travelpayouts.com/whereami";

    final response = await _dio.get(
      endpoint,
      queryParameters: options.toJson(),
    );

    final result = response.data;

    return UserLocation.fromJson(result);
  }
}
