import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/avia_tickets/data/mappers/ticket_record_mapper.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/direct_oneway_tickets_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/direct_oneway_tickets_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dio/dio.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/destination_country_repository.dart';

import '../../../data/data_sources/database/ticket_record_local_data_sources.dart';

class DirectFlightBloc extends Bloc<DirectFlightEvent, DirectFlightState> {
  final IDestinationCountryRepo _destinationCountryRepo;
  final IDirectOnewayTicketsRepo _directOnewayRepo;

  final ITicketRecordLocalDataSources _ticketRecordDataSources;

  DirectFlightBloc(
    this._destinationCountryRepo,
    this._directOnewayRepo,
    this._ticketRecordDataSources,
  ) : super((DirectFlight$Idle())) {
    on<DirectFlight$FetchDestinationAirportsIataCodes>(
        _fetchDestinationAirportsIataCodes);
    on<DirectFlight$FetchTickets>(_fetchTickets);
    on<DirectFlight$OnReorder>(_onReorder);
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
      final data =
          await _ticketRecordDataSources.fetchTickets(event.originIataCode);

      final result = data.map((e) => TicketRecordMapper.of(e)).toList();
      if (data.isNotEmpty) {
        emit(
          DirectFlight$AirportsFetchingSuccess(destinationIataCodes: result),
        );

        return;
      }
      final airportsIataCodes = await _destinationCountryRepo
          .fetchDestinationAirports(event.originIataCode);

      emit(
        DirectFlight$AirportsFetchingSuccess(
          destinationIataCodes: airportsIataCodes,
        ),
      );

      logger.i("Airports fetched successfully:");
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
      emit(DirectFlight$TicketFetch());
      final List<DirectOnewayTicketsEntity> tickets = [];

      /// FIXME: перенести логику сортировки.

      // Тут получаем цены на билеты по готовым IATA кодам
      for (final destination in event.destinationIataCodes) {
        logger.i(
            "Fetching cheapest ticket for destination: ${destination.destination}");

        try {
          final directTickets =
              await _directOnewayRepo.getCheapestDirectOnewayFlight(
            originIataCode: event.originIataCode,
            destinationIataCode: destination.destination,
            currency: event.currency,
            locale: event.locale,
          );
          if (directTickets == null) continue;
          tickets.add(directTickets);
        } catch (e, s) {
          logger.e(e, stackTrace: s);
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

  FutureOr<void> _onReorder(
    DirectFlight$OnReorder event,
    Emitter<DirectFlightState> emit,
  ) async {
    try {
      await _ticketRecordDataSources.deleteTickets(event.country);

      await _ticketRecordDataSources.insertTickets(event.directOneWayTicket);
    } on Object catch (error, stack) {
      logger.e('message', error: error, stackTrace: stack);
    }
  }
}
