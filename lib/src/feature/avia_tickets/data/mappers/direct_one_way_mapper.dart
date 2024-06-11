import 'package:frifri/src/feature/avia_tickets/domain/entities/ticket_record_entity.dart';

import '../../domain/entities/direct_oneway_tickets_entity.dart';

abstract interface class DirectOneWayMapper {
  static TicketRecordEntity of(DirectOnewayTicketsEntity data) {
    final cheap = data.cheapestTicket;
    return TicketRecordEntity(
      origin: cheap.departureLocationIataCode,
      destination: cheap.placeOfArrivalIataCode,
      index: 0,
    );
  }
}
