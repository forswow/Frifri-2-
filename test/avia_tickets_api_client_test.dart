import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/autocomplete.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/latest_prices.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/prices_for_dates.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/user_location.dart';
import 'package:frifri/src/feature/avia_tickets/data/sources/avia_tickets_api_client.dart';
import 'package:frifri/src/feature/avia_tickets/data/sources/avia_tickets_api_client_impl.dart';

import 'dio_base_client.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final _baseUrl = dotenv.get("API_BASE_URL");
  final _apiKey = dotenv.get("API_KEY");
  final _apiClient = getBasicDioClient(_baseUrl, _apiKey);

  final aviaApiClient = AviaTicketsApiClientImpl(
    apiClient: _apiClient,
  );
  log("AviaTicketsApiClient initialized");

  test(
    'Get TicketsInfo',
    () async {
      final result = await aviaApiClient.getLatestPrices(
          options: LatestPricesQuery(
        origin: "MOW",
        destination: "HKT",
      ));

      final ticket = result.data[0];

      expect(result, isNotNull);
      expect(ticket.origin, "MOW");
      expect(ticket.destination, "HKT");
    },
  );

  test('Get user location', () async {
    final result = await aviaApiClient.getUserLocation(
        options: UserLocationQuery(
      locale: 'RU',
    ));
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
      options: AutocompleteQuery(
        term: "Шереметьево",
        types: ["airport"],
        locale: "ru",
      ),
    );

    expect(result[0].name, "Шереметьево");
    expect(result[0].cityCode, "MOW");
  });

  test("Get tickets with links", () async {
    final result = await aviaApiClient.getPricesForDates(
      options: PricesForDatesQuery(
        origin: "MOW",
        departureAt: "2024-05-12",
      ),
    );

    expect(result.data[0].origin, "MOW");
    print("https://aviasales.com${result.data.first.link}");
  });
}
