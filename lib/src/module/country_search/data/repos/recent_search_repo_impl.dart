import 'package:frifri/src/core/data_base/search_database.dart';
import 'package:frifri/src/module/country_search/domain/entity/country_search_entity.dart';
import 'package:frifri/src/module/country_search/domain/repos/recent_search_repo.dart';

final class RecentSearchRepoImpl implements IRecentSearchRepo {
  @override
  Future<void> addRecentSearch(CountrySearchEntity countrySearchEntity) {
    // TODO: implement addRecentSearch
    throw UnimplementedError();
  }

  @override
  Future<List<RecentSearch>> fetchRecentSearch() {
    // TODO: implement fetchRecentSearch
    throw UnimplementedError();
  }
}
