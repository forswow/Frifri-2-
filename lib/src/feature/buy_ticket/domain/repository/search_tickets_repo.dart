import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets_result.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';

import '../../data/DTO/search_tickets.dart';
import '../../data/dto/ticket_search_query.dart';

abstract interface class ISearchTicketsRepo {
  /// Main request with params.
  Future<TicketsSearchIdResult> searchTicket(final TicketsSearchQuery options);

  /// Get list companies offers.
  Future<TicketsSearchResultBySearchId> getTicketsBySearchId({
    required String searchId,
  });

  /// Get companies buy ticket link.
  Future<BookingTicketEntity> getABookingLink(final String searchId);
}
