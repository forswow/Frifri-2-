import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';
import 'package:frifri/src/feature/more/domain/entities/airport_entity.dart';

class AirportCubit extends Cubit<AirportEnum> {
  final GlobalPrefHelper prefHelper;

  AirportCubit({required this.prefHelper}) : super(prefHelper.getAirport());

  Future<void> selectAirport(AirportEnum newAirport) async {
    emit(newAirport);
  }

  @override
  void onChange(Change<AirportEnum> change) {
    super.onChange(change);

    prefHelper.setAirport(change.nextState);
    log("airport state change: ${change.currentState} => ${change.nextState}");
  }
}
