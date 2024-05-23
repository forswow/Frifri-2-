import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/module/country_search/domain/entity/country_search_entity.dart';
import 'package:frifri/src/module/country_search/domain/repos/recent_search_repo.dart';

class RecentSearchesCubit extends Cubit<List<CountrySearchEntity>> {
  final IRecentSearchRepo recentSearchRepo;

  RecentSearchesCubit({required this.recentSearchRepo}) : super([]) {
    fetchRecentSearches().then((value) => emit(value));
  }

  Future<List<CountrySearchEntity>> fetchRecentSearches() async {
    final data = await recentSearchRepo.fetchRecentSearch();
    final recentSearches = data
        .map(
          (e) => CountrySearchEntity(
              airport: e.airport,
              code: e.countryCode,
              countryName: e.countryName,
              name: e.airport),
        )
        .toList();
    return recentSearches;
  }

  Future<void> addRecentSearch(CountrySearchEntity countrySearchEntity) async {
    if (!await recentSearchRepo.hasRecentSearch(countrySearchEntity.code)) {
      recentSearchRepo.addRecentSearch(countrySearchEntity);
    }

    emit(
      List.from(state)..add(countrySearchEntity),
    );
  }
}
