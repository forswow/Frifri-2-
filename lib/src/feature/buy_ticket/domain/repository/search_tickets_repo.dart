import 'package:frifri/src/feature/buy_ticket/domain/entities/search_form.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';

abstract interface class ISearchTicketsRepo {
  Future<List<TicketEntity>> getSearchTickets(SearchForm form);
}
