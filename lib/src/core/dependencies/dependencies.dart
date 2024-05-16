import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/search/search_data_sources.dart';
import 'package:frifri/src/feature/buy_ticket/data/repositories/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_ticket_bloc.dart';
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

  static Dependencies of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependenciesScope>()!.d;

  late SharedPreferences sharedPreferences;
  late PushNotificationCubit pushNotificationCubit;
  late AirportCubit airportCubit;
  late AppLanguageCubit languageCubit;
  late CurrencyCubit currencyCubit;
  late GlobalPrefHelper globalPrefHelper;

  late final SearchDataSources searchDataSources;
  late final SearchTicketRepoImpl searchTicketRepoImpl;
  late final SearchBloc searchBloc;

  Future<void> initializationDependencies() async {
    await dotenv.load(fileName: '.env');
    logger.i("Initializing dependencies...");

    sharedPreferences = await SharedPreferences.getInstance();
    globalPrefHelper = GlobalPrefHelper(sharedPreferences: sharedPreferences);
    pushNotificationCubit = PushNotificationCubit(prefHelper: globalPrefHelper);
    airportCubit = AirportCubit(prefHelper: globalPrefHelper);
    languageCubit = AppLanguageCubit(prefHelper: globalPrefHelper);
    currencyCubit = CurrencyCubit(prefHelper: globalPrefHelper);

    searchDataSources = SearchDataSources();
    searchTicketRepoImpl =
        SearchTicketRepoImpl(searchDataSources: searchDataSources);
    searchBloc = SearchBloc(searchTicketRepoImpl);

    logger.i("Dependencies initialized.");
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
