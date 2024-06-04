import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/shared/domain/dto/input_dto.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/domain/entities/country_search_entity.dart';
import '../../../../shared/domain/repository/autocomplete_repository.dart';

class SearchCityBloc extends Bloc<CitySearchEvent, SearchCityState> {
  final IAutocompleteRepository autocompleteRepo;

  SearchCityBloc(this.autocompleteRepo) : super(Idle()) {
    on<StartCitySearchEvent>(
      _searchCountry,
      transformer: (event, mapper) => event
          .throttleTime(
            const Duration(milliseconds: 200),
          )
          .debounceTime(
            const Duration(milliseconds: 200),
          )
          .switchMap(mapper),
    );
  }

  FutureOr<void> _searchCountry(
      StartCitySearchEvent event, Emitter<SearchCityState> emit) async {
    try {
      if (event.text.isEmpty) {
        emit(Idle());
        return;
      }

      emit(SearchInProgress());

      final countrySearchList = await autocompleteRepo.getAutocomplete(
        autocompleteInputDTO: AutocompleteInputDTO(
          term: event.text,
          locale: event.locale,
        ),
      );

      emit(SearchCompleted(countrySearchList: countrySearchList));
    } on DioException catch (error, stackTrace) {
      logger.e('CountrySearchBloc', error: error, stackTrace: stackTrace);
      emit(
        SearchFailure(message: error.message ?? ''),
      );
    }
  }
}

@immutable
sealed class SearchCityState extends Equatable {}

final class Idle extends SearchCityState {
  @override
  List<Object> get props => [];
}

final class SearchInProgress extends SearchCityState {
  @override
  List<Object?> get props => [];
}

final class SearchCompleted extends SearchCityState {
  SearchCompleted({required this.countrySearchList});

  final List<AutocompleteEntity> countrySearchList;

  @override
  List<Object> get props => [countrySearchList];
}

final class SearchFailure extends SearchCityState {
  SearchFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

@immutable
abstract class CitySearchEvent extends Equatable {}

final class StartCitySearchEvent extends CitySearchEvent {
  StartCitySearchEvent({required this.text, required this.locale});

  final String text;
  final String locale;

  @override
  List<Object> get props => [text];
}
