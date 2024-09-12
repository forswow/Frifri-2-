import 'package:frifri/src/feature/shared/data/data_sources/airline_logo.dart';
import 'package:frifri/src/feature/shared/data/data_sources/booking.dart';
import 'package:frifri/src/feature/shared/data/data_sources/search_tickets.dart';
import 'package:frifri/src/feature/shared/data/dto/search_tickets.dart';
import 'package:frifri/src/feature/shared/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/shared/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/shared/domain/entities/booking_ticket_entity.dart';
import 'package:frifri/src/feature/shared/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/shared/domain/repository/search_tickets_repo.dart';
import 'package:intl/intl.dart';

base class SearchTicketRepoImpl implements ISearchTicketsRepo {
  SearchTicketRepoImpl({
    required this.searchDataSources,
    required this.bookingDataSources,
  });

  final ITicketsDataSource searchDataSources;
  final IBookingDataSource bookingDataSources;

  @override
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  }) async {
    return bookingDataSources.getABookingLink(
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

    final result =
        await searchDataSources.getTicketsBySearchId(searchId: searchId);

    // Bang операторы используются по причине того, что
    // API всегда содержит вместе с собой airlines мапу
    // необходимую для получения названия самолёта/аэролинии
    // и она гарантировано содержит IATA код для каждого proposal

    // Сами же airports, proposals, airlines являются nullable
    // то есть апи может их и вовсе не прислать
    //
    // А пришлёт она только 1 элемент в массиве, который будет содержать
    // searchId, из которого собрать чанк нельзя
    //
    // UPD: Скорее всего это всё равно бред безумца и надо всё исправить
    // я извиняюсь за содеянное, но теперь оно хотя бы не в блоке :O
    while (result.data.length != 1) {
      for (final chunk in result.data) {
        for (final proposal in chunk.proposals) {
          final List<SegmentEntity> ticketSegments = [];

          for (final proposalSegment in proposal.segments) {
            for (final segment in proposalSegment.flight) {
              final segmentDuration = segment.duration;

              ticketSegments.add(
                SegmentEntity(
                  airlineLogo: getAirlineLogoUrl(
                    segment.operatedByAirlineIataCode,
                    '200/200',
                  ),
                  airlineName:
                      chunk.airlines[segment.operatedByAirlineIataCode]!.name,
                  arrivalAirportName: chunk.airports[segment.arrivalAt]!.name,
                  arrivalCityName: chunk.airports[segment.arrivalAt]!.city,
                  departureAirportName:
                      chunk.airports[segment.departureAt]!.name,
                  departureCityName: chunk.airports[segment.departureAt]!.city,
                  departureDate: DateTime.parse(segment.departureDate),
                  departureTime: segment.departureTime,
                  arrivalDate: DateTime.parse(segment.arrivalDate),
                  arrivalTime: segment.arrivalTime,
                  arrivalTimestamp: segment.arrivalTimestamp,
                  departureTimestamp: segment.departureTimestamp,
                  durationInMinutes: segmentDuration,
                ),
              );
            }
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
            durationInMinutes: proposal.totalDurationInMinutes,
            segmentsList: ticketSegments,
            departureTime: ticketSegments.first.departureTime,
            arrivalTime: ticketSegments.last.arrivalTime,

            // TODO: Вынести форматирование цены наружу?
            formattedPrice: priceFormatter
                .format(
                  priceInRubles ~/ currencyRate,
                )
                .replaceAll(',', ' '),
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
    return searchDataSources.searchTickets(options: options);
  }
}
