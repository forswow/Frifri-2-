import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/feature/shared/domain/entities/country_search_entity.dart';
import 'package:frifri/src/feature/shared/domain/repository/recent_search_repo.dart';

class RecentSearchesCubit extends Cubit<List<AutocompleteEntity>> {
  final IRecentSearchRepo recentSearchRepository;

  RecentSearchesCubit({required this.recentSearchRepository}) : super([]) {
    fetchRecentSearches().then((value) => emit(value));
  }

  Future<List<AutocompleteEntity>> fetchRecentSearches() async {
    final data = await recentSearchRepository.fetchRecentSearch();
    final recentSearches = data
        .map(
          (e) => AutocompleteEntity(
              airport: e.airport,
              code: e.countryCode,
              countryName: e.countryName,
              name: e.airport),
        )
        .toList();
    return recentSearches;
  }

  Future<void> addRecentSearch(AutocompleteEntity countrySearchEntity) async {
    if (!await recentSearchRepository
        .hasRecentSearch(countrySearchEntity.code)) {
      await recentSearchRepository.addRecentSearch(countrySearchEntity);
      emit(
        List.from(state)..add(countrySearchEntity),
      );
    }
  }
}
