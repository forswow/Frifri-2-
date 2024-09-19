import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/helpers/url_launcher_helper.dart';
import 'package:frifri/src/feature/service/domain/entity/service_entity.dart';

List<ServiceEntity> serviceList(BuildContext context) {
  final localiztion = AppLocalizations.of(context);
  return [
    ServiceEntity(
      name: localiztion.insurance,
      assetPath: 'assets/icons/shield-check 1.svg',
      onPressed: () =>
          UrlLauncherHelper.launchInWeb('https://gettransfer.tp.st/oXhz6qdU'),
    ),
    ServiceEntity(
      name: localiztion.rentACar,
      assetPath: 'assets/icons/car.svg',
      onPressed: () =>
          UrlLauncherHelper.launchInWeb('https://discovercars.tp.st/WMQtH7ej'),
    ),
    ServiceEntity(
      name: localiztion.excursions,
      assetPath: 'assets/icons/eksursii.svg',
      onPressed: () =>
          UrlLauncherHelper.launchInWeb('https://tripster.tp.st/gLiksSZ8'),
    ),
    ServiceEntity(
      name: localiztion.sanatoriums,
      assetPath: 'assets/icons/sanatory.svg',
      onPressed: () =>
          UrlLauncherHelper.launchInWeb('https://sanatoriums.tp.st/kCYyVzU4'),
    ),
    ServiceEntity(
      name: localiztion.simCards,
      assetPath: 'assets/icons/sim.svg',
      onPressed: () =>
          UrlLauncherHelper.launchInWeb('https://airalo.tp.st/uPvT1Trb'),
    ),
    ServiceEntity(
      name: localiztion.compensation,
      assetPath: 'assets/icons/compensacya.svg',
      onPressed: () =>
          UrlLauncherHelper.launchInWeb('https://compensair.tp.st/lNXaDt9W'),
    ),
  ];
}
