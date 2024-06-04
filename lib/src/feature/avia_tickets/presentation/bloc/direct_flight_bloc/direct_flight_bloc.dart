import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/feature/avia_tickets/domain/tranfers/direct_flight_transfer.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:frifri/src/feature/buy_ticket/data/dto/month_matrix.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/monthly_ticket_prices.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/destination_country_repo.dart';
import 'package:frifri/src/feature/avia_tickets/domain/repo/montly_prices_repo.dart';

class DirectFlightBloc extends Bloc<DirectFlightEvent, DirectFlightState> {
  final IMonthlyPricesRepo _monthlyPricesRepo;
  final IDestinationCountryRepo _destinationCountryRepo;

  DirectFlightBloc(
    this._destinationCountryRepo,
    this._monthlyPricesRepo,
  ) : super((DirectFlight$Idle())) {
    on<DirectFlight$FetchCountries>(
        (event, emit) => _fetchCounties(event, emit));
    on<FetchMonth>(_fetchMonthPrice);
  }

  Future<void> _fetchCounties(
    DirectFlight$FetchCountries event,
    Emitter<DirectFlightState> emit,
  ) async {
    try {
      emit(DirectFlight$CountriesFetch());
      final countries =
          await _destinationCountryRepo.fetchDestinationCountries(event.table);

      emit(DirectFlight$CountriesSuccess(countries: countries));

      final ticketsList = <MonthlyTicketPricesEntity>[];
      for (var element in countries) {
        final price = await _monthlyPricesRepo
            .fetchMonthlyTicketPrices(DirectFlightTransfer.optional(
          currencyParam: event.price,
          destinationParam: element.destination,
          originParam: element.origin,
        ));
        ticketsList.add(price);

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
      emit(DirectFlight$CountriesFetch());
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
