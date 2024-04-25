import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';

class CurrencyCubit extends Cubit<String> {
  final GlobalPrefHelper prefHelper;

  CurrencyCubit({required this.prefHelper}) : super(prefHelper.getCurrency());

  void selectCurrency(String newCurrency) {
    emit(newCurrency);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);

    prefHelper.setCurrency(change.nextState);
    log("Currency state change: ${change.currentState} => ${change.nextState}");
  }
}
