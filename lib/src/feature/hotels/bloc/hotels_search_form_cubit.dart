import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frifri/src/core/utils/logger.dart';

part 'hotels_search_form_cubit.freezed.dart';

@freezed
abstract class HotelsSearchFormState with _$HotelsSearchFormState {
  const factory HotelsSearchFormState({
    required int countOfAdults,
    String? from,
    DateTime? fromDate,
    DateTime? toDate,
  }) = _SearchFormState;

  factory HotelsSearchFormState.initial() => const HotelsSearchFormState(
        countOfAdults: 1,
      );
}

class HotelsSearchFormCubit extends Cubit<HotelsSearchFormState> {
  HotelsSearchFormCubit() : super(HotelsSearchFormState.initial());

  void setCountOfAdults(int count) {
    if (count < 1) {
      return;
    }

    logger.i('Hotels search form changed: count of adults: $count');

    emit(state.copyWith(countOfAdults: count));
  }

  void setFromDate(DateTime fromDate) {
    final currentDate = DateTime.now();

    // If we want to book hotel in the past
    if (fromDate.isBefore(currentDate)) {
      return;
    }

    // If we want to book toDate before fromDate
    if (state.fromDate != null && fromDate.isAfter(state.fromDate!)) {
      return;
    }

    emit(state.copyWith(fromDate: fromDate));
  }

  void setToDate(DateTime toDate) {
    final currentDate = DateTime.now();

    // If we want to book hotel in the past
    if (toDate.isBefore(currentDate)) {
      return;
    }

    // If we want to book fromDate after toDate
    if (state.fromDate != null && toDate.isBefore(state.fromDate!)) {
      return;
    }

    emit(state.copyWith(toDate: toDate));
  }

  void setFrom(String from) {
    emit(state.copyWith(from: from));
  }
}
