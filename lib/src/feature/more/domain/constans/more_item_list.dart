import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/decorations/decorations.dart';
import 'package:frifri/src/feature/more/domain/entities/more_item_entity.dart';
import 'package:frifri/src/feature/more/presentation/modals/confidentiality_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/help_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_airport_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_currency_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_language_modal.dart';
import 'package:frifri/src/feature/more/presentation/modals/settings_modal.dart';

List<MoreItemEntity> moreItemList(BuildContext context) {
  final local = AppLocalizations.of(context);
  return [
    MoreItemEntity(
        onPressed: () => showModalBottomSheet(
              context: context,
              shape: AppDecorations.modalRoundedShape,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => const SettingsModal(),
            ),
        name: local.notification,
        assetPath: 'assets/icons/Settings.svg'),
    MoreItemEntity(
        onPressed: () => showModalBottomSheet(
              context: context,
              shape: AppDecorations.modalRoundedShape,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => const SelectAirportModal(),
            ),
        name: local.departureAirport,
        assetPath: 'assets/icons/plane-fly.svg'),
    MoreItemEntity(
        onPressed: () => showModalBottomSheet(
              context: context,
              shape: AppDecorations.modalRoundedShape,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => const SelectLanguageModal(),
            ),
        name: local.language,
        assetPath: 'assets/icons/Frame 624659.svg'),
    MoreItemEntity(
        onPressed: () => showModalBottomSheet(
              context: context,
              shape: AppDecorations.modalRoundedShape,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => const SelectCurrencyModal(),
            ),
        name: local.currency,
        assetPath: 'assets/icons/usd-circle.svg'),
    MoreItemEntity(
        onPressed: () => showModalBottomSheet(
              context: context,
              shape: AppDecorations.modalRoundedShape,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => const HelpModal(),
            ),
        name: local.help,
        assetPath: 'assets/icons/help.svg'),
    MoreItemEntity(
        onPressed: () => showModalBottomSheet(
              context: context,
              shape: AppDecorations.modalRoundedShape,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => const ConfidentialityModal(),
            ),
        name: local.companyPolicy,
        assetPath: 'assets/icons/circle-info.svg'),
  ];
}
