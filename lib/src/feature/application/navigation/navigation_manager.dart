import 'package:flutter/material.dart';
import 'package:frifri/src/feature/application/navigation/navigation_root_screen.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/screens/direct_flight_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_result_screen.dart';
import 'package:frifri/src/feature/hotels/presentation/screens/hotels_screen.dart';
import 'package:frifri/src/feature/more/presentation/screens/more_screen.dart';
import 'package:frifri/src/feature/service/presentation/screens/service_screen.dart';
import 'package:go_router/go_router.dart';

class NavigationManager {
  static const String aviaTickets = '/avia';

  static const String search = '/search';
  static const String searchResult = '/search/result';

  static const String services = '/services';

  static const String more = '/more';

  static const String hotels = '/hotels';
  static const String hotelsSearchCity = '/hotels/search_city';

  static final GoRouter router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: aviaTickets,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => RootScreen(
            navigationShell: navigationShell,
          ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: aviaTickets,
                path: aviaTickets,
                builder: (context, state) => const DirectFlightScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: hotels,
                builder: (context, state) => const HotelsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: services,
                builder: (context, state) => const ServicesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: more,
                builder: (context, state) => const MoreScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: search,
                builder: (context, state) => SearchTicketFormScreen(
                    searchModel: state.extra as SearchModel?,
                  ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: searchResult,
                builder: (context, state) => SearchTicketsResultScreen(
                    searchModel: state.extra! as SearchModel,
                  ),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
