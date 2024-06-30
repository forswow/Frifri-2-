import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/feature/service/domain/entity/service_entity.dart';

List<ServiceEntity> serviceList(BuildContext context) {
  final localiztion = AppLocalizations.of(context);
  return [
    ServiceEntity(
      name: localiztion.insurance,
      assetPath: 'assets/icons/shield-check 1.svg',
      link: 'https://gettransfer.tp.st/oXhz6qdU',
    ),
    ServiceEntity(
      name: localiztion.rentACar,
      assetPath: 'assets/icons/car.svg',
      link: 'https://discovercars.tp.st/WMQtH7ej',
    ),
    ServiceEntity(
      name: localiztion.excursions,
      assetPath: 'assets/icons/eksursii.svg',
      link: 'https://tripster.tp.st/gLiksSZ8',
    ),
    ServiceEntity(
      name: localiztion.sanatoriums,
      assetPath: 'assets/icons/sanatory.svg',
      link: 'https://sanatoriums.tp.st/kCYyVzU4',
    ),
    ServiceEntity(
      name: localiztion.simCards,
      assetPath: 'assets/icons/sim.svg',
      link: 'https://airalo.tp.st/uPvT1Trb',
    ),
    ServiceEntity(
      name: localiztion.compensation,
      assetPath: 'assets/icons/compensacya.svg',
      link: 'https://compensair.tp.st/lNXaDt9W',
    ),
  ];
}
