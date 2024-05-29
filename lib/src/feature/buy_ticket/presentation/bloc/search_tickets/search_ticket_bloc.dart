import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/search_tickets_repo.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc_states.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchTicketsRepo ticketRepo;

  SearchBloc(this.ticketRepo) : super(SearchInitial()) {
    on<StartSearchTicketEvent>(
      _onStartSearchTicketEvent,
      transformer: restartable(),
    );
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
  }

  // TODO Реализация на стримах
  FutureOr<void> _onStartSearchTicketEvent(
      StartSearchTicketEvent event, Emitter<SearchState> emit) async {
    emit(SearchingInProgress(tickets: const []));

    try {
      final searchModel = event.searchModelForm;
      final query = generateTicketsSearchQueryFromForm(
          searchModel: searchModel, locale: event.locale);

      // Step 1: get search id
      final searchResult = await ticketRepo.searchTickets(query);
      final currencyRates = searchResult.currencyRates;
      final searchId = searchResult.searchId;

      // Step 2: get tickets by search id
      await Future.delayed(const Duration(seconds: 15));

      // Убеждаемся, что ивент не отменили новым
      if (emit.isDone) return;

      logger.i("SearchTicketsBloc: Sent search request");
      var newTickets = await ticketRepo.getTicketsBySearchId(
        searchId: searchId,
        originAirport: event.searchModelForm.departureAt!,
        destinationAirport: event.searchModelForm.arrivalAt!,
        currency: event.currency,
        locale: event.locale,
        currencyRates: currencyRates,
      );

      logger.i("Got tickets: ${newTickets.length}");

      sortTicketsByPrice(newTickets);
      emit(SearchComplete(tickets: newTickets));
    } on DioException catch (e, stack) {
      logger.e("DIO EXCEPTION: ${e.message}");
      Error.throwWithStackTrace(e, stack);
    } on Object catch (e, stack) {
      logger.e(e);
      Error.throwWithStackTrace(e, stack);
    }
  }

  TicketsSearchQuery generateTicketsSearchQueryFromForm({
    required SearchModel searchModel,
    required String locale,
  }) {
    TicketsSearchQuery options = TicketsSearchQuery(
      locale: locale,
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

  void sortTicketsByPrice(List<TicketEntity> tickets) {
    tickets.sort(
      (a, b) {
        return a.price.compareTo(b.price);
      },
    );
  }
}
