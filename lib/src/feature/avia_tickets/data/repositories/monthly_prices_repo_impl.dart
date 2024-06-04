import 'package:frifri/src/feature/avia_tickets/domain/repo/montly_prices_repo.dart';
import 'package:frifri/src/feature/shared/data/data_sources/prices.dart';
import 'package:frifri/src/feature/shared/data/dto/prices_for_dates.dart';

final class MonthlyPricesRepoImpl implements IMonthlyPricesRepo {
  MonthlyPricesRepoImpl({required this.monthlyTicketPriceDataSources});

  final IPricesDataSource monthlyTicketPriceDataSources;

  @override
  Future<PricesForDates> fetchMonthlyTicketPrices(
      PricesForDatesQuery transfer) async {
    return await monthlyTicketPriceDataSources.getPricesForDates(
      options: transfer,
    );
  }
}
