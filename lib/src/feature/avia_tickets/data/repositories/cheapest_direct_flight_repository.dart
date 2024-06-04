import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/cheapest_direct_flight_repository.dart';
import 'package:frifri/src/feature/shared/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/data_sources/prices.dart';
import 'package:frifri/src/feature/shared/data/dto/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/dto/latest_prices.dart';
import 'package:uuid/uuid.dart';

final class CheapestDirectOnewayRepoImpl implements ICheapestDirectOnewayRepo {
  CheapestDirectOnewayRepoImpl({
    required this.ticketPricesDataSource,
    required this.autocompleteDataSource,
  });

  final IPricesDataSource ticketPricesDataSource;
  final IAutocompleteDataSource autocompleteDataSource;

  @override
  Future<DirectFlightEntity?> getCheapestDirectOnewayFlight({
    required String originIataCode,
    required String destinationIataCode,
    required String currency,
    required String locale,
  }) async {
    final prices = await ticketPricesDataSource.getLatestPrices(
        options: LatestPricesQuery(
      origin: originIataCode,
      destination: destinationIataCode,
      sorting: "price",
      page: 1,
      currency: currency,
      limit: 100,
      oneWay: true,
    ));

    if (prices.data.isEmpty) {
      return null;
    }

    final cheapestTicket = prices.data.first;

    final originCityName = (await autocompleteDataSource.getAutocomplete(
      options: AutocompleteQuery(
        term: originIataCode,
        locale: locale,
        types: ["airport"],
      ),
    ))
        .first
        .name;

    final destinationCityName = (await autocompleteDataSource.getAutocomplete(
      options: AutocompleteQuery(
        term: destinationIataCode,
        locale: locale,
        types: ["airport"],
      ),
    ))
        .first
        .name;

    return DirectFlightEntity(
      // TODO: Вынести генератор UUID вместо создания нового?
      uuid: const Uuid().v4(),
      // Это тру IATA коды
      departureLocation: originIataCode,
      placeOfArrival: destinationIataCode,

      // Это просто имена (без понятия, почему они перепутаны :<)
      placeOfArrivalIataCode: destinationCityName,
      departureLocationIataCode: originCityName,
      flightTimeInMinutes: cheapestTicket.duration,
      price: cheapestTicket.value,
    );
  }
}
