import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/search/search_data_sources.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';

import 'package:frifri/src/feature/buy_ticket/domain/repository/search_tickets_repo.dart';
import 'package:intl/intl.dart';

import '../dto/ticket_search_query.dart';

base class SearchTicketRepoImpl implements ISearchTicketsRepo {
  SearchTicketRepoImpl({required this.searchDataSources});

  final ISearchDataSources searchDataSources;

  @override
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  }) async {
    return await searchDataSources.getABookingLink(
      searchId: searchId,
      termsUrl: termsUrl,
    );
  }

  @override
  Future<List<TicketEntity>> getTicketsBySearchId({
    required String searchId,
    required AirportEntity originAirport,
    required AirportEntity destinationAirport,
    required String currency,
    required String locale,
    required Map<String, double> currencyRates,
  }) async {
    final List<TicketEntity> newTickets = [];

    final result = await searchDataSources.getTicketsBySearchId(searchId);

    // Bang операторы используются по причине того, что
    // API всегда содержит вместе с собой airlines мапу
    // необходимую для получения названия самолёта/аэролинии
    // и она гарантировано содержит IATA код для каждого proposal

    // Сами же airports, proposals, airlines являются nullable
    // то есть апи может их и вовсе не прислать
    //
    // А пришлёт она только 1 элемент в массиве, который будет содержать
    // searchId, из которого собрать чанк нельзя
    while (result.data.length != 1) {
      for (final chunk in result.data) {
        for (final proposal in chunk.proposals) {
          final List<SegmentEntity> ticketSegments = [];

          for (var proposalSegment in proposal.segments.first.flight) {
            final segmentDuration = proposalSegment.duration;

            ticketSegments.add(
              SegmentEntity(
                airlineLogo: getAirlineLogoUrl(
                  proposalSegment.operatedByAirlineIataCode,
                  "200/200",
                ),
                airlineName: chunk
                    .airlines[proposalSegment.operatedByAirlineIataCode]!.name,
                arrivalAirportName:
                    chunk.airports[proposalSegment.arrivalAt]!.name,
                arrivalCityName:
                    chunk.airports[proposalSegment.arrivalAt]!.city,
                departureAirportName:
                    chunk.airports[proposalSegment.departureAt]!.name,
                departureCityName:
                    chunk.airports[proposalSegment.departureAt]!.city,
                departureDate: DateTime.parse(proposalSegment.departureDate),
                departureTime: proposalSegment.departureTime,
                arrivalDate: DateTime.parse(proposalSegment.arrivalDate),
                arrivalTime: proposalSegment.arrivalTime,
                segmentFormattedDuration:
                    "${segmentDuration ~/ 60}h ${segmentDuration % 60}m",
                arrivalTimestamp: proposalSegment.arrivalTimestamp,
                departureTimestamp: proposalSegment.departureTimestamp,
              ),
            );
          }

          final priceInRubles = proposal.terms.priceInRubles;
          final currencyRate = currencyRates[currency]!;

          final priceFormatter = NumberFormat.simpleCurrency(
            decimalDigits: 0,
            name: currency.toUpperCase(),
            locale: locale.toUpperCase(),
          );

          final ticket = TicketEntity(
            originAirport: originAirport,
            destinationAirport: destinationAirport,
            flightDuration:
                "${proposal.totalDurationInMinutes ~/ 60}h ${proposal.totalDurationInMinutes % 60}m",
            segmentsList: ticketSegments,
            departureTime: ticketSegments.first.departureTime,
            arrivalTime: ticketSegments.last.arrivalTime,

            formattedPrice: priceFormatter
                .format(
                  priceInRubles ~/ currencyRate,
                )
                .replaceAll(",", " "),
            price: priceInRubles ~/ currencyRate,

            isDirect: proposal.isDirect,

            // For forming url for booking
            searchId: searchId,
            termsUrl: proposal.terms.urlCode,
          );

          newTickets.add(ticket);
        }
      }

      break;
    }

    return newTickets;
  }

  @override
  Future<TicketsSearchIdResult> searchTickets(
      TicketsSearchQuery options) async {
    return await searchDataSources.searchTickets(options: options);
  }

  @override
  Future<MonthMatrix> getMonthMatrixPrices({
    required MonthMatrixQuery options,
  }) async {
    return await searchDataSources.getMonthMatrix(options: options);
  }
}
