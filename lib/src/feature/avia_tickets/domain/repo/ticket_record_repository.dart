import 'package:frifri/src/feature/avia_tickets/domain/entities/ticket_record_entity.dart';

/// {@macro ticket_record_repository.dart}
abstract interface class ITicketRecordRepository {
  /// In [departureCountry] must be transferred to the departure country.
  ///
  /// If there are no records in the database, an empty list will be returned.
  Future<List<TicketRecordEntity>> fetchTicketsIndex(String departureCountry);

  /// We pass [ticketIndexEntity] as arguments for writing to the database.
  Future<void> insertTicketIndex(TicketRecordEntity ticketIndexEntity);
}
