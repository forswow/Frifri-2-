import 'package:flutter/material.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/application/root_app/presentation/widgets/app.dart';
import 'package:frifri/src/feature/application/root_app/wrappers/additional_wrapper.dart';
import 'package:frifri/src/feature/application/root_app/wrappers/locale_wrapper.dart';

/// {@template root_app}
/// RootApp widget.
/// {@endtemplate}
class RootApp extends StatelessWidget {
  /// {@macro root_app}
  const RootApp({
    super.key,
    required this.dependencies,
    required this.locale,
    required this.airPort,
    required this.currency,
  });

  final Dependencies dependencies;
  final Locale locale;
  final String airPort;
  final String currency;
  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      d: dependencies,
      child: LocaleWrapper(
          locale: locale,
          sharedPreferences: dependencies.sharedPreferences,
          child: AdditionalWrapper(
              sharedPreferences: dependencies.sharedPreferences,
              airport: airPort,
              currency: airPort,
              child: App())),
    );
  }
}
