import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AirportEnum {
  kutaisi('KUT'),
  tbilisi('TBS'),
  batumi('BUS');

  final String iata;
  const AirportEnum(this.iata);
  // String get toIataCode => switch (this) {
  //       AirportEnum.kutaisi => 'KUT',
  //       AirportEnum.tbilisi => 'TBS',
  //       AirportEnum.batumi => 'BUS'
  //     };

  String airportToString({required BuildContext context}) {
    final local = AppLocalizations.of(context);
    return switch (this) {
      AirportEnum.kutaisi => local.cityKutaisi,
      AirportEnum.tbilisi => local.cityTbilisi,
      AirportEnum.batumi => local.cityBatumi
    };
  }
}

extension AirportEntity on AirportEnum {
  static AirportEnum getAirportFromString(String airportName) =>
      AirportEnum.values.firstWhere(
        (e) => e.toString().split('.').last == airportName,
      );
}
