import 'package:flutter/material.dart';
import 'package:frifri/src/feature/more/domain/entities/more_item_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/feature/more/presentation/modals/confidentiality_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/help_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/more_settings_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_airport_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_currency_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_language_modal.dart';

List<MoreItemEntity> moreItemList(BuildContext context) {
  return [
    MoreItemEntity(
        onPreseed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SettingsModal(),
          );
        },
        name: AppLocalizations.of(context)!.settings,
        assetPath: 'assets/icons/Settings.svg'),
    MoreItemEntity(
        onPreseed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SelectAirportModal(),
          );
        },
        name: AppLocalizations.of(context)!.departureAirport,
        assetPath: 'assets/icons/plane-fly.svg'),
    MoreItemEntity(
        onPreseed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SelectLanguageModal(),
          );
        },
        name: AppLocalizations.of(context)!.language,
        assetPath: 'assets/icons/Frame 624659.svg'),
    MoreItemEntity(
        onPreseed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SelectCurrencyModal(),
          );
        },
        name: AppLocalizations.of(context)!.currency,
        assetPath: 'assets/icons/usd-circle.svg'),
    MoreItemEntity(
        onPreseed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => HelpModal(),
          );
        },
        name: AppLocalizations.of(context)!.help,
        assetPath: 'assets/icons/help.svg'),
    MoreItemEntity(
        onPreseed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => ConfidentialityModal(),
          );
        },
        name: AppLocalizations.of(context)!.confidentiality,
        assetPath: 'assets/icons/circle-info.svg'),
  ];
}
