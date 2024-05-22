import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/module/country_search/domain/dto/input_dto.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../domain/entity/country_search_entity.dart';
import '../../domain/repos/country_search_repo.dart';

EventTransformer<E> throttleDroppable<E>() {
  return (events, mapper) {
    return throttleDroppable<E>().call(
      events.throttle(
        const Duration(
          milliseconds: 200,
        ),
      ),
      mapper,
    );
  };
}

class SearchCityBloc extends Bloc<CitySearchEvent, SearchCityState> {
  final ICountrySearchRepo _countrySearchRepo;

  SearchCityBloc(this._countrySearchRepo) : super(Idle()) {
    on<StartCitySearchEvent>(_searchCountry);
  }

  FutureOr<void> _searchCountry(
      StartCitySearchEvent event, Emitter<SearchCityState> emit) async {
    try {
      emit(SearchInProgress());

      final countrySearchList = await _countrySearchRepo.fetchCountrySearch(
        InputDto(
          term: event.text,
          locale: "ru",
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

  final List<CountrySearchEntity> countrySearchList;

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
  StartCitySearchEvent({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}
