import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:frifri/src/feature/shared/data/dto/prices_for_dates.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/destination_country_repo.dart';

class DirectFlightBloc extends Bloc<DirectFlightEvent, DirectFlightState> {
  final IDestinationCountryRepo _destinationCountryRepo;

  DirectFlightBloc(
    this._destinationCountryRepo,
  ) : super((DirectFlight$Idle())) {
    on<DirectFlight$FetchAirportsIataCodes>(_fetchDestinationAirportsIataCodes);
    on<FetchMonth>(_fetchMonthPrice);
  }

  Future<void> _fetchDestinationAirportsIataCodes(
    DirectFlight$FetchAirportsIataCodes event,
    Emitter<DirectFlightState> emit,
  ) async {
    try {
      emit(DirectFlight$AirportsFetchingInProgress());

      final airportsIataCodes =
          await _destinationCountryRepo.fetchDestinationCountries(event.table);
      logger.i("Airports: $airportsIataCodes");

      emit(DirectFlight$CountriesSuccess(countries: airportsIataCodes));

      final ticketsList = <PricesForDatesQuery>[];
      for (var element in airportsIataCodes) {
        final pricesQuery = PricesForDatesQuery(
          origin: element.origin,
          destination: element.destination,
          currency: event.price,
        );

        ticketsList.add(pricesQuery);

        emit(DirectFlight$TicketSuccess(tickets: ticketsList));
      }
    } on PostgrestException catch (error) {
      emit(DirectFlight$Error(message: error.message));
    }
  }

  Future<void> _fetchMonthPrice(
    FetchMonth event,
    Emitter<DirectFlightState> emit,
  ) async {
    try {
      emit(DirectFlight$AirportsFetchingInProgress());
      // final countries =
      //     await _destinationCountryRepo.fetchDestinationCountries(event.origin);

      final dataList = <MonthMatrix>[];
      await Future.delayed(const Duration(milliseconds: 500));
      emit(DirectFlight$TicketFetch());
      // for (var element in countries) {
      // final data = await _pricesDataSourceImpl.getMonthMatrix(
      //     MonthMatrixQuery(
      //         currency: event.currency,
      //         origin: element.origin,
      //         destination: element.destination,
      //         oneWay: false,
      //         month: DateTime.now()),
      //     event.locale);

      // logger.i(data.data);

      // if (data.data.isNotEmpty) {
      //   dataList.add(data);
      // }
      // }

      emit(DirectFlight$MonthSuccess(monthMatrix: dataList));
    } on PostgrestException catch (err) {
      emit(DirectFlight$Error(message: err.message));
    } on DioException catch (e) {
      emit(DirectFlight$Error(message: e.message!));
    }
  }
}
