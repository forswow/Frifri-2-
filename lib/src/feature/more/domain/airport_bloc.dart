import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';

class AirportCubit extends Cubit<String> {
  final GlobalPrefHelper prefHelper;

  AirportCubit({required this.prefHelper}) : super(prefHelper.getAirport()) {}

  void selectAirport(String newAirport) => emit(newAirport);

  @override
  void onChange(Change<String> newAirport) {
    super.onChange(newAirport);

    prefHelper.setAirport(newAirport.nextState);
    log("airport state change: ${newAirport.currentState} => ${newAirport.nextState}");
  }
}
