import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/buy_ticket/data/repositories/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_states.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTicketRepoImpl ticketRepo;

  SearchBloc(this.ticketRepo) : super(SearchInitial()) {
    on<StartSearchTicketEvent>(_onStartSearchTicketEvent);
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    logger.i("BLOC: ${change.currentState} -> ${change.nextState}");
  }

  FutureOr<void> _onStartSearchTicketEvent(
      StartSearchTicketEvent event, Emitter<SearchState> emit) async {
    emit(SearchingInProgress());

    final List<TicketEntity> newTickets = [];

    try {
      final searchModel = event.searchModelForm;
      final query = generateTicketsSearchQueryFromForm(searchModel);

      // Step 1: get search id
      final searchResult = await ticketRepo.searchTickets(query);
      final searchId = searchResult.searchId;

      await Future.delayed(const Duration(seconds: 2));

      // Step 2: get tickets by search id
      var result = await ticketRepo.getTicketsBySearchId(searchId: searchId);
      if (result.data == null) {
        throw Exception("Tickets not found");
      }

      while (result.data!.isNotEmpty) {
        for (final chunk in result.data!) {
          for (final proposal in chunk.proposals) {
            // TODO: check if it is direct and required by form
            // if (proposal.isDirect && true)
            final List<SegmentEntity> ticketSegments = [];

            for (var proposalSegment in proposal.segments.first.flight) {
              final departureAirportName =
                  chunk.airports[proposalSegment.departureAt]!.name;
              final departureCityName =
                  chunk.airports[proposalSegment.departureAt]!.city;

              final arrivalAirportName =
                  chunk.airports[proposalSegment.arrivalAt]!.name;
              final arrivalCityName =
                  chunk.airports[proposalSegment.arrivalAt]!.city;

              final airlineName = chunk
                  .airlines[proposalSegment.operatedByAirlineIataCode]!.name;

              final departureDate =
                  DateTime.parse(proposalSegment.departureDate);
              final departureTime = proposalSegment.departureTime;

              final arrivalDate = DateTime.parse(proposalSegment.arrivalDate);
              final arrivalTime = proposalSegment.arrivalTime;

              // final airlineLogoUrl = ticketRepo.

              ticketSegments.add(
                SegmentEntity(
                  airlineLogo: getAirlineLogoUrl(
                    proposalSegment.operatedByAirlineIataCode,
                    "200/200",
                  ),
                  airlineName: airlineName,
                  arrivalAirportName: arrivalAirportName,
                  arrivalCityName: arrivalCityName,
                  departureAirportName: departureAirportName,
                  departureCityName: departureCityName,
                  departureDate: departureDate,
                  departureTime: departureTime,
                  arrivalDate: arrivalDate,
                  arrivalTime: arrivalTime,
                ),
              );
            }

            final formattedDuration =
                "${proposal.totalDurationInMinutes ~/ 60}h ${proposal.totalDurationInMinutes % 60}m";

            final bookingLinkResult = await ticketRepo.getABookingLink(
                searchId: searchId, termsUrl: proposal.terms.urlCode);
            final bookingLink = bookingLinkResult.url;

            final ticket = TicketEntity(
              originAirport: searchModel.departureAt!,
              destinationAirport: searchModel.arrivalAt!,
              flightDuration: formattedDuration,
              segmentsList: ticketSegments,
              departureTime: ticketSegments.first.departureTime,
              arrivalTime: ticketSegments.last.arrivalTime,
              price: proposal.terms.price,
              bookingLink: bookingLink,
            );

            newTickets.add(ticket);
          }
        }
        break;
        // result = await ticketRepo.getTicketsBySearchId(searchId: searchId);
      }

      print(newTickets);

      emit(SearchComplete(tickets: newTickets));
    } on DioException catch (e, stack) {
      logger.e("DIO EXCEPTION: ${e.message}");
      Error.throwWithStackTrace(e, stack);
    } on Object catch (e, stack) {
      logger.e(e);
      Error.throwWithStackTrace(e, stack);
    }
  }

  TicketsSearchQuery generateTicketsSearchQueryFromForm(
    SearchModel searchModel,
  ) {
    TicketsSearchQuery options = TicketsSearchQuery(
      tripClass:
          tripClassToDataString(searchModel.passengersAndClass!.tripClass),
      passengers: Passengers(
        adults: searchModel.passengersAndClass!.passengers.adults,
        children: searchModel.passengersAndClass!.passengers.children,
        infants: 0,
      ),
      segments: [
        Segment(
          origin: searchModel.departureAt!.code,
          destination: searchModel.arrivalAt!.code,
          date:
              "${searchModel.departureDate!.year}-${searchModel.departureDate!.month.toString().padLeft(2, '0')}-${searchModel.departureDate!.day.toString().padLeft(2, '0')}",
        ),
      ],
    );

    if (searchModel.returnDate != null) {
      options.segments.add(
        Segment(
          origin: searchModel.arrivalAt!.code,
          destination: searchModel.departureAt!.code,
          date:
              "${searchModel.returnDate!.year}-${searchModel.returnDate!.month.toString().padLeft(2, '0')}-${searchModel.returnDate!.day.toString().padLeft(2, '0')}",
        ),
      );
    }
    return options;
  }
}
