import 'package:flutter/material.dart';
import 'package:frifri/src/core/extensions/string_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarMonth extends StatefulWidget {
  const CalendarMonth({
    super.key,
    required this.year,
    required this.month,
    required this.selectedDate,
    required this.onDateSelected,
    this.startWeekDay = DateTime.monday,
    required this.availableFromDate,
  });

  final DateTime availableFromDate;

  final int year;
  final int month;
  final DateTime selectedDate;
  final Function(DateTime newDate) onDateSelected;

  final int startWeekDay;

  @override
  State<CalendarMonth> createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
  late final DateTime availableFromDate;

  @override
  void initState() {
    super.initState();
    availableFromDate = widget.availableFromDate;
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
        ),
      ],
    );
  }
}

class MonthTableView extends StatelessWidget {
  MonthTableView({
    super.key,
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
              price: index * 525,
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
    required this.isActive,
    required this.isSelected,
    required this.price,
    required this.isLowestPrice,
    required this.day,
  });

  final bool isActive;
  final bool isSelected;
  final int price;
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
          if (isActive && !isSelected)
            Text(
              price.toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isLowestPrice
                    ? Colors.green
                    : const Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ),
        ],
      ),
    );
  }
}

class MonthHeader extends StatelessWidget {
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
  Widget build(BuildContext context) {
    String monthName = _getMonthShortName(year, month);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${monthName.captialize()} $year",
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

  String _getMonthShortName(int year, int month) {
    return DateFormat("MMM", "ru").format(DateTime(year, month));
  }
}
