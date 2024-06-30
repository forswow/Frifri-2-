import 'package:frifri/src/feature/shared/data/dto/search_tickets.dart';
import 'package:frifri/src/feature/shared/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/shared/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/shared/domain/entities/booking_ticket_entity.dart';
import 'package:frifri/src/feature/shared/domain/entities/ticket_entity.dart';

abstract interface class ISearchTicketsRepo {
  /// Main request with params.
  Future<TicketsSearchIdResult> searchTickets(TicketsSearchQuery options);

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
