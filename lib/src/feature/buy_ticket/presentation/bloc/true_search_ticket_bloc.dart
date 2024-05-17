import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/repositories/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTicketRepoImpl ticketRepo;

  SearchBloc(this.ticketRepo) : super(SearchInitial()) {
    on<StartSearchTicketEvent>(_onSearchTicketEvent);
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    logger.i("BLOC: ${change.currentState} -> ${change.nextState}");
  }

  FutureOr<void> _onSearchTicketEvent(
      StartSearchTicketEvent event, Emitter<SearchState> emit) async {
    emit(SearchingInProgress());

    logger.i("Start searching for ${event.query}");
    try {
      final searchResult = await ticketRepo.searchTicket(event.query);

      final searchId = searchResult.searchId;
      logger.i("Got searchID: $searchId");

      final allTickets = await ticketRepo.getTicketsBySearchId(searchId);
      for (var ticket in allTickets) {
        logger.i("------------- TICKET ---------");
        logger.i("------------------------------");
      }
      emit(SearchComplete(tickets: const []));
    } on DioException catch (e, stack) {
      logger.e("DIO EXCEPTION: ${e.message}");
      Error.throwWithStackTrace(e, stack);
    } on Object catch (e, stack) {
      logger.e(e);
      Error.throwWithStackTrace(e, stack);
    }
  }
}
