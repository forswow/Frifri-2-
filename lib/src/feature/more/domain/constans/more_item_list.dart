import 'package:flutter/material.dart';
import 'package:frifri/src/feature/more/domain/entities/more_item_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<MoreItemEntity> moreItemList(BuildContext context) {
  return [
    MoreItemEntity(
        onPreseed: () {},
        name: AppLocalizations.of(context)!.settings,
        assetPath: 'assets/icons/Settings.svg'),
    MoreItemEntity(
        onPreseed: () {},
        name: AppLocalizations.of(context)!.departureAirport,
        assetPath: 'assets/icons/plane-fly.svg'),
    MoreItemEntity(
        onPreseed: () {},
        name: AppLocalizations.of(context)!.language,
        assetPath: 'assets/icons/Frame 624659.svg'),
    MoreItemEntity(
        onPreseed: () {},
        name: AppLocalizations.of(context)!.currency,
        assetPath: 'assets/icons/usd-circle.svg'),
    MoreItemEntity(
        onPreseed: () {},
        name: AppLocalizations.of(context)!.help,
        assetPath: 'assets/icons/help.svg'),
    MoreItemEntity(
        onPreseed: () {},
        name: AppLocalizations.of(context)!.confidentiality,
        assetPath: 'assets/icons/circle-info.svg'),
  ];
}
