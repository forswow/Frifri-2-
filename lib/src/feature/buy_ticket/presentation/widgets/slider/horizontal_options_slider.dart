import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/ui_kit/date_picker/calendar_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/passengers_modal/passengers_modal.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/slider/options_chips_card.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class HorizontalOptionsSlider extends StatelessWidget {
  const HorizontalOptionsSlider({super.key, required this.searchModel});

  final SearchModel searchModel;

  static const double _defaultChipsDefaultTextSize = 14;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () {
            onDateChange(context);
          },
          child: DateChip(
            searchModel: searchModel,
            defaultChipsDefaultTextSize: _defaultChipsDefaultTextSize,
          ),
        ),
        GestureDetector(
          onTap: () {
            onLayoverChange(context);
          },
          child: LayoverInfoChip(
            searchModel: searchModel,
            defaultChipsDefaultTextSize: _defaultChipsDefaultTextSize,
          ),
        ),
        GestureDetector(
          onTap: () {
            onPassengersChange(context);
          },
          child: PassengersInfoChip(
            searchModel: searchModel,
            defaultChipsDefaultTextSize: _defaultChipsDefaultTextSize,
          ),
        ),
      ],
    );
  }

  void onDateChange(BuildContext context) async {
    final newDepartureDate = await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) => CalendarModal(
        initialDate: searchModel.departureDate!,
        availableFromDate: DateTime.now(),
        countOfMonths: 12,
        originIataCode: searchModel.departureAt!.code,
        destinationIataCode: searchModel.arrivalAt!.code,
        isOneWay: true,
        title: AppLocalizations.of(context).chooseDepartureDate,
        // title: "Выберите дату отправления",
      ),
    );

    if (newDepartureDate == null) return;

    searchModel.departureDate = newDepartureDate;
    searchModel.returnDate = null;

    if (context.mounted) {
      startTicketsSearch(context);
    }
  }

  void onLayoverChange(BuildContext context) {
    searchModel.isDirectFlightOnly = !searchModel.isDirectFlightOnly;
  }

  void onPassengersChange(BuildContext context) async {
    final passengersData = await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) => const PassengersModal(),
    );

    if (passengersData == null) return;

    searchModel.passengersAndClass = passengersData;

    if (context.mounted) {
      startTicketsSearch(context);
    }
  }

  void startTicketsSearch(BuildContext context) async {
    final locale = context.read<AppLanguageSettingsCubit>().state;
    final currency = context.read<CurrencySettingsCubit>().state.name;

    context.read<SearchTicketsBloc>().add(
          StartSearchTicketEvent(
            searchModelForm: searchModel,
            locale: locale,
            currency: currency,
          ),
        );
  }
}

class PassengersInfoChip extends StatelessWidget {
  const PassengersInfoChip({
    super.key,
    required this.searchModel,
    required double defaultChipsDefaultTextSize,
  }) : _defaultChipsDefaultTextSize = defaultChipsDefaultTextSize;

  final SearchModel searchModel;
  final double _defaultChipsDefaultTextSize;

  @override
  Widget build(BuildContext context) {
    return OptionsChipsCard(
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.person,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "${searchModel.passengersAndClass!.passengers.adults} ,",
                style: AppStyles.textStylePoppins.copyWith(
                  fontSize: _defaultChipsDefaultTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            tripClassToString(
              searchModel.passengersAndClass!.tripClass,
              context: context,
            ),
            style: AppStyles.textStylePoppins.copyWith(
              fontSize: _defaultChipsDefaultTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class LayoverInfoChip extends StatelessWidget {
  const LayoverInfoChip({
    super.key,
    required this.searchModel,
    required double defaultChipsDefaultTextSize,
  }) : _defaultChipsDefaultTextSize = defaultChipsDefaultTextSize;

  final SearchModel searchModel;
  final double _defaultChipsDefaultTextSize;

  @override
  Widget build(BuildContext context) {
    return OptionsChipsCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.flight,
            color: Colors.grey,
            size: 20,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            searchModel.isDirectFlightOnly
                ? AppLocalizations.of(context).directFlight
                : AppLocalizations.of(context).withLayovers,
            style: AppStyles.textStylePoppins.copyWith(
              fontSize: _defaultChipsDefaultTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class DateChip extends StatelessWidget {
  const DateChip({
    super.key,
    required this.searchModel,
    required double defaultChipsDefaultTextSize,
  }) : _defaultChipsDefaultTextSize = defaultChipsDefaultTextSize;

  final SearchModel searchModel;
  final double _defaultChipsDefaultTextSize;

  @override
  Widget build(BuildContext context) {
    final locale = context.read<AppLanguageSettingsCubit>().state;
    logger.i("Current locale: $locale");

    return OptionsChipsCard(
      child: RichText(
        text: TextSpan(
          text: DateFormat("dd MMM, ", locale)
              .format(searchModel.departureDate!)
              .replaceAll(".", ""),
          style: AppStyles.textStylePoppins.copyWith(
            fontSize: _defaultChipsDefaultTextSize,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text:
                  DateFormat("EEE", locale).format(searchModel.departureDate!),
              style: AppStyles.textStylePoppins.copyWith(
                fontSize: _defaultChipsDefaultTextSize,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
