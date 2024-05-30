import 'package:frifri/src/feature/buy_ticket/data/dto/month_matrix.dart';

abstract interface class ICalendarPricesRepository {
  Future<MonthMatrix> getMonthMatrixPrices({
    required MonthMatrixQuery options,
  });
}
