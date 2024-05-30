import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';

class AppLanguageSettingsCubit extends Cubit<String> {
  final GlobalPrefHelper prefHelper;

  AppLanguageSettingsCubit({required this.prefHelper})
      : super(prefHelper.getLanguageCode());

  void selectNewLanguage(String newLanguage) {
    if (state == newLanguage) return;
    emit(newLanguage);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);

    prefHelper.setLanguageCode(change.nextState);
    log("languageCode state change: ${change.currentState} => ${change.nextState}");
  }
}
