import 'package:frifri/src/module/country_search/domain/dto/input_dto.dart';
import 'package:frifri/src/module/country_search/domain/entity/country_search_entity.dart';

abstract interface class ICountrySearchRepo {
  Future<List<CountrySearchEntity>> fetchCountrySearch(InputDto inputDto);
}
