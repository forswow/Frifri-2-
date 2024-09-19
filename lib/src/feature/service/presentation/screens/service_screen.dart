import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/feature/more/presentation/screens/more_screen.dart';
import 'package:frifri/src/feature/service/domain/constans/service_list.dart';

/// {@template reservation_screen}
/// ReservationScreen widget.
/// {@endtemplate}
class ServicesScreen extends StatelessWidget {
  /// {@macro reservation_screen}
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapTileListView(
      title: AppLocalizations.of(context).service,
      items: serviceList(context),
    );
  }
}
