import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';

class PushNotificationCubit extends Cubit<bool> {
  final GlobalPrefHelper prefHelper;

  PushNotificationCubit({required this.prefHelper})
      : super(prefHelper.getPushEnabled());

  void setPushEnabled(bool newValue) => emit(newValue);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);

    prefHelper.setPushEnabled(change.nextState);
    log("pushEnabled state change: ${change.currentState} => ${change.nextState}");
  }
}
