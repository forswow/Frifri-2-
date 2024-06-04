import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';

@immutable
sealed class DirectFlightState extends Equatable {}

final class DirectFlight$Idle extends DirectFlightState {
  @override
  List<Object?> get props => [];
}

final class DirectFlight$AirportsFetchingInProgress extends DirectFlightState {
  @override
  List<Object?> get props => [];
}

final class DirectFlight$AirportsFetchingSuccess extends DirectFlightState {
  DirectFlight$AirportsFetchingSuccess({required this.destinationIataCodes});

  final List<DestinationAirportEntity> destinationIataCodes;

  @override
  List<Object> get props => [destinationIataCodes];
}

final class DirectFlight$TicketFetch extends DirectFlightState {
  @override
  List<Object?> get props => [];
}

final class DirectFlight$TicketSuccess extends DirectFlightState {
  DirectFlight$TicketSuccess({required this.tickets});

  final List<DirectFlightEntity> tickets;

  @override
  List<Object> get props => [tickets];
}

final class DirectFlight$Error extends DirectFlightState {
  DirectFlight$Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
