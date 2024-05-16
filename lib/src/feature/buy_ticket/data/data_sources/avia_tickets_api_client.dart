import 'package:meta/meta.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/latest_prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/month_matrix.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/prices_for_dates.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets_result.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/user_location.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';

import '../dto/ticket_search_query.dart';

abstract class IAviaTicketsApiClient {
  /// Main request with params.
  Future<TicketsSearchIdResult> searchTickets({
    required TicketsSearchQuery options,
  });

  /// Get list companies offers.
  Future<List<TicketsSearchResultBySearchId>> getTicketsBySearchId({
    required String searchId,
  });

  /// Get companies buy ticket link.
  Future<BookingTicketEntity> getABookingLink(final String searchId);

  /// The methods described below are optional.
  Future<List<AutocompleteResult>> getAutocomplete({
    required AutocompleteQuery options,
  });

  Future<PricesForDates> getPricesForDates({
    required PricesForDatesQuery options,
  });

  Future<UserLocation> getUserLocation({
    required UserLocationQuery options,
  });

  Future<LatestPrices> getLatestPrices({
    required LatestPricesQuery options,
  });

  Future<MonthMatrix> getMonthMatrix({
    required MonthMatrixQuery options,
  });
}

/// Returns a string like http://pics.avs.io/width/height/iata.png
/// which leads to the airline logo image
///
/// [size] should be "48/48", "36/36", "32/32" and etc
/// Example:
/// ```dart
/// getAirlineLogoUrl("BA", "48/48");
/// ```
///
/// But not all airlines have logos!
String getAirlineLogoUrl(
  String airlineIataCode,
  String size, {
  bool isRetina = false,
}) {
  return "http://pics.avs.io/$size/$airlineIataCode${isRetina ? "@2x" : ""}.png";
}
