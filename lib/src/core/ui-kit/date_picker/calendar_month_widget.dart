import 'package:flutter/material.dart';
import 'package:frifri/src/core/extensions/string_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class SelectedDate {
  final DateTime date;
  final bool isWholeMonth;

  SelectedDate(this.date, {required this.isWholeMonth});
}

class CalendarMonth extends StatefulWidget {
  const CalendarMonth({
    super.key,
    required this.year,
    required this.month,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final int year;
  final int month;
  final SelectedDate selectedDate;
  final Function(SelectedDate newDate) onDateSelected;

  @override
  State<CalendarMonth> createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
  @override
  Widget build(BuildContext context) {
    final monthName = _getMonthShortName(widget.year, widget.month);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(19),
          child: MonthHeader(
            monthName: monthName,
            widget: widget,
          ),
        ),
        MonthTableView(
          year: widget.year,
          month: widget.month,
          selectedDate: widget.selectedDate,
          onDateSelected: widget.onDateSelected,
        ),
      ],
    );
  }

  String _getMonthShortName(int year, int month) {
    return DateFormat("MMM", "ru").format(DateTime(year, month));
  }
}

class MonthTableView extends StatelessWidget {
  MonthTableView({
    super.key,
    required this.year,
    required this.month,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final DateTime currentDate = DateTime.now();

  final int year;
  final int month;

  final SelectedDate selectedDate;
  final Function(SelectedDate newDate) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final countOfDays = DateUtils.getDaysInMonth(year, month);

    final startsWithDay = DateUtils.firstDayOffset(
      year,
      month,
      MaterialLocalizations.of(context),
    );

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 7,
      childAspectRatio: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 0,
      padding: EdgeInsets.all(17),
      children: List.generate(countOfDays + startsWithDay, (index) {
        if (index < startsWithDay) {
          return UnconstrainedBox();
        }

        int day = index - startsWithDay + 1;

        final isSelectedDay = selectedDate.date.year == year &&
            selectedDate.date.day == day &&
            selectedDate.date.month == month &&
            !selectedDate.isWholeMonth;

        final isActive =
            currentDate.difference(DateTime(year, month, day)).inDays <= 0;

        return InkWell(
          onTap: () => isActive
              ? onDateSelected(
                  SelectedDate(
                    DateTime(year, month, day),
                    isWholeMonth: false,
                  ),
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
      }),
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
            ? Color.fromRGBO(235, 243, 243, 1)
            : Color.fromRGBO(255, 255, 255, 1),
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
                  ? Color.fromRGBO(0, 0, 0, 1)
                  : Color.fromRGBO(0, 0, 0, 0.3),
            ),
          ),
          if (isActive && !isSelected)
            Text(
              price.toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color:
                    isLowestPrice ? Colors.green : Color.fromRGBO(0, 0, 0, 0.3),
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
    required this.monthName,
    required this.widget,
  });

  final String monthName;
  final CalendarMonth widget;

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
        InkWell(
          onTap: () {
            widget.onDateSelected(
              SelectedDate(
                DateTime(widget.year, widget.month),
                isWholeMonth: true,
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(2),
            child: Text(
              "Выбрать весь месяц",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
