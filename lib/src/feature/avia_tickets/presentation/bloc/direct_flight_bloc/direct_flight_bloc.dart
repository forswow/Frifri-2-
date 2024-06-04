import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dio/dio.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/destination_country_repo.dart';

class DirectFlightBloc extends Bloc<DirectFlightEvent, DirectFlightState> {
  final IDestinationCountryRepo _destinationCountryRepo;

  DirectFlightBloc(
    this._destinationCountryRepo,
  ) : super((DirectFlight$Idle())) {
    on<DirectFlight$FetchDestinationAirportsIataCodes>(
      _fetchDestinationAirportsIataCodes,
    );
    on<DirectFlight$FetchTickets>(
      _fetchTickets,
    );
  }

  // Запрашиваем _только_ IATA коды из supabase (коды назначения)
  // при этом коды вылета хранятся локально (3 города)
  Future<void> _fetchDestinationAirportsIataCodes(
    DirectFlight$FetchDestinationAirportsIataCodes event,
    Emitter<DirectFlightState> emit,
  ) async {
    try {
      emit(DirectFlight$AirportsFetchingInProgress());

      final airportsIataCodes = await _destinationCountryRepo
          .fetchDestinationAirports(event.originIataCode);

      emit(
        DirectFlight$AirportsFetchingSuccess(
          destinationIataCodes: airportsIataCodes,
        ),
      );
      emit(
        DirectFlight$AirportsFetchingSuccess(
          destinationIataCodes: airportsIataCodes,
        ),
      );
    } on PostgrestException catch (error) {
      emit(DirectFlight$Error(message: error.message));
    }
  }

  // По готовым IATA кодам, переданным в ивент
  // получаем ценнички <3
  Future<void> _fetchTickets(
    DirectFlight$FetchTickets event,
    Emitter<DirectFlightState> emit,
  ) async {
    try {
      // Тут получаем цены на билеты по готовым IATA кодам
    } on PostgrestException catch (err) {
      emit(DirectFlight$Error(message: err.message));
    } on DioException catch (e) {
      emit(DirectFlight$Error(message: e.message!));
    }
  }
}
