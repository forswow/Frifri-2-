import 'package:frifri/src/feature/buy_ticket/data/data_sources/prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/calendar_prices_repository.dart';

class CalendarPricesRepositoryImpl implements ICalendarPricesRepository {
  final IPricesDataSource _pricesDataSource;

  CalendarPricesRepositoryImpl({required IPricesDataSource pricesDataSource})
      : _pricesDataSource = pricesDataSource;

  @override
  Future<MonthMatrix> getMonthMatrixPrices({
    required MonthMatrixQuery options,
  }) async {
    return await _pricesDataSource.getMonthMatrix(options, 'locale');
  }
}
