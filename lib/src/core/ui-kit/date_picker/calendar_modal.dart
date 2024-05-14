import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui-kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui-kit/date_picker/calendar_month_widget.dart';
import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarModal extends BottomSheetStatefulModalBase {
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return _CalendarModalState();
  }
}

class _CalendarModalState extends BottomSheetStatefulModalBaseState {
  final currentDate = DateTime.now();

  SelectedDate selectedDate = SelectedDate(
    DateTime.now(),
    isWholeMonth: false,
  );

  @override
  Widget build_header(BuildContext context) {
    final weekdays = "SMTWTFS";
    final firstDayInWeek =
        MaterialLocalizations.of(context).firstDayOfWeekIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultModalHeader(
          centerText: "Когда",
        ),
        GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 17),
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
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build_content(BuildContext context) {
    final lastMonth = DateUtils.addMonthsToMonthDate(currentDate, 12);

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: DateUtils.monthDelta(currentDate, lastMonth),
              itemBuilder: (context, index) {
                final newDate = DateUtils.addMonthsToMonthDate(
                  currentDate,
                  index,
                );

                return CalendarMonth(
                  year: newDate.year,
                  month: newDate.month,
                  selectedDate: selectedDate,
                  onDateSelected: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(
                  height: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                ),
                SizedBox(
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
                    color: Color.fromRGBO(0, 0, 0, 0.32),
                  ),
                ),
                SizedBox(
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
