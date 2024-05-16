import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/repositories/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTicketRepoImpl ticketRepo;

  SearchBloc(this.ticketRepo) : super(FillingFormOptions()) {
    on<InputDepartureAtEvent>(_onInputDepartureAtEvent);
    on<InputArrivalAtEvent>(_onInputArrivalAtEven);
    on<InputDepartureDateEvent>(_onInputDepartureDateEvent);
    on<InputReturnDateEvent>(_onInputReturnDateEvent);
    on<InputPassengersAndClass>(_onInputPassengersAndClass);
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    if (change.currentState is FillingFormOptions) {
      logger.i("BLOC: ${change.currentState} \n-> \n${change.nextState}");
    }
  }

  FutureOr<void> _onInputDepartureAtEvent(
      InputDepartureAtEvent event, Emitter<SearchState> emit) {
    final localState = state as FillingFormOptions;

    // Если выбрали ту же точку вылета что и взлёта - игнорируем
    if (localState.arrivalAt != null) {
      if (localState.arrivalAt!.code == event.airport.code) {
        return null;
      }
    }

    if (state is FillingFormOptions) {
      emit((state as FillingFormOptions).copyWith(
        departureAt: event.airport,
      ));
    }
  }

  FutureOr<void> _onInputArrivalAtEven(
      InputArrivalAtEvent event, Emitter<SearchState> emit) {
    if (state is FillingFormOptions) {
      final localState = state as FillingFormOptions;

      if (localState.departureAt != null) {
        if (localState.departureAt!.code == event.airport.code) {
          return null;
        }
      }

      emit(localState.copyWith(
        arrivalAt: event.airport,
      ));
    }
  }

  FutureOr<void> _onInputDepartureDateEvent(
      InputDepartureDateEvent event, Emitter<SearchState> emit) {}

  FutureOr<void> _onInputReturnDateEvent(
      InputReturnDateEvent event, Emitter<SearchState> emit) {}

  FutureOr<void> _onInputPassengersAndClass(
      InputPassengersAndClass event, Emitter<SearchState> emit) {}
}
