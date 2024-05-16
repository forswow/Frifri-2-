import 'package:equatable/equatable.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';

sealed class SearchState extends Equatable {}

class FillingFormOptions extends SearchState {
  FillingFormOptions({
    this.options = const TicketsSearchQuery(),
    this.departureAt,
    this.arrivalAt,
    this.departureDate,
    this.returnDate,
    this.passengers,
    this.tripClass,
  });

  // Начальные значения формы
  // формироваться она будет при submit-е
  // с помощью полей ниже
  final TicketsSearchQuery options;

  // Поля ввода локаций
  final AirportEntity? departureAt;
  final AirportEntity? arrivalAt;

  // Поля ввода дат прилёта и возврата
  final DateTime? departureDate;
  final DateTime? returnDate;

  // Поля ввода количества пассажиров и класса билета
  final Passengers? passengers;
  final TripClass? tripClass;

  @override
  List<Object?> get props => [
        options,
        departureAt,
        arrivalAt,
        departureDate,
        returnDate,
        passengers,
        tripClass,
      ];

  FillingFormOptions copyWith({
    TicketsSearchQuery? options,
    AirportEntity? departureAt,
    AirportEntity? arrivalAt,
    DateTime? departureDate,
    DateTime? returnDate,
    Passengers? passengers,
    TripClass? tripClass,
  }) {
    return FillingFormOptions(
      options: options ?? this.options,
      departureAt: departureAt ?? this.departureAt,
      arrivalAt: arrivalAt ?? this.arrivalAt,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      passengers: passengers ?? this.passengers,
      tripClass: tripClass ?? this.tripClass,
    );
  }
}
