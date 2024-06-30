import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/feature/more/domain/entities/currency_entity.dart';
import 'package:intl/intl.dart';

String formatMinutesToHoursAndMinutes(
    int totalMinutes, AppLocalizations localizations) {
  final l = localizations;
  final int hours = totalMinutes ~/ 60;
  final int minutes = totalMinutes % 60;
  return '${hours.toString().padLeft(
        2,
      )}${l.hoursSymbol} ${minutes.toString().padLeft(2, '0')}${l.minutesSymbol}';
}

String formatCurrencyWithSpaces(
    int number, CurrencyEnum currency, String locale) {
  final priceFormatter = NumberFormat.simpleCurrency(
    decimalDigits: 0,
    name: currency.name.toUpperCase(),
    locale: locale.toUpperCase(),
  );
  final value = priceFormatter.format(number).replaceAll(',', ' ');

  return value;
}

String dateFormatDay(DateTime date, String lang) {
  final format = DateFormat('d MMMM', lang);
  return format.format(date);
}
