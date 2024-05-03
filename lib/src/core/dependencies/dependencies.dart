import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/more/domain/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies.
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}

  Dependencies of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependenciesScope>()!.d;

  late SharedPreferences sharedPreferences;
  late PushNotificationCubit pushNotificationCubit;
  late AirportCubit airportCubit;
  late AppLanguageCubit languageCubit;
  late CurrencyCubit currencyCubit;

  late GlobalPrefHelper globalPrefHelper;

  Future<void> initializationDependencies() async {
    log("Start dependencies initialization");

    await dotenv.load(fileName: '.env');
    log("dotenv config loaded");

    sharedPreferences = await SharedPreferences.getInstance();
    globalPrefHelper = GlobalPrefHelper(sharedPreferences: sharedPreferences);
    log("globalPrefHelper initialized");

    pushNotificationCubit = PushNotificationCubit(prefHelper: globalPrefHelper);
    log("pushEnabled: ${pushNotificationCubit.state}");

    airportCubit = AirportCubit(prefHelper: globalPrefHelper);
    log("airport: ${airportCubit.state}");

    languageCubit = AppLanguageCubit(prefHelper: globalPrefHelper);
    log("language: ${languageCubit.state}");

    currencyCubit = CurrencyCubit(prefHelper: globalPrefHelper);
    log("currency: ${currencyCubit.state}");

    log("Dependencies initialized");
  }
}

/// {@template dependencies}
/// DependenciesScope widget.
/// {@endtemplate}
class DependenciesScope extends InheritedWidget {
  /// {@macro dependencies}
  const DependenciesScope({
    required this.d,
    required super.child,
    super.key,
  });

  final Dependencies d;

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
