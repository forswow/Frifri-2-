import 'package:frifri/src/feature/shared/data/data_sources/prices.dart';
import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/shared/domain/repository/calendar_prices_repository.dart';

class CalendarPricesRepositoryImpl implements ICalendarPricesRepository {
  final IPricesDataSource _pricesDataSource;

  CalendarPricesRepositoryImpl({required IPricesDataSource pricesDataSource})
      : _pricesDataSource = pricesDataSource;

  @override
  Future<MonthMatrix> getMonthMatrixPrices({
    required MonthMatrixQuery options,
  }) async {
    return await _pricesDataSource.getMonthMatrix(options: options);
  }
}
