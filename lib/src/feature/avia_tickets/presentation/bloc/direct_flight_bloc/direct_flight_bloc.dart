import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/cheapest_direct_flight_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dio/dio.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/destination_country_repo.dart';

class DirectFlightBloc extends Bloc<DirectFlightEvent, DirectFlightState> {
  final IDestinationCountryRepo _destinationCountryRepo;
  final ICheapestDirectOnewayRepo _directOnewayRepo;

  DirectFlightBloc(
    this._destinationCountryRepo,
    this._directOnewayRepo,
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
      logger.i("Fetching airports from Supabase");
      emit(DirectFlight$AirportsFetchingInProgress());

      final airportsIataCodes = await _destinationCountryRepo
          .fetchDestinationAirports(event.originIataCode);

      emit(
        DirectFlight$AirportsFetchingSuccess(
          destinationIataCodes: airportsIataCodes,
        ),
      );

      logger.i("Airports fetched successfully:");
      logger.i(airportsIataCodes.toString());
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
      final List<DirectFlightEntity> tickets = [];

      // Тут получаем цены на билеты по готовым IATA кодам
      for (final destination in event.destinationIataCodes) {
        logger.i(
            "Fetching cheapest ticket for destination: ${destination.destination}");

        try {
          final cheapestTicket =
              await _directOnewayRepo.getCheapestDirectOnewayFlight(
            originIataCode: event.originIataCode,
            destinationIataCode: destination.destination,
            currency: event.currency,
          );
          if (cheapestTicket == null) continue;
          tickets.add(cheapestTicket);
        } catch (e, s) {
          logger.e(e);
          logger.e(s);
        }
      }

      emit(
        DirectFlight$TicketSuccess(tickets: tickets),
      );
    } on PostgrestException catch (err) {
      emit(DirectFlight$Error(message: err.message));
    } on DioException catch (e) {
      emit(DirectFlight$Error(message: e.message!));
    }
  }
}
