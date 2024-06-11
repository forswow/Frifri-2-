import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/core/theme/theme.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../navigation/navigation_manager.dart';

/// {@template app}
/// App widget.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: kPrimaryBackgroundColor,
      ),
      child: BlocBuilder<AppLanguageSettingsCubit, String>(
        builder: (context, state) {
          return MaterialApp.router(
            locale: Locale(state),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // locale:
            debugShowCheckedModeBanner: false,
            theme: theme,
            // routerConfig: NavigationManager.router,
            routerConfig: NavigationManager.router,
            // home: const TicketScreen(),
          );
        },
      ),
    );
  }
}
