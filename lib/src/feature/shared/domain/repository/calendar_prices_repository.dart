import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';

abstract interface class ICalendarPricesRepository {
  Future<MonthMatrix> getMonthMatrixPrices({
    required MonthMatrixQuery options,
  });
}
