import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/direct_oneway_tickets_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/direct_oneway_tickets_repository.dart';
import 'package:frifri/src/feature/shared/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/data_sources/prices.dart';
import 'package:frifri/src/feature/shared/data/dto/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/dto/latest_prices.dart';
import 'package:uuid/uuid.dart';

final class DirectOnewayTicketsRepoImpl implements IDirectOnewayTicketsRepo {
  DirectOnewayTicketsRepoImpl({
    required this.ticketPricesDataSource,
    required this.autocompleteDataSource,
  });

  final IPricesDataSource ticketPricesDataSource;
  final IAutocompleteDataSource autocompleteDataSource;

  @override
  Future<DirectOnewayTicketsEntity?> getCheapestDirectOnewayFlight({
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

    if (prices.data.isEmpty) return null;

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

    final cheapestTicket = DirectFlightEntity(
      uuid: const Uuid().v4(),
      departureLocation: originIataCode,
      placeOfArrival: destinationIataCode,
      placeOfArrivalIataCode: destinationCityName,
      departureLocationIataCode: originCityName,
      flightTimeInMinutes: prices.data.first.duration,
      price: prices.data.first.value,
      departureDate: prices.data.first.departDate,
    );

    final directTickets = DirectOnewayTicketsEntity(
      cheapestTicket: cheapestTicket,
      allTickets: [],
    );

    for (final ticket in prices.data) {
      directTickets.allTickets.add(
        DirectFlightEntity(
          // TODO: Вынести генератор UUID вместо создания нового?
          uuid: const Uuid().v4(),
          // Это тру IATA коды
          departureLocation: originIataCode,
          placeOfArrival: destinationIataCode,

          // Это просто имена (без понятия, почему они перепутаны :<)
          placeOfArrivalIataCode: destinationCityName,
          departureLocationIataCode: originCityName,
          flightTimeInMinutes: ticket.duration,
          price: ticket.value,

          departureDate: ticket.departDate,
        ),
      );
    }

    return directTickets;
  }
}
