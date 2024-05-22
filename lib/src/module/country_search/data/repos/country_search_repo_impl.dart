import 'package:frifri/src/module/country_search/data/data_sources/country_search_data_sources.dart';
import 'package:frifri/src/module/country_search/domain/dto/input_dto.dart';
import 'package:frifri/src/module/country_search/domain/entity/country_search_entity.dart';
import 'package:frifri/src/module/country_search/domain/repos/country_search_repo.dart';

base class SearchCityRepoImpl implements ICountrySearchRepo {
  SearchCityRepoImpl({required this.searchCityDataSources});

  final ICountrySearchDataSources searchCityDataSources;

  @override
  Future<List<CountrySearchEntity>> fetchCountrySearch(
      InputDto inputDto) async {
    return await searchCityDataSources.fetchCountrySearch(inputDto);
  }
}
