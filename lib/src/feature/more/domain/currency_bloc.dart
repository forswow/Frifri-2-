import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';
import 'package:frifri/src/feature/more/domain/entities/currency_entity.dart';

class CurrencySettingsCubit extends Cubit<CurrencyEnum> {
  final GlobalPrefHelper prefHelper;

  CurrencySettingsCubit({required this.prefHelper})
      : super(prefHelper.getCurrency());

  void selectCurrency(CurrencyEnum newCurrency) {
    emit(newCurrency);
  }

  @override
  void onChange(Change<CurrencyEnum> change) {
    super.onChange(change);

    prefHelper.setCurrency(change.nextState);
    log("Currency state change: ${change.currentState} => ${change.nextState}");
  }
}
