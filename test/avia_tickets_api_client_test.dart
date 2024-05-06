import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/ticket_info.dart';
import 'package:frifri/src/feature/avia_tickets/data/providers/avia_tickets_api_client.dart';

import 'dio_base_client.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final _baseUrl = dotenv.get("API_BASE_URL");
  final _apiKey = dotenv.get("API_KEY");
  final _apiClient = getBasicDioClient(_baseUrl, _apiKey);

  final aviaApiClient = AviaTicketsApiClient(
    _apiClient,
    baseUrl: _baseUrl,
  );
  log("AviaTicketsApiClient initialized");

  test(
    'Get TicketsInfo',
    () async {
      final result = await aviaApiClient.getLatestPrices(
        originIataCode: "MOW",
        currency: "usd",
      );

      final ticket = result.data[0];

      expect(result, isNotNull);
      expect(result, isA<TicketInfoResult>());
      expect(ticket.origin, "MOW");
    },
  );

  test('Get user location', () async {
    final result = await aviaApiClient.getUserLocation();
    expect(result.iata.length, 3);
  });

  test('Get airline logo', () async {
    var url = getAirlineLogoUrl("S7", "80/80");
    print(url);
    var response = await _apiClient.get(url);

    url = getAirlineLogoUrl("S7", "80/80", isRetina: true);
    print(url);
    response = await _apiClient.get(url);

    expect(response.statusCode, 200);
  });

  test("Get user autocomplete", () async {
    final result = await aviaApiClient.getAutocomplete(
      term: "Шереметьево",
      types: ["airport"],
      locale: "ru",
    );

    expect(result[0].name, "Шереметьево");
    expect(result[0].cityCode, "MOW");
  });
}
