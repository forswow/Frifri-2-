import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets_result.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/search/search_data_sources.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/booking_ticket_entity.dart';

import 'package:frifri/src/feature/buy_ticket/domain/repository/search_tickets_repo.dart';

import '../dto/ticket_search_query.dart';

base class SearchTicketRepoImpl implements ISearchTicketsRepo {
  SearchTicketRepoImpl({required this.searchDataSources});

  final ISearchDataSources searchDataSources;

  @override
  Future<BookingTicketEntity> getABookingLink(String searchId) async {
    return await searchDataSources.getABookingLink(searchId);
  }

  @override
  Future<List<TicketsSearchResultBySearchId>> getTicketsBySearchId(
      String searchId) async {
    return await searchDataSources.getTicketsBySearchId(searchId);
  }

  @override
  Future<TicketsSearchIdResult> searchTicket(TicketsSearchQuery options) async {
    return await searchDataSources.searchTicket(options);
  }
}
