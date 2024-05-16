import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/application/root_app/presentation/widgets/app.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/more/domain/settings_bloc.dart';

/// {@template root_app}
/// RootApp widget.
/// {@endtemplate}
class RootApp extends StatelessWidget {
  /// {@macro root_app}
  const RootApp({
    super.key,
    required this.dependencies,
  });

  final Dependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      d: dependencies,
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<PushNotificationCubit>.value(
                value: dependencies.pushNotificationCubit,
              ),
              BlocProvider<AirportCubit>.value(
                value: dependencies.airportCubit,
              ),
              BlocProvider<AppLanguageCubit>.value(
                value: dependencies.languageCubit,
              ),
              BlocProvider<CurrencyCubit>.value(
                value: dependencies.currencyCubit,
              ),
              BlocProvider<SearchBloc>.value(
                value: dependencies.searchBloc,
              ),
            ],
            child: const App(),
          );
        },
      ),
    );
  }
}
