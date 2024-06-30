import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/date_picker/calendar_month_widget.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/core/utils/datetime_localizations.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarModal extends StatefulWidget {
  const CalendarModal({
    required this.title, required this.initialDate, required this.availableFromDate, required this.isOneWay, required this.originIataCode, required this.destinationIataCode, required this.countOfMonths, super.key,
  });

  final String title;
  final DateTime availableFromDate;

  final bool isOneWay;
  final String? originIataCode;
  final String? destinationIataCode;

  final int countOfMonths;
  final DateTime initialDate;

  @override
  State<CalendarModal> createState() {
    return _CalendarModalState();
  }
}

class _CalendarModalState extends State<CalendarModal> {
  final currentDate = DateTime.now();

  late final bool shouldFetchPrices;
  late final DateTime availableFromDate;
  late final String title;

  late final String? originIataCode;
  late final String? destinationIataCode;

  late DateTime initialDate;

  late final int countOfMonths;

  late Map<DateTime, Text>? calendarData;

  @override
  void initState() {
    super.initState();
    availableFromDate = widget.availableFromDate;
    title = widget.title;

    originIataCode = widget.originIataCode;
    destinationIataCode = widget.destinationIataCode;
    shouldFetchPrices = originIataCode != null && destinationIataCode != null;

    countOfMonths = widget.countOfMonths;
    calendarData = null;

    initialDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          _CalendarModalHeader(title: title),
          FutureBuilder(
            future: shouldFetchPrices && calendarData == null
                ? fetchPricesData(context: context)
                : null,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Expanded(
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'При поиске произошла ошибка, пожалуйста выберите другую локацию и попробуйте ещё раз',
                      style: AppStyles.textStylePoppins.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }

              if (shouldFetchPrices && !snapshot.hasData) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Загружаем цены для выбранного направления',
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              }

              calendarData = snapshot.data;

              return _CalendarModalContent(
                availableFromDate: availableFromDate,
                originIataCode: originIataCode,
                destinationIataCode: destinationIataCode,
                calendarData: snapshot.data,
                initialDate: initialDate,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<Map<DateTime, Text>> fetchPricesData(
      {required BuildContext context}) async {
    final calendarPricesRepo =
        Dependencies.of(context).calendarPricesRepository;
    final String currency = context.read<CurrencySettingsCubit>().state.name;
    final Map<DateTime, Text> calendarData = {};

    for (int i = 0; i < countOfMonths; i++) {
      // await Future.delayed(const Duration(milliseconds: 200));
      final monthData = await calendarPricesRepo.getMonthMatrixPrices(
        options: MonthMatrixQuery(
          oneWay: widget.isOneWay,
          currency: currency,
          origin: originIataCode!,
          destination: destinationIataCode!,
          month: DateUtils.addMonthsToMonthDate(currentDate, i),
        ),
      );

      final leastThreePrices = monthData.data.take(3).map(
            (e) => e.value,
          );

      for (final dayInfo in monthData.data) {
        if (calendarData.containsKey(dayInfo.departDate)) {
          continue;
        }

        calendarData[dayInfo.departDate] = Text(
          dayInfo.value.toString(),
          style: AppStyles.textStylePoppins.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: leastThreePrices.contains(dayInfo.value)
                  ? Colors.green
                  : const Color.fromRGBO(0, 0, 0, 0.28)),
        );
      }
    }

    return calendarData;
  }
}

class _CalendarModalHeader extends StatefulWidget {
  const _CalendarModalHeader({required this.title});

  static const firstDayInWeek = DateTime.monday;

  final String title;

  @override
  State<_CalendarModalHeader> createState() => _CalendarModalHeaderState();
}

class _CalendarModalHeaderState extends State<_CalendarModalHeader> {
  late final String weekdays;

  @override
  void initState() {
    super.initState();
    final locale = context.read<AppLanguageSettingsCubit>().state;
    weekdays = getLocalizedWeekDays(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultModalHeader(
          centerText: widget.title,
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
                weekdays[(_CalendarModalHeader.firstDayInWeek + index) % 7],
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
  const _CalendarModalContent({
    required this.availableFromDate,
    required this.originIataCode,
    required this.destinationIataCode,
    required this.calendarData,
    required this.initialDate,
  });

  final DateTime availableFromDate;
  final DateTime initialDate;

  final String? originIataCode;
  final String? destinationIataCode;

  final Map<DateTime, Text>? calendarData;

  @override
  State<_CalendarModalContent> createState() {
    return _CalendarModalContentState();
  }
}

class _CalendarModalContentState extends State<_CalendarModalContent> {
  late final DateTime currentDate;
  late final DateTime lastMonth;
  late final int countOfMonths;
  late final DateTime availableFromDate;

  late final String? originIataCode;
  late final String? destinationIataCode;
  late final Map<DateTime, Text>? calendarData;

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    countOfMonths = 12;
    currentDate = DateTime.now();
    lastMonth = DateUtils.addMonthsToMonthDate(currentDate, countOfMonths);
    availableFromDate = widget.availableFromDate;

    originIataCode = widget.originIataCode;
    destinationIataCode = widget.destinationIataCode;
    calendarData = widget.calendarData;

    selectedDate = widget.initialDate;
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
                  key: ValueKey(index),
                  year: currentMonth.year,
                  month: currentMonth.month,
                  selectedDate: selectedDate,
                  onDateSelected: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                  availableFromDate: availableFromDate,
                  calendarData: calendarData,
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
                  DateFormat('EEE, dd MMM yyyy').format(selectedDate),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).departureDateSelected,
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
                      AppLocalizations.of(context).selectDate,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(selectedDate);
                    },
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
