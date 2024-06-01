import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/avia_tickets/domain/tranfers/direct_flight_transfer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../buy_ticket/data/data_sources/prices.dart';
import '../../../buy_ticket/data/dto/month_matrix.dart';
import '../../domain/entities/destination_country_entity.dart';
import '../../domain/entities/monthly_ticket_prices.dart';
import '../../domain/repo/destination_country_repo.dart';
import '../../domain/repo/montly_prices_repo.dart';

class DirectFlightBloc extends Bloc<DirectFlightEvent, DirectFlightState> {
  final IMonthlyPricesRepo _monthlyPricesRepo;
  final IDestinationCountryRepo _destinationCountryRepo;
  final IPricesDataSource _pricesDataSourceImpl;

  DirectFlightBloc(
    this._destinationCountryRepo,
    this._monthlyPricesRepo,
    this._pricesDataSourceImpl,
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
      final countries =
          await _destinationCountryRepo.fetchDestinationCountries(event.origin);

      final dataList = <MonthMatrix>[];
      await Future.delayed(const Duration(milliseconds: 500));
      emit(DirectFlight$TicketFetch());
      for (var element in countries) {
        final data = await _pricesDataSourceImpl.getMonthMatrix(
            MonthMatrixQuery(
                currency: event.currency,
                origin: element.origin,
                destination: element.destination,
                oneWay: false,
                month: DateTime.now()),
            event.locale);

        logger.i(data.data);

        if (data.data.isNotEmpty) {
          dataList.add(data);
        }
      }

      emit(DirectFlight$MonthSuccess(monthMatrix: dataList));
    } on PostgrestException catch (err) {
      emit(DirectFlight$Error(message: err.message));
    } on DioException catch (e, s) {
      emit(DirectFlight$Error(message: e.message!));
    }
  }
}

@immutable
sealed class DirectFlightState extends Equatable {}

final class DirectFlight$Idle extends DirectFlightState {
  @override
  List<Object?> get props => [];
}

final class DirectFlight$TicketSuccess extends DirectFlightState {
  DirectFlight$TicketSuccess({required this.tickets});

  final List<MonthlyTicketPricesEntity> tickets;

  @override
  List<Object> get props => [tickets];
}

final class DirectFlight$CountriesFetch extends DirectFlightState {
  @override
  List<Object?> get props => [];
}

final class DirectFlight$TicketFetch extends DirectFlightState {
  @override
  List<Object?> get props => [];
}

final class DirectFlight$CountriesSuccess extends DirectFlightState {
  DirectFlight$CountriesSuccess({required this.countries});

  final List<DestinationCountryEntity> countries;

  @override
  List<Object> get props => [countries];
}

final class DirectFlight$MonthSuccess extends DirectFlightState {
  DirectFlight$MonthSuccess({required this.monthMatrix});

  final List<MonthMatrix> monthMatrix;

  @override
  List<Object> get props => [monthMatrix];
}

final class DirectFlight$Error extends DirectFlightState {
  DirectFlight$Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

abstract class DirectFlightEvent extends Equatable {}

final class DirectFlight$Fetch extends DirectFlightEvent {
  DirectFlight$Fetch({
    required this.transfer,
  });

  final DirectFlightTransfer transfer;

  @override
  List<Object> get props => [transfer];
}

final class DirectFlight$FetchCountries extends DirectFlightEvent {
  DirectFlight$FetchCountries({
    required this.table,
    required this.price,
  });

  final String table;
  final String price;

  @override
  List<Object> get props => [table, price];
}

final class FetchMonth extends DirectFlightEvent {
  FetchMonth({
    required this.locale,
    required this.currency,
    required this.origin,
  });

  final String locale;

  final String currency;

  final String origin;

  @override
  List<Object> get props => [currency, locale];
}
