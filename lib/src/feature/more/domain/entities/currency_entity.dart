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
      return AppLocalizations.of(context)!.cityKutaisi;
    case CurrencyEnum.usd:
      return AppLocalizations.of(context)!.cityTbilisi;
    case CurrencyEnum.eur:
      return AppLocalizations.of(context)!.cityBatumi;
    case CurrencyEnum.gel:
      return AppLocalizations.of(context)!.cityBatumi;
  }
}

CurrencyEnum getCurrencyFromString(String currencyName) {
  return CurrencyEnum.values.firstWhere(
    (e) => e.toString().split('.').last == currencyName.toLowerCase(),
  );
}
