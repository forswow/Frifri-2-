import 'package:flutter/material.dart';
import 'package:frifri/src/core/utils/fade_transitions.dart';
import 'package:frifri/src/feature/application/navigation/navigation_root_screen.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/screens/direct_flight_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_result_screen.dart';
import 'package:frifri/src/feature/hotels/presentation/screens/hotels_screen.dart';
import 'package:frifri/src/feature/more/presentation/screens/more_screen.dart';
import 'package:frifri/src/feature/service/presentation/screens/service_screen.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class NavigationManager {
  static const String aviaTickets = '/avia';

  static const String search = '/search';
  static const String searchResult = '/search/result';

  static const String services = '/services';

  static const String more = '/more';

  static const String hotels = '/hotels';
  static const String hotelsSearchCity = '/hotels/search_city';
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: aviaTickets,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootScreen(
            key: state.pageKey,
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorKey,
            routes: [
              GoRoute(
                name: aviaTickets,
                path: aviaTickets,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const DirectFlightScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: hotels,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    key: state.pageKey,
                    child: const HotelsScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: services,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    key: state.pageKey,
                    child: const ServicesScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: more,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    key: state.pageKey,
                    child: const MoreScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: search,
                  pageBuilder: (context, state) {
                    return FadeTransitionPage(
                      key: state.pageKey,
                      child: SearchTicketFormScreen(
                        searchModel: state.extra as SearchModel?,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'result',
                      pageBuilder: (context, state) {
                        return FadeTransitionPage(
                          key: state.pageKey,
                          child: SearchTicketsResultScreen(
                            searchModel: state.extra! as SearchModel,
                          ),
                        );
                      },
                    ),
                  ]),
            ],
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: searchResult,
          //       builder: (context, state) {
          //         return SearchTicketsResultScreen(
          //           searchModel: state.extra! as SearchModel,
          //         );
          //       },
          //     ),
          //   ],
          // ),
        ],
      )
    ],
  );
}
