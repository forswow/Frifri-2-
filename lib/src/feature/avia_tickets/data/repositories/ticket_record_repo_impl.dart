import 'package:frifri/src/feature/avia_tickets/domain/entities/ticket_record_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/ticket_record_repository.dart';

final class TicketRecordRepositoryImpl implements ITicketRecordRepository {


  @override
  Future<List<TicketRecordEntity>> fetchTicketsIndex(String departureCountry) {
    // TODO: implement fetchTicketsIndex
    throw UnimplementedError();
  }

  @override
  Future<void> insertTicketIndex(TicketRecordEntity ticketIndexEntity) {
    // TODO: implement insertTicketIndex
    throw UnimplementedError();
  }
}
