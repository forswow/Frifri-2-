import 'package:frifri/src/feature/search/domain/dto/search_dto.dart';

import '../entities/flight_search_result_entity.dart';

abstract interface class SearchTicketRepository {
  Future<FlightSearchResultEntity> search(SearchDto searchDto);
}
