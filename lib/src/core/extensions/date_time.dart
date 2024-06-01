import 'package:jiffy/jiffy.dart';

extension DateTimeExtension on DateTime {
  String get getLastMonthDay {
    final time = Jiffy.parseFromDateTime(
      this,
    ).endOf(Unit.month).format(pattern: 'yyyy-MM-dd');

    return time;
  }

  String get getNowParseDate {
    final dateTime =
        Jiffy.parseFromDateTime(this).format(pattern: 'yyyy-MM-dd');

    return dateTime;
  }
}
