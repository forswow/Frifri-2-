import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum CurrencyEnum {
  rub,
  usd,
  eur,
  gel,
}

String currencyToString(CurrencyEnum airport, {required BuildContext context}) {
  switch (airport) {
    case CurrencyEnum.rub:
      return AppLocalizations.of(context).currencyRub;
    case CurrencyEnum.usd:
      return AppLocalizations.of(context).currencyUsd;
    case CurrencyEnum.eur:
      return AppLocalizations.of(context).currencyEur;
    case CurrencyEnum.gel:
      return AppLocalizations.of(context).currencyGel;
  }
}

CurrencyEnum getCurrencyFromString(String currencyName) {
  return CurrencyEnum.values.firstWhere(
    (e) => e.toString().split('.').last == currencyName.toLowerCase(),
  );
}
