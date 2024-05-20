import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentSearchesBloc
    extends Bloc<RecentSearchesEvent, RecentSearchesState> {
  RecentSearchesBloc() : super(Idle()) {
    on<RecentSearchesEvent>((event, emit) {});
  }
}

sealed class RecentSearchesState extends Equatable {}

final class Idle extends RecentSearchesState {
  @override
  List<Object?> get props => [];
}

abstract class RecentSearchesEvent {}
