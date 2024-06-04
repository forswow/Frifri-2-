import 'package:frifri/src/feature/shared/data/dto/prices_for_dates.dart';

abstract interface class IMonthlyPricesRepo {
  Future<PricesForDates> fetchMonthlyTicketPrices(
    PricesForDatesQuery transfer,
  );
}
