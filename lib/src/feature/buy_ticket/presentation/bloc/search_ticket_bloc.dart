import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';
import '../../data/DTO/search_tickets_result.dart';
import '../../data/dto/ticket_search_query.dart';
import '../../domain/repository/search_tickets_repo.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchTicketsRepo ticketRepo;

  SearchBloc(this.ticketRepo) : super(EnteringParameters()) {
    on<FetchDepartureLocation>(fetchDepartureLocation);
    on<FetchDepartureDate>(_fetchDepartureDate);
    on<FetchPassengersAndTripClass>(_fetchPassengers);
    on<UpdateLocale>(_updateLocale);
    on<CollectParameters>(_collectParameters);
    on<SearchTicket>(_searchTicket);
    on<GetABookingLink>(_getABookingLink);
  }

  void fetchDepartureLocation(
      FetchDepartureLocation event, Emitter<SearchState> emit) async {
    /// Get Segment instance.
    final segment = EnteringParameters()
        .segment
        .copyWith(destination: event.destination, origin: event.origin);

    /// Update segment field: destination, origin.
    emit(EnteringParameters().copyWith(segment: segment));
  }

  /// Update [date] field in [Segment].
  void _fetchDepartureDate(
      FetchDepartureDate event, Emitter<SearchState> emit) {
    /// Get Segment instance.
    final segment = EnteringParameters().segment.copyWith(date: event.date);

    /// Update segment field: "date".
    emit(EnteringParameters().copyWith(segment: segment));
  }

  /// Update field [adults],[children],[tripClass].
  void _fetchPassengers(
      FetchPassengersAndTripClass event, Emitter<SearchState> emit) {
    /// Get segment instance.
    final passengers = EnteringParameters().passengers.copyWith(
        children: event.passengers.children, adults: event.passengers.adults);

    final ticketSearchQuery = EnteringParameters()
        .ticketsSearchQuery
        .copyWith(tripClass: event.tripClass);

    /// Update field;
    emit(EnteringParameters().copyWith(
        passengers: passengers, ticketsSearchQuery: ticketSearchQuery));
  }

  /// Update field [locale];
  void _updateLocale(UpdateLocale event, Emitter<SearchState> emit) {
    /// Get TicketSearch instance.
    final ticketSearch = EnteringParameters().ticketsSearchQuery;

    emit(EnteringParameters().copyWith(
        ticketsSearchQuery: ticketSearch.copyWith(locale: event.langCode)));
  }

  /// NOT OPTIONALITY!!!
  ///
  /// Collect params.
  void _collectParameters(CollectParameters event, Emitter<SearchState> emit) {
    /// Get TicketSearch instance.
    final state = EnteringParameters();

    state.copyWith(
        ticketsSearchQuery: state.ticketsSearchQuery.copyWith(
      passengers: state.passengers,
      segments: [state.segment],
    ));

    print(state.toString());
  }

  Future<void> _searchTicket(
      SearchTicket event, Emitter<SearchState> emit) async {
    try {
      final searchResult = await ticketRepo.searchTicket(event.options);

      final ticketList =
          await ticketRepo.getTicketsBySearchId(searchResult.searchId);

      emit(SearchCompleted(ticketList: ticketList, options: event.options));
    } on DioException catch (error, stack) {
      final message = error.message;
      final statusCode = error.response!.statusCode;
      debugPrintStack(
          stackTrace: stack,
          label: 'message: $message statusCode: $statusCode');
      emit(Failure(message: '$message', statusCode: '$message'));
    }
  }

  Future<void> _getABookingLink(
      GetABookingLink event, Emitter<SearchState> emit) async {
    try {
      final link = await ticketRepo.getABookingLink(event.searchId);

      emit(LinkFetched(bookingTicketEntity: link));
    } on DioException catch (error, stack) {
      final message = error.message;
      final statusCode = error.response!.statusCode;
      debugPrintStack(
          stackTrace: stack,
          label: 'message: $message statusCode: $statusCode');
      emit(Failure(message: '$message', statusCode: '$message'));
    }
  }
}

@immutable
sealed class SearchState extends Equatable {}

final class EnteringParameters extends SearchState {
  EnteringParameters({
    TicketsSearchQuery? ticketsSearchQuery,
    Segment? segment,
    Passengers? passengers,
  })  : ticketsSearchQuery = TicketsSearchQuery(),
        segment = Segment(),
        passengers = Passengers();

  final TicketsSearchQuery ticketsSearchQuery;
  final Segment segment;
  final Passengers passengers;

  EnteringParameters copyWith({
    TicketsSearchQuery? ticketsSearchQuery,
    Segment? segment,
    Passengers? passengers,
  }) {
    return EnteringParameters(
      ticketsSearchQuery: ticketsSearchQuery ?? this.ticketsSearchQuery,
      segment: segment ?? this.segment,
      passengers: passengers ?? this.passengers,
    );
  }

  @override
  List<Object?> get props => [ticketsSearchQuery];
}

final class SearchCompleted extends SearchState {
  SearchCompleted({required this.ticketList, required this.options});

  final List<TicketsSearchResultBySearchId> ticketList;

  final TicketsSearchQuery options;

  @override
  List<Object?> get props => [ticketList, options];
}

final class Failure extends SearchState {
  Failure({required this.message, required this.statusCode});

  final String message;
  final String statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class LinkFetched extends SearchState {
  LinkFetched({required this.bookingTicketEntity});

  final BookingTicketEntity bookingTicketEntity;

  @override
  List<Object?> get props => [bookingTicketEntity];
}

@immutable
abstract class SearchEvent extends Equatable {}

final class FetchDepartureLocation extends SearchEvent {
  FetchDepartureLocation({required this.destination, required this.origin});

  final String destination;
  final String origin;

  @override
  List<Object?> get props => [destination, origin];
}

final class FetchDepartureDate extends SearchEvent {
  FetchDepartureDate({required this.date});

  final String date;

  @override
  List<Object?> get props => [date];
}

final class FetchPassengersAndTripClass extends SearchEvent {
  FetchPassengersAndTripClass(
      {required this.passengers, required this.tripClass});

  final Passengers passengers;
  final String tripClass;

  @override
  List<Object?> get props => [passengers, tripClass];
}

final class UpdateLocale extends SearchEvent {
  UpdateLocale({required this.langCode});

  final String langCode;

  @override
  List<Object?> get props => [langCode];
}

final class CollectParameters extends SearchEvent {
  @override
  List<Object?> get props => [];
}

final class SearchTicket extends SearchEvent {
  SearchTicket({required this.options});

  final TicketsSearchQuery options;

  @override
  List<Object?> get props => [options];
}

final class GetABookingLink extends SearchEvent {
  GetABookingLink({required this.searchId});

  final String searchId;

  @override
  List<Object?> get props => [searchId];
}
