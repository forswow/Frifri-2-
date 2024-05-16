import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/date_picker/calendar_month_widget.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarModal extends StatefulWidget {
  const CalendarModal({super.key});

  @override
  State<CalendarModal> createState() {
    return _CalendarModalState();
  }
}

class _CalendarModalState extends State<CalendarModal> {
  final currentDate = DateTime.now();

  SelectedDate selectedDate = SelectedDate(
    DateTime.now(),
    isWholeMonth: false,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(children: [
        const _CalendarModalHeader(),
        _CalendarModalContent(),
      ]),
    );
  }
}

class _CalendarModalHeader extends StatelessWidget {
  const _CalendarModalHeader();

  static const weekdays = "SMTWTFS";
  static const firstDayInWeek = DateTime.monday;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DefaultModalHeader(
          centerText: "Когда",
        ),
        GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          shrinkWrap: true,
          crossAxisCount: 7,
          childAspectRatio: 1.5,
          children: List.generate(7, (index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                weekdays[(firstDayInWeek + index) % 7],
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _CalendarModalContent extends StatefulWidget {
  @override
  State<_CalendarModalContent> createState() {
    return _CalendarModalContentState();
  }
}

class _CalendarModalContentState extends State<_CalendarModalContent> {
  SelectedDate selectedDate = SelectedDate(
    DateTime.now(),
    isWholeMonth: true,
  );

  late final currentDate;
  late final lastMonth;
  late final countOfMonths;

  @override
  void initState() {
    super.initState();

    countOfMonths = 12;
    currentDate = DateTime.now();
    lastMonth = DateUtils.addMonthsToMonthDate(currentDate, countOfMonths);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: countOfMonths,
              itemBuilder: (context, index) {
                final currentMonth = DateUtils.addMonthsToMonthDate(
                  currentDate,
                  index,
                );

                return CalendarMonth(
                  year: currentMonth.year,
                  month: currentMonth.month,
                  selectedDate: selectedDate,
                  onDateSelected: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                  startWeekDay: DateTime.monday,
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(
                  height: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  // "ПТ, 15 Фев 2023",
                  selectedDate.isWholeMonth
                      ? DateFormat("MMM yyyy").format(selectedDate.date)
                      : DateFormat('EEE, dd MMM yyyy')
                          .format(selectedDate.date),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Дата вылета выбрана",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 0.32),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 48,
                  child: ConfirmationButton(
                    child: Text(
                      "Найти билеты",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
