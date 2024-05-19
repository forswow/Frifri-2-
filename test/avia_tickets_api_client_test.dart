import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/latest_prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/month_matrix.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/prices_for_dates.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/user_location.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client_impl.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.get("API_BASE_URL");
  final apiKey = dotenv.get("API_KEY");
  final marker = dotenv.get("API_MARKER");
  final apiClient = getBasicDioClient(baseUrl, apiKey);

  final aviaApiClient = AviaTicketsApiClientImpl();
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
    logger.i(url);
    var response = await apiClient.get(url);

    url = getAirlineLogoUrl("S7", "80/80", isRetina: true);
    logger.i(url);
    response = await apiClient.get(url);

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
        departureAt: "2024-05-20",
      ),
    );

    expect(result.data[0].origin, "MOW");
    for (var elements in result.data) {
      logger.i("https://aviasales.com${elements.link}");
    }
  });

  test("Search tickets with SearchID", () async {
    final result = await aviaApiClient.searchTickets(
      options: TicketsSearchQuery(
        host: "frifri.ge",
        locale: "en",
        marker: marker,
        segments: [
          Segment(
            origin: "MOW",
            destination: "BUS",
            date: "2024-05-18",
          ),
        ],
        tripClass: 'Y',
        passengers: Passengers(adults: 1),
        userIp: "127.0.0.1",
      ),
    );

    expect(result.host, "frifri.ge");
    expect(result.searchId, isNotNull);

    logger.i("SearchID: ${result.searchId}");
    logger.i("Getting result for the searchID: ${result.searchId}...");

    final searchResult = await aviaApiClient.getTicketsBySearchId(
      searchId: result.searchId,
    );

    expect(searchResult[0], isNotNull);
  });

  test("Get month matrix", () async {
    final result = await aviaApiClient.getMonthMatrix(
      options: MonthMatrixQuery(
        origin: "MOW",
        destination: "GOJ",
        month: DateTime(2024, 5, 1),
        currency: "RUB",
        showToAffiliates: true,
      ),
    );

    expect(result, isNotNull);
    expect(result, isA<MonthMatrix>());
  });
}
