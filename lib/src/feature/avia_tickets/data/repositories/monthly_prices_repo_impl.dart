import 'package:frifri/src/feature/avia_tickets/data/data_sources/monthly_prices_data_sources.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/monthly_ticket_prices.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/montly_prices_repo.dart';
import 'package:frifri/src/feature/avia_tickets/domain/tranfers/direct_flight_transfer.dart';

final class MonthlyPricesRepoImpl implements IMonthlyPricesRepo {
  MonthlyPricesRepoImpl({required this.monthlyTicketPriceDataSources});

  final IMonthlyTicketPriceDataSources monthlyTicketPriceDataSources;

  @override
  Future<MonthlyTicketPricesEntity> fetchMonthlyTicketPrices(
      DirectFlightTransfer transfer) async {
    return await monthlyTicketPriceDataSources
        .fetchMonthlyTicketPrices(transfer);
  }
}
