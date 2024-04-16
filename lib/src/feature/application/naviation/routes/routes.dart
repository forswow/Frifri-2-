import 'package:frifri/src/feature/application/naviation/presentation/widgets/navigation_widget.dart';
import 'package:frifri/src/feature/more/presentation/screens/choose_location_widget.dart';
import 'package:frifri/src/feature/more/presentation/screens/more_screen.dart';
import 'package:frifri/src/feature/more/presentation/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) {
          return NavigationWidgetScreen();
        })
  ],
);
