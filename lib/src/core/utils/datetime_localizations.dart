import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String getLocalizedWeekDays(String locale) {
  // Инициализируем локализацию
  initializeDateFormatting(locale);

  // Устанавливаем локализацию
  Intl.defaultLocale = locale;

  // Получаем сокращенные названия дней недели
  final dateFormat = DateFormat.E(locale);
  final daysOfWeek = <String>[];

  // Начнем с воскресенья (0) до субботы (6)
  for (var i = 0; i < 7; i++) {
    // Используем дату 1970-01-04 (воскресенье) как базовую
    final date = DateTime(1970, 1, 4 + i);
    daysOfWeek.add(dateFormat.format(date)[0].toUpperCase());
  }

  // Возвращаем строку "SMTWTFS"
  return daysOfWeek.join();
}
