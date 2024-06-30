import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TripClass {
  economy,
  comfort,
  first,
  business,
}

String tripClassToString(TripClass tripClass, {required BuildContext context}) {
  return switch (tripClass) {
    TripClass.economy => AppLocalizations.of(context).economy,
    TripClass.comfort => AppLocalizations.of(context).comfort,
    TripClass.first => AppLocalizations.of(context).firstClass,
    TripClass.business => AppLocalizations.of(context).business,
  };
}

String tripClassToDataString(TripClass tripClass) {
  return switch (tripClass) {
    TripClass.economy => 'Y',
    TripClass.comfort => 'Y',
    TripClass.first => 'C',
    TripClass.business => 'C'
  };
}
