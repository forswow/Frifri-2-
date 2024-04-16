import 'package:flutter/material.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';
import 'package:frifri/src/feature/application/root_app/presentation/widgets/root_app.dart';

/// {@template runner}
/// Runner.
/// {@endtemplate}
abstract final class Runner {
  /// {@macro runner}

  static Future<void> startApplication() async {

    WidgetsFlutterBinding.ensureInitialized();
    final dependencies = Dependencies();

    await dependencies.initializationDependencies();

    final globalHelper =
        GlobalPrefHelper(sharedPreferences: dependencies.sharedPreferences);

    runApp(RootApp(
      dependencies: dependencies,
      locale: Locale(globalHelper.language()),
      airPort: globalHelper.airPort(),
      currency: globalHelper.currency(),
    ));
  }
}
