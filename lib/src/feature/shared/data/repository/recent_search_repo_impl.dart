import 'package:frifri/src/core/data_base/search_database.dart';
import 'package:frifri/src/feature/shared/domain/entities/country_search_entity.dart';
import 'package:frifri/src/feature/shared/domain/repository/recent_search_repo.dart';

final class RecentSearchRepo implements IRecentSearchRepo {
  RecentSearchRepo({
    required this.db,
  });

  AppDatabase db;

  @override
  Future<void> addRecentSearch(AutocompleteEntity countrySearchEntity) async {
    await db.addRecentSearch(
      RecentSearchData(
        countryName: countrySearchEntity.countryName,
        countryCode: countrySearchEntity.code,
        airport: countrySearchEntity.name,
      ),
    );
  }

  @override
  Future<List<RecentSearchData>> fetchRecentSearch() async {
    return db.getRecentSearches();
  }

  @override
  Future<bool> hasRecentSearch(String countryCode) async {
    return db.hasRecentSearches(countryCode);
  }
}
