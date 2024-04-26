import 'package:flutter/material.dart';
import 'package:frifri/src/feature/application/naviation/navigation_root_screen.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/screens/avia_ticket_screen.dart';
import 'package:frifri/src/feature/more/presentation/screens/more_screen.dart';
import 'package:frifri/src/feature/reservation/presentation/screens/reservation_screen.dart';
import 'package:go_router/go_router.dart';

class NavigationManager {
  static const String aviaTickets = '/avia';
  static const String hotels = '/hotels';
  static const String services = '/services';
  static const String more = '/more';

  static final GoRouter router = GoRouter(
    // TODO: initialLocation можно задавать в настройках
    // для удобства пользователя

    initialLocation: aviaTickets,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: aviaTickets,
                path: aviaTickets,
                builder: (context, state) => AviaTicketScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: hotels,
                builder: (context, state) {
                  return Placeholder();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: services,
                builder: (context, state) {
                  return ServicesScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: more,
                builder: (context, state) {
                  return MoreScreen();
                },
              ),
            ],
          ),
        ],
      )
    ],
  );
}
