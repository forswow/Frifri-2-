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
  Future<BookingTicketEntity> getABookingLink({
    required String searchId,
    required int termsUrl,
  }) async {
    return await searchDataSources.getABookingLink(
      searchId: searchId,
      termsUrl: termsUrl,
    );
  }

  @override
  Future<TicketsSearchResultBySearchId> getTicketsBySearchId(
      {required String searchId}) async {
    return await searchDataSources.getTicketsBySearchId(searchId);
  }

  @override
  Future<TicketsSearchIdResult> searchTicket(TicketsSearchQuery options) async {
    return await searchDataSources.searchTicket(options);
  }
}
