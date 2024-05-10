import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/autocomplete.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/latest_prices.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/prices_for_dates.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/search_tickets.dart';
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

  Future<TicketsSearchIdResult> searchTickets({
    required TicketsSearchQuery options,
  }) async {
    String endpoint = "http://api.travelpayouts.com/v1/flight_search";

    final _apiKey = dotenv.get("API_KEY");
    final signature = _createSignature(options.toJson(), _apiKey);

    final response = await _dio.post(
      endpoint,
      data: options.toJson()..addAll({"signature": signature}),
    );

    final result = response.data;

    return TicketsSearchIdResult.fromJson(result);
  }
}

// +---------------------------------------------+
// |    Helper functions for signing requests    |
// +---------------------------------------------+

SplayTreeMap<String, dynamic> _convertToSplayTreeMap(Map<String, dynamic> map) {
  SplayTreeMap<String, dynamic> splayTreeMap = SplayTreeMap();

  map.forEach((key, value) {
    if (value is Map) {
      splayTreeMap[key] = _convertToSplayTreeMap(value as Map<String, dynamic>);
    } else if (value is List) {
      splayTreeMap[key] = value.map(
        (e) => _convertToSplayTreeMap(e),
      );
    } else {
      splayTreeMap[key] = value;
    }
  });

  return splayTreeMap;
}

String _flattenParameters(SplayTreeMap<String, dynamic> params) {
  List<String> values = [];

  params.forEach((key, value) {
    if (value is Iterable) {
      value.toList().forEach((element) {
        values.add(_flattenParameters(element));
      });
    } else if (value is SplayTreeMap<String, dynamic>) {
      values.add(_flattenParameters(value));
    } else {
      values.add(value.toString());
    }
  });

  return values.join(':');
}

String _createSignature(Map<String, dynamic> params, String token) {
  // Step 1: Rearrange parameters alphabetically
  // SplayTreeMap make it automatically sorted
  SplayTreeMap<String, dynamic> splayTreeMap = _convertToSplayTreeMap(params);

  // Step 2: Flatten all parameters into a single string
  // separated by columns
  String result = _flattenParameters(splayTreeMap);

  // Step 3: Add token in the beginning
  result = "$token:$result";

  // Step 4: Hash it with MD5
  var bytes = utf8.encode(result);
  var md5Signature = md5.convert(bytes).toString();
  return md5Signature;
}
