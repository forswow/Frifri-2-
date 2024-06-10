import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/ticket_record_entity.dart';

abstract final class DestinationMapper {
  static DestinationAirportEntity of(TicketRecordEntity value) {
    return DestinationAirportEntity(
        id: value.index, origin: value.origin, destination: value.destination);
  }
}



