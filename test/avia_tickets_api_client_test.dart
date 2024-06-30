import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/shared/data/data_sources/airline_logo.dart';
import 'package:frifri/src/feature/shared/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/data_sources/prices.dart';
import 'package:frifri/src/feature/shared/data/data_sources/search_tickets.dart';
import 'package:frifri/src/feature/shared/data/data_sources/user_location.dart';
import 'package:frifri/src/feature/shared/data/dto/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/dto/latest_prices.dart';
import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/shared/data/dto/prices_for_dates.dart';
import 'package:frifri/src/feature/shared/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/shared/data/dto/user_location.dart';

// TODO: Сделать датонезависимые тесты!
// TODO: Разнести тесты разных источников данных по разным модулям!
void main() async {
  await dotenv.load();
  final baseUrl = dotenv.get('API_BASE_URL');
  final apiKey = dotenv.get('API_KEY');
  final marker = dotenv.get('API_MARKER');
  final apiClient = getBasicDioClient(baseUrl, apiKey);

  final autocompleteDataSource = AutocompleteDataSourceImpl(
    dioClient: apiClient,
  );
  final ticketsDataSource = TicketsDataSourceImpl(
    dioClient: apiClient,
  );

  final pricesDataSource = PricesDataSourceImpl(
    dioClient: apiClient,
  );

  final userLocationDataSource = UserLocationDataSourceImpl(
    dioClient: apiClient,
  );

  test(
    'Get TicketsInfo',
    () async {
      final result = await pricesDataSource.getLatestPrices(
        options: LatestPricesQuery(
          origin: 'MOW',
          destination: 'HKT',
          oneWay: true,
          sorting: 'price',
          limit: 100,
          page: 1,
        ),
      );

      logger.i('PricesForDates:');
      for (final ticket in result.data) {
        logger.i('${ticket.departDate} -> price: ${ticket.value}');
      }

      final ticket = result.data[0];

      expect(result, isNotNull);
      expect(ticket.origin, 'MOW');
      expect(ticket.destination, 'HKT');
    },
  );

  test('Get user location', () async {
    final result = await userLocationDataSource.getUserLocation(
        options: UserLocationQuery(
      locale: 'RU',
    ));
    expect(result.iata.length, 3);
  });

  test('Get airline logo', () async {
    var url = getAirlineLogoUrl('S7', '80/80');
    logger.i(url);
    var response = await apiClient.get(url);

    url = getAirlineLogoUrl('S7', '80/80', isRetina: true);
    logger.i(url);
    response = await apiClient.get(url);

    expect(response.statusCode, 200);
  });

  test('Get user autocomplete', () async {
    final result = await autocompleteDataSource.getAutocomplete(
      options: AutocompleteQuery(
        term: 'Шереметьево',
        locale: 'ru',
        types: ['airport', 'city'],
      ),
    );

    expect(result[0].name, 'Шереметьево');
    expect(result[0].code, 'SVO');
  });

  test('Get tickets with links', () async {
    final result = await pricesDataSource.getPricesForDates(
      options: PricesForDatesQuery(
        origin: 'MOW',
        destination: 'HKT',
        departureAt: '2024-07-20',
      ),
    );

    expect(result.data[0].origin, 'MOW');
    for (final elements in result.data) {
      logger.i('https://aviasales.com${elements.link}');
    }
  });

  test('Search tickets with SearchID',
      timeout: const Timeout(Duration(days: 1)), () async {
    final result = await ticketsDataSource.searchTickets(
      options: TicketsSearchQuery(
        locale: 'en',
        marker: marker,
        segments: [
          Segment(
            origin: 'MOW',
            destination: 'NYC',
            date: '2024-07-28',
          ),
        ],
        passengers: Passengers(),
        userIp: null,
      ),
    );

    logger.i('[Testing SearchID request]');

    expect(result.host, 'frifri.ge');
    expect(result.searchId, isNotNull);

    logger
      ..i('SearchID: ${result.searchId}')
      ..i('Getting result for the searchID: ${result.searchId}...');

    await Future.delayed(const Duration(seconds: 40));

    final searchResult = await ticketsDataSource.getTicketsBySearchId(
      searchId: result.searchId,
    );

    for (final element in searchResult.data) {
      logger.i('--------- SEARCH CHUNK --------');
      if (element.proposals.isEmpty) {
        logger
          ..i('Empty...')
          ..i('-------------------------------');
      }

      for (final proposal in element.proposals) {
        logger
          ..i('Прямой: ${proposal.isDirect}')
          ..i('Чартерный: ${proposal.isCharter}')
          ..i('Теги: ${proposal.tagsAsString}')
          ..i('Количество пересадок: ${proposal.segments.length}')
          ..i('Суммарная продолжительность: ${proposal.totalDurationInMinutes} мин.')
          ..i('\t~~~~~~~~~~~ Segments ~~~~~~~~~~~');
        for (int segmentN = 0;
            segmentN < proposal.segments.length;
            segmentN++) {
          final flight = proposal.segments[segmentN].flight;
          for (int flightN = 0; flightN < flight.length; flightN++) {
            final flightData = flight[flightN];
            logger
              ..i('\t\t------- Трансфер $flightN ----------')
              ..i('\t\tНа чём летим: ${flightData.aircraftName}')
              ..i('\t\tДальше пока западло писать ⚠ lol')
              ..i('\t\t-------------------------------------');
          }
        }
        logger.i('\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
      }

      logger.i('-------------------------------');
    }
  });

  test('Get month matrix', () async {
    final result = await pricesDataSource.getMonthMatrix(
      options: MonthMatrixQuery(
        origin: 'MOW',
        destination: 'GOJ',
        month: DateTime(2024, 6),
        oneWay: false,
        currency: 'RUB',
        showToAffiliates: true,
      ),
    );

    result.data.sort((a, b) => a.departDate.compareTo(b.departDate));
    final map = <DateTime, MonthMatrixDayInfo>{};
    for (final element in result.data) {
      if (map.containsKey(element.departDate)) {
        if (element.value < map[element.departDate]!.value) {
          map[element.departDate] = element;
        }
      } else {
        map[element.departDate] = element;
      }
    }

    for (final element in result.data) {
      logger.i('----------------');
      logger.i(element.departDate);
      logger.i(element.value);
      logger.i('----------------');
    }

    expect(result, isNotNull);
    expect(result, isA<MonthMatrix>());
  });
}
