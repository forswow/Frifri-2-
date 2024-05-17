import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class SearchTicketEvent extends SearchEvent {
  final TicketsSearchQuery query;

  SearchTicketEvent(this.query);

  @override
  List<Object?> get props => [query];
}
