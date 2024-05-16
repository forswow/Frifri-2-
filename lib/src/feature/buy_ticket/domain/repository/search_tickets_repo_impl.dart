import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/search_form.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/search_tickets_repo.dart';

class SearchTicketsRepoImpl implements ISearchTicketsRepo {
  IAviaTicketsApiClient apiClient;

  SearchTicketsRepoImpl({required this.apiClient});

  @override
  Future<List<TicketEntity>> getSearchTickets(SearchForm form) async {
    // await apiClient.searchTickets(options: TicketsSearchQuery(
    //   locale: "ru",
    //   passengers: form.
    // ));

    return Future.value([]);
  }
}
