import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/repositories/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTicketRepoImpl ticketRepo;

  SearchBloc(this.ticketRepo) : super(SearchInitial());

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    if (change.currentState is SearchingInProgress) {
      logger.i("BLOC: ${change.currentState} \n-> \n${change.nextState}");
    }
  }
}
