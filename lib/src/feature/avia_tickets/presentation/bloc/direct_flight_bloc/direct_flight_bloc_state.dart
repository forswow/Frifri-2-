import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/monthly_ticket_prices.dart';
import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';

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
