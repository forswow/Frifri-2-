import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/passengers_and_class.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class InputDepartureAtEvent extends SearchEvent {
  InputDepartureAtEvent(this.airport);

  final AirportEntity airport;

  @override
  List<Object?> get props => [airport];
}

class InputArrivalAtEvent extends SearchEvent {
  InputArrivalAtEvent(this.airport);

  final AirportEntity airport;

  @override
  List<Object?> get props => [airport];
}

class InputDepartureDateEvent extends SearchEvent {
  InputDepartureDateEvent(this.departureDate);

  final DateTime departureDate;

  @override
  List<Object?> get props => [departureDate];
}

class InputReturnDateEvent extends SearchEvent {
  InputReturnDateEvent(this.returnAt);

  final DateTime? returnAt;

  @override
  List<Object?> get props => [returnAt];
}

class InputPassengersAndClass extends SearchEvent {
  InputPassengersAndClass(this.passengersAndClass);

  final PassengersAndClass passengersAndClass;

  @override
  List<Object?> get props => [passengersAndClass];
}
