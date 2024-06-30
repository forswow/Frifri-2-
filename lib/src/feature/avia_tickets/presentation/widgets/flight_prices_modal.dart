import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/extensions/formatters.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/application/navigation/navigation_manager.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/direct_oneway_tickets_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/shared/domain/entities/airport_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FlightPricesModal extends StatelessWidget {
  const FlightPricesModal({
    required this.originAirportName, required this.destinationAirportName, required this.oneWayTickets, super.key,
  });

  final String originAirportName;
  final String destinationAirportName;
  final DirectOnewayTicketsEntity oneWayTickets;

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          FlightPricesModalHeader(
            destinationAirportName: destinationAirportName,
            originAirportName: originAirportName,
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          FlightPricesModalContent(
            oneWayTickets: oneWayTickets,
          ),
        ],
      ),
    );
  }
}

class FlightPricesModalHeader extends StatelessWidget {
  const FlightPricesModalHeader({
    required this.originAirportName, required this.destinationAirportName, super.key,
  });

  final String originAirportName;
  final String destinationAirportName;

  static const _headerTextScaleFactor = 0.27;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 17.6,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width:
                    MediaQuery.sizeOf(context).width * _headerTextScaleFactor,
                child: Text(
                  textAlign: TextAlign.center,
                  originAirportName,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SvgPicture.asset(
                  'assets/icons/searchfly-airplane.svg',
                  height: 25,
                  width: 25,
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.sizeOf(context).width * _headerTextScaleFactor,
                child: Text(
                  textAlign: TextAlign.center,
                  destinationAirportName,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ),
        ],
      ),
    );
  }
}

class FlightPricesModalContent extends StatefulWidget {
  const FlightPricesModalContent({
    required this.oneWayTickets, super.key,
  });

  final DirectOnewayTicketsEntity oneWayTickets;

  @override
  State<FlightPricesModalContent> createState() =>
      _FlightPricesModalContentState();
}

class _FlightPricesModalContentState extends State<FlightPricesModalContent> {
  late final DirectOnewayTicketsEntity oneWayDirectTickets;

  @override
  void initState() {
    super.initState();
    oneWayDirectTickets = widget.oneWayTickets;
    oneWayDirectTickets.allTickets.sortBy(
      (ticket) => ticket.departureDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = context.watch<CurrencySettingsCubit>().state;
    final locale = context.watch<AppLanguageSettingsCubit>().state;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).when,
                      style: AppStyles.textStylePoppins.copyWith(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      AppLocalizations.of(context).price,
                      textAlign: TextAlign.end,
                      style: AppStyles.textStylePoppins.copyWith(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                ...oneWayDirectTickets.allTickets.map(
                  (ticket) => Ink(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        goToSearchForm(
                          from: AirportEntity(
                            name: oneWayDirectTickets
                                .cheapestTicket.departureLocation,
                            code: oneWayDirectTickets
                                .cheapestTicket.departureLocationIataCode,
                          ),
                          to: AirportEntity(
                            name: oneWayDirectTickets
                                .cheapestTicket.placeOfArrival,
                            code: oneWayDirectTickets
                                .cheapestTicket.placeOfArrivalIataCode,
                          ),
                          departureDate: ticket.departureDate,
                        );
                      },
                      child: Row(
                        children: [
                          TimeWidget(
                            date: formatDate(ticket.departureDate),
                            time: formatMinutesToHoursAndMinutes(
                              ticket.flightTimeInMinutes,
                              AppLocalizations.of(context),
                            ),
                          ),
                          const Spacer(),
                          FittedBox(
                            child: Text(
                              '${AppLocalizations.of(context).from} ${formatCurrencyWithSpaces(ticket.price, currency, locale)}',
                              style: AppStyles.textStylePoppins.copyWith(
                                color: kPriceColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Divider(
            color: const Color(0xff000000).withOpacity(0.2),
            height: 1,
            thickness: 0.5,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/prices_calendar.svg'),
                      Text(
                        AppLocalizations.of(context).goToPriceCalendar,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: ConfirmationButton(
                    child: Text(
                      '${AppLocalizations.of(context).from} ${formatCurrencyWithSpaces(
                        oneWayDirectTickets.cheapestTicket.price,
                        currency,
                        locale,
                      )}',
                      style: AppStyles.textStylePoppins.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      // UrlLauncherHelper.launchInWeb(
                      //     'https://frifri.ge/$language/${widget.destination}');
                      goToSearchForm(
                        from: AirportEntity(
                          name: oneWayDirectTickets
                              .cheapestTicket.departureLocation,
                          code: oneWayDirectTickets
                              .cheapestTicket.departureLocationIataCode,
                        ),
                        to: AirportEntity(
                          name:
                              oneWayDirectTickets.cheapestTicket.placeOfArrival,
                          code: oneWayDirectTickets
                              .cheapestTicket.placeOfArrivalIataCode,
                        ),
                      );
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

  void goToSearchForm({
    required AirportEntity from,
    required AirportEntity to,
    DateTime? departureDate,
  }) {
    final searchModelForm = SearchModel();

    searchModelForm.departureAt = from;
    searchModelForm.arrivalAt = to;
    searchModelForm.isDirectFlightOnly = true;
    searchModelForm.departureDate = departureDate;

    context.pushReplacement(
      NavigationManager.search,
      extra: searchModelForm,
    );
    Navigator.pop(context);
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({required this.date, required this.time, super.key});

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          time,
          textAlign: TextAlign.left,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM', 'ru');

  return formatter.format(date);
}
