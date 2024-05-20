import 'package:equatable/equatable.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';

sealed class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchingInProgress extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchComplete extends SearchState {
  SearchComplete({required this.tickets});

  final List<TicketEntity> tickets;

  @override
  List<Object?> get props => [];
}
