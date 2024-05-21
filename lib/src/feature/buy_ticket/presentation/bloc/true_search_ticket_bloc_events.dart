import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class StartSearchTicketEvent extends SearchEvent {
  // final TicketsSearchQuery query;
  final SearchModel searchModelForm;
  final String locale;
  final String currency;

  StartSearchTicketEvent({
    required this.searchModelForm,
    required this.locale,
    required this.currency,
  });

  @override
  List<Object?> get props => [searchModelForm];
}
