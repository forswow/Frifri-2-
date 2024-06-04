import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AirportEnum {
  kutaisi,
  tbilisi,
  batumi,
}

extension AirportEnumExtension on AirportEnum {
  String toIataCode() {
    switch (this) {
      case AirportEnum.kutaisi:
        return 'KUT';
      case AirportEnum.tbilisi:
        return 'TBS';
      case AirportEnum.batumi:
        return 'BUS';
    }
  }
}

String airportToString(AirportEnum airport, {required BuildContext context}) {
  switch (airport) {
    case AirportEnum.kutaisi:
      return AppLocalizations.of(context).cityKutaisi;
    case AirportEnum.tbilisi:
      return AppLocalizations.of(context).cityTbilisi;
    case AirportEnum.batumi:
      return AppLocalizations.of(context).cityBatumi;
  }
}

AirportEnum getAirportFromString(String airportName) {
  return AirportEnum.values.firstWhere(
    (e) => e.toString().split('.').last == airportName,
  );
}
