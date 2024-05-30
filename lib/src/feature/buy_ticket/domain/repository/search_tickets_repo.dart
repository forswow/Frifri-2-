import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';

import '../../data/DTO/search_tickets.dart';
import '../../data/dto/ticket_search_query.dart';

abstract interface class ISearchTicketsRepo {
  /// Main request with params.
  Future<TicketsSearchIdResult> searchTickets(final TicketsSearchQuery options);

  /// Get list companies offers.
  Future<List<TicketEntity>> getTicketsBySearchId({
    required String searchId,
    required AirportEntity originAirport,
    required AirportEntity destinationAirport,
    required String currency,
    required String locale,
    required Map<String, double> currencyRates,
  });

  /// Get companies buy ticket link.
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  });
}
