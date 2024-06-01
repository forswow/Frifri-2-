import 'package:frifri/src/feature/avia_tickets/domain/tranfers/direct_flight_transfer.dart';

import '../entities/monthly_ticket_prices.dart';

abstract interface class IMonthlyPricesRepo {
  Future<MonthlyTicketPricesEntity> fetchMonthlyTicketPrices(
    DirectFlightTransfer transfer,
  );
}
