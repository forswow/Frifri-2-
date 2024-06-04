import 'package:equatable/equatable.dart';
import 'package:frifri/src/feature/shared/domain/entities/ticket_entity.dart';

sealed class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchingInProgress extends SearchState {
  SearchingInProgress({required this.tickets});

  final List<TicketEntity> tickets;

  @override
  List<Object?> get props => [tickets];
}

class SearchComplete extends SearchState {
  SearchComplete({required this.tickets});

  final List<TicketEntity> tickets;

  @override
  List<Object?> get props => [tickets];
}
