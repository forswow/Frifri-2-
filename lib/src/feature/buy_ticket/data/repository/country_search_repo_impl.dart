import 'package:frifri/src/feature/buy_ticket/data/data_sources/country_search_data_sources.dart';
import 'package:frifri/src/feature/buy_ticket/domain/dto/input_dto.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/country_search_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/country_search_repo.dart';

base class SearchCityRepoImpl implements ICountrySearchRepo {
  SearchCityRepoImpl({required this.searchCityDataSources});

  final ICountrySearchDataSources searchCityDataSources;

  @override
  Future<List<CountrySearchEntity>> fetchCountrySearch(
      InputDto inputDto) async {
    return await searchCityDataSources.fetchCountrySearch(inputDto);
  }
}
