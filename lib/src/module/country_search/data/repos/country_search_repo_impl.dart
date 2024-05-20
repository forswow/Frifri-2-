import 'package:frifri/src/module/country_search/data/data_sources/country_search_data_sources.dart';
import 'package:frifri/src/module/country_search/domain/dto/input_dto.dart';
import 'package:frifri/src/module/country_search/domain/entity/country_search_entity.dart';
import 'package:frifri/src/module/country_search/domain/repos/country_search_repo.dart';

base class CountrySearchRepoImpl implements ICountrySearchRepo {
  CountrySearchRepoImpl({required this.countrySearchDataSources});

  final ICountrySearchDataSources countrySearchDataSources;

  @override
  Future<List<CountrySearchEntity>> fetchCountrySearch(
      InputDto inputDto) async {
    return await countrySearchDataSources.fetchCountrySearch(inputDto);
  }
}
