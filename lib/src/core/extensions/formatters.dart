import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/feature/more/domain/entities/currency_entity.dart';
import 'package:intl/intl.dart';

String formatMinutesToHoursAndMinutes(
    int totalMinutes, AppLocalizations localizations) {
  final l = localizations;
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  return '${hours.toString().padLeft(
        2,
      )}${l.hoursSymbol} ${minutes.toString().padLeft(2, '0')}${l.minutesSymbol}';
}

String formatCurrencyWithSpaces(int number, CurrencyEnum currency) {
  NumberFormat numberFormat = NumberFormat('#,##0', 'en_US');
  final value = numberFormat.format(number).replaceAll(',', ' ');

  return '$value ${getCurrencySymbol(currency)}';
}

String dateFormatDay(DateTime date, String lang) {
  var format = DateFormat('d MMMM', lang);
  return format.format(date);
}
