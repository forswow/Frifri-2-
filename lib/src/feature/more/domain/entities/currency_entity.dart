import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum CurrencyEnum {
  rub,
  usd,
  eur,
  gel,
}

String currencyToString(CurrencyEnum currency,
    {required BuildContext context}) {
  final local = AppLocalizations.of(context);
  return switch (currency) {
    CurrencyEnum.rub => local.currencyRub,
    CurrencyEnum.usd => local.currencyUsd,
    CurrencyEnum.eur => local.currencyEur,
    CurrencyEnum.gel => local.currencyGel
  };
}

CurrencyEnum currencyFromString(String currencyName) =>
    CurrencyEnum.values.firstWhere(
      (e) => e.toString().split('.').last == currencyName.toLowerCase(),
    );

String getCurrencySymbol(CurrencyEnum currency) => switch (currency) {
      CurrencyEnum.rub => '₽',
      CurrencyEnum.usd => r'$',
      CurrencyEnum.eur => '€',
      CurrencyEnum.gel => '₾'
    };
