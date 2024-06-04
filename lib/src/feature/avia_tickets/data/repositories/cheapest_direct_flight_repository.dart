import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/cheapest_direct_flight_repository.dart';
import 'package:frifri/src/feature/shared/data/data_sources/prices.dart';
import 'package:frifri/src/feature/shared/data/dto/latest_prices.dart';
import 'package:uuid/uuid.dart';

final class MonthlyPricesRepoImpl implements IMonthlyPricesRepo {
  MonthlyPricesRepoImpl({required this.monthlyTicketPriceDataSources});

  final IPricesDataSource monthlyTicketPriceDataSources;

  @override
  Future<DirectFlightEntity> getCheapestDirectOnewayFlight({
    required String originIataCode,
    required String destinationIataCode,
    required String currency,
  }) async {
    final prices = await monthlyTicketPriceDataSources.getLatestPrices(
        options: LatestPricesQuery(
      origin: originIataCode,
      destination: destinationIataCode,
      sorting: "price",
      page: 1,
      currency: currency,
      limit: 100,
      oneWay: true,
    ));

    final cheapestTicket = prices.data.first;

    return DirectFlightEntity(
      // TODO: Вынести генератор UUID вместо создания нового?
      uuid: const Uuid().v4(),
      departureLocation: cheapestTicket.origin,
      placeOfArrival: cheapestTicket.destination,
      placeOfArrivalIataCode: destinationIataCode,
      departureLocationIataCode: originIataCode,
      flightTimeInMinutes: cheapestTicket.duration,
      price: cheapestTicket.value,
    );
  }
}
