import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/core/theme/theme.dart';
import 'package:frifri/src/feature/application/navigation/navigation_manager.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/module/country_search/presentation/screens/country_search_screen.dart';

import '../../../../buy_ticket/presentation/modals/search_modal_fly_to/components/emptystring_list.dart';
import '../../../../buy_ticket/presentation/modals/search_modal_fly_to/searchfly_modal_to.dart';

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
      child: BlocBuilder<AppLanguageCubit, String>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(state),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // locale:
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: CountrySearchScreen(),
            // routerConfig: NavigationManager.router,
          );
        },
      ),
    );
  }
}
