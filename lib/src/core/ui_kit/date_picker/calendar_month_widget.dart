import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/extensions/string_extensions.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarMonth extends StatefulWidget {
  const CalendarMonth({
    super.key,
    required this.year,
    required this.month,
    required this.selectedDate,
    required this.onDateSelected,
    required this.availableFromDate,
    required this.calendarData,
    this.startWeekDay = DateTime.monday,
  });

  final DateTime availableFromDate;

  final int year;
  final int month;
  final DateTime selectedDate;
  final Function(DateTime newDate) onDateSelected;

  final int startWeekDay;

  final Map<DateTime, Text>? calendarData;

  @override
  State<CalendarMonth> createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
  late final DateTime availableFromDate;
  late final Map<DateTime, Text>? calendarData;

  @override
  void initState() {
    super.initState();
    availableFromDate = widget.availableFromDate;
    calendarData = widget.calendarData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(19),
          child: MonthHeader(
            year: widget.year,
            month: widget.month,
            onDateSelected: widget.onDateSelected,
          ),
        ),
        MonthTableView(
          year: widget.year,
          month: widget.month,
          selectedDate: widget.selectedDate,
          onDateSelected: widget.onDateSelected,
          startWeekDay: widget.startWeekDay,
          availableFromDate: availableFromDate,
          calendarData: calendarData,
        ),
      ],
    );
  }
}

class MonthTableView extends StatelessWidget {
  MonthTableView({
    super.key,
    required this.calendarData,
    required this.year,
    required this.month,
    required this.selectedDate,
    required this.onDateSelected,
    required this.startWeekDay,
    required this.availableFromDate,
  });

  final DateTime availableFromDate;

  final DateTime currentDate = DateTime.now();

  final int year;
  final int month;

  final DateTime selectedDate;
  final Function(DateTime newDate) onDateSelected;

  final int startWeekDay;
  final Map<DateTime, Text>? calendarData;

  static int firstDayOffset(int year, int month,
      {int firstDayOfWeek = DateTime.monday}) {
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    final firstDayOfWeekIndex = (firstDayOfWeek - 1) % 7;
    return (weekdayFromMonday - firstDayOfWeekIndex) % 7;
  }

  @override
  Widget build(BuildContext context) {
    final countOfDays = DateUtils.getDaysInMonth(year, month);

    final startsWithDay = firstDayOffset(
      year,
      month,
      firstDayOfWeek: startWeekDay,
    );

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 7,
      childAspectRatio: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 0,
      padding: const EdgeInsets.all(17),
      children: List.generate(
        countOfDays + startsWithDay,
        (index) {
          if (index < startsWithDay) {
            return const UnconstrainedBox();
          }

          int day = index - startsWithDay + 1;

          final isSelectedDay = selectedDate.year == year &&
              selectedDate.day == day &&
              selectedDate.month == month;

          final isActive =
              currentDate.difference(DateTime(year, month, day)).inDays <= 0 &&
                  availableFromDate
                          .difference(DateTime(year, month, day))
                          .inDays <=
                      0;

          return InkWell(
            onTap: () => isActive
                ? onDateSelected(
                    DateTime(year, month, day),
                  )
                : null,
            child: MonthDay(
              isActive: isActive,
              text: calendarData?[DateTime(year, month, day)],
              isLowestPrice: index % 2 == 0,
              day: day,
              isSelected: isSelectedDay,
            ),
          );
        },
      ),
    );
  }
}

class MonthDay extends StatelessWidget {
  const MonthDay({
    super.key,
    required this.text,
    required this.isActive,
    required this.isSelected,
    required this.isLowestPrice,
    required this.day,
  });

  final bool isActive;
  final bool isSelected;
  final Text? text;
  final bool isLowestPrice;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromRGBO(235, 243, 243, 1)
            : const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.toString(),
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive
                  ? const Color.fromRGBO(0, 0, 0, 1)
                  : const Color.fromRGBO(0, 0, 0, 0.3),
            ),
          ),
          !isSelected && text != null && isActive ? text! : const SizedBox(),
        ],
      ),
    );
  }
}

class MonthHeader extends StatefulWidget {
  const MonthHeader({
    super.key,
    required this.year,
    required this.month,
    required this.onDateSelected,
  });

  final int year;
  final int month;

  final Function(DateTime) onDateSelected;

  @override
  State<MonthHeader> createState() => _MonthHeaderState();
}

class _MonthHeaderState extends State<MonthHeader> {
  late final String monthName;

  @override
  void initState() {
    super.initState();
    final String locale = context.read<AppLanguageSettingsCubit>().state;
    monthName = _getMonthShortName(widget.year, widget.month, locale: locale);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${monthName.captialize()} ${widget.year}",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
            indent: 48,
          ),
        ),
      ],
    );
  }

  String _getMonthShortName(int year, int month, {String locale = "ru"}) {
    return DateFormat("MMM", locale).format(DateTime(year, month));
  }
}
