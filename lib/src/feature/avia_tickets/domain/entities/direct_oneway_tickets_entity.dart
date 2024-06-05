import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';

class DirectOnewayTicketsEntity {
  final DirectFlightEntity cheapestTicket;
  final List<DirectFlightEntity> allTickets;

  DirectOnewayTicketsEntity({
    required this.allTickets,
    required this.cheapestTicket,
  });
}
