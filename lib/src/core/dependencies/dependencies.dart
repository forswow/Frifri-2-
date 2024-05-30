import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frifri/src/core/data_base/search_database.dart';
import 'package:frifri/src/core/helpers/global_pref_helper.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/booking.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/prices.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/user_location.dart';
import 'package:frifri/src/feature/buy_ticket/data/repository/autocomplete_repository.dart';
import 'package:frifri/src/feature/buy_ticket/data/repository/calendar_prices_repository.dart';
import 'package:frifri/src/feature/buy_ticket/data/repository/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/autocomplete_repository.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/calendar_prices_repository.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/recent_search_repo.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/search_tickets_repo.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/more/domain/settings_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/data/repository/recent_search_repo_impl.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_cities/search_city_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_cities/recent_city_searches_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Damn, на нужен новый подход для инициализации зависимостей
// TODO: Damn, на нужен новый подход для инициализации зависимостей
// TODO: Damn, на нужен новый подход для инициализации зависимостей
/// {@template dependencies}
/// Dependencies.
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}

  static Dependencies of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependenciesScope>()!.d;

  late final Dio mainDioClient;

  late final AppDatabase appDatabase;

  // Shared preferences и всё с ним связанное
  late SharedPreferences sharedPreferences;
  late GlobalPrefHelper globalPrefHelper;

  // Кубиты для настроек приложения
  // TODO: Объединить состояние настроек в один блок?
  late PushNotificationSettingsCubit pushNotificationCubit;
  late AirportSettingsCubit airportCubit;
  late AppLanguageSettingsCubit languageCubit;
  late CurrencySettingsCubit currencyCubit;

  // Репозитории автокомплита и блок поиска
  late final IAutocompleteDataSource autocompleteDataSource;
  late final IAutocompleteRepository autocompleteRepository;
  late final SearchCityBloc searchCityBloc;

  // Для сохранения результатов поиска (использует AppDatabase)
  late final IRecentSearchRepo recentSearchRepository;
  late final RecentSearchesCubit recentSearchesCubit;

  // Для поиска авиабилетов
  late final IBookingDataSource bookingDataSources;
  late final ITicketsDataSource ticketsDataSource;
  late final ISearchTicketsRepo searchTicketRepository;
  late final SearchTicketsBloc searchBloc;

  // Всё, связанное с ценами
  late final IPricesDataSource pricesDataSource;
  late final ICalendarPricesRepository calendarPricesRepository;

  late final IUserLocationDataSource userLocationDataSource;

  Future<void> initializationDependencies() async {
    await dotenv.load(fileName: '.env');
    final String baseUrl = dotenv.get('API_BASE_URL');
    final String apiKey = dotenv.get('API_KEY');

    logger.i("Initializing dependencies...");

    // Поднимаем базу данных
    appDatabase = AppDatabase();

    // Shared preferences и всё с ним связанное
    sharedPreferences = await SharedPreferences.getInstance();
    globalPrefHelper = GlobalPrefHelper(
      sharedPreferences: sharedPreferences,
    );

    // Настройки приложения (работают через shared_preferences)
    pushNotificationCubit =
        PushNotificationSettingsCubit(prefHelper: globalPrefHelper);
    airportCubit = AirportSettingsCubit(prefHelper: globalPrefHelper);
    languageCubit = AppLanguageSettingsCubit(prefHelper: globalPrefHelper);
    currencyCubit = CurrencySettingsCubit(prefHelper: globalPrefHelper);

    mainDioClient = getBasicDioClient(baseUrl, apiKey);

    autocompleteDataSource = AutocompleteDataSourceImpl(
      dioClient: mainDioClient,
    );
    autocompleteRepository = AutocompleteRepositoryImpl(
      dataSource: autocompleteDataSource,
    );
    searchCityBloc = SearchCityBloc(
      autocompleteRepository,
    );

    recentSearchRepository = RecentSearchRepo(
      db: appDatabase,
    );
    recentSearchesCubit = RecentSearchesCubit(
      recentSearchRepository: recentSearchRepository,
    );

    ticketsDataSource = TicketsDataSourceImpl(
      dioClient: mainDioClient,
    );
    bookingDataSources = BookingDataSourceImpl(
      dioClient: mainDioClient,
    );

    searchTicketRepository = SearchTicketRepoImpl(
      bookingDataSources: bookingDataSources,
      searchDataSources: ticketsDataSource,
    );

    searchBloc = SearchTicketsBloc(
      searchTicketsRepository: searchTicketRepository,
    );

    pricesDataSource = PricesDataSourceImpl(
      dioClient: mainDioClient,
    );
    calendarPricesRepository = CalendarPricesRepositoryImpl(
      pricesDataSource: pricesDataSource,
    );

    userLocationDataSource = UserLocationDataSourceImpl(
      dioClient: mainDioClient,
    );

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
