import 'package:frifri/src/feature/avia_tickets/data/models/autocomplete.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/latest_prices.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/prices_for_dates.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/search_tickets.dart';
import 'package:frifri/src/feature/avia_tickets/data/models/user_location.dart';

abstract class AviaTicketsApiClient {
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

  Future<TicketsSearchIdResult> searchTickets({
    required TicketsSearchQuery options,
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
