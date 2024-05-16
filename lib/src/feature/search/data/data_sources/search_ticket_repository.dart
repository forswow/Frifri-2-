import 'package:frifri/src/feature/search/domain/dto/search_dto.dart';

import '../../domain/entities/flight_search_result_entity.dart';

abstract interface class ISearchTicketDataSources {
  Future<FlightSearchResultEntity> search(SearchDto searchDto);
}

final class SearchTicketDataSources {}
