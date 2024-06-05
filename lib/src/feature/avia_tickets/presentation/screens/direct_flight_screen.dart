import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/direct_oneway_tickets_entity.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/avia_ticket_widget.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/flight_prices_modal.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_airport_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../more/domain/entities/airport_entity.dart';
import '../bloc/direct_flight_bloc/direct_flight_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DirectFlightScreen extends StatefulWidget {
  const DirectFlightScreen({super.key});

  @override
  State<DirectFlightScreen> createState() => _DirectFlightScreenState();
}

class _DirectFlightScreenState extends State<DirectFlightScreen> {
  late final DirectFlightBloc directFlightBloc;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    directFlightBloc = Dependencies.of(context).directFlightBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currency = context.watch<CurrencySettingsCubit>().state;
    final location = context.watch<AirportSettingsCubit>().state;
    final locale = context.watch<AppLanguageSettingsCubit>().state;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(237, 239, 244, 1),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              builder: (BuildContext context) {
                return const SelectAirportModal();
              },
            );
          },
          child: const DirectFlightScreenAppBarContent(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              directFlightBloc.add(
                DirectFlight$FetchDestinationAirportsIataCodes(
                  originIataCode: location.toIataCode(),
                ),
              );
            },
            child: BlocConsumer<DirectFlightBloc, DirectFlightState>(
              // Запрашиваем сразу же аэропорты назначения
              bloc: directFlightBloc
                ..add(
                  DirectFlight$FetchDestinationAirportsIataCodes(
                    originIataCode: location.toIataCode(),
                  ),
                ), // ..add(),
              listener: (context, state) {
                if (state is DirectFlight$AirportsFetchingSuccess) {
                  // Теперь можно запрашивать сами билеты
                  final allDestinations = state.destinationIataCodes;
                  directFlightBloc.add(
                    DirectFlight$FetchTickets(
                      currency: currency.name,
                      originIataCode: location.toIataCode(),
                      destinationIataCodes: allDestinations,
                      locale: locale,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return switch (state) {
                  // В самом начале
                  DirectFlight$Idle() => const Text('idle'),
                  // Тянем из SupaBase IATA коды назначения
                  DirectFlight$AirportsFetchingInProgress() => const Text(
                      'Получаем аэропорты вылета из базы данных',
                    ),
                  // Как только стянули, запускаем поиск по этим кодам
                  DirectFlight$AirportsFetchingSuccess() => const Text(
                      'Города получены',
                    ),
                  // Пока ищем показываем прогресс
                  DirectFlight$TicketFetch() => const Text(
                      'Получаем билеты',
                    ),
                  // Получили и коды и билеты, пора показывать
                  DirectFlight$TicketSuccess() =>
                    AviaTicketList(allTickets: state.tickets),
                  //),
                  // Произошло что-то очень страшное, отвал чипа
                  DirectFlight$Error() => Text(
                      state.message,
                    ),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DirectFlightScreenAppBarContent extends StatelessWidget {
  const DirectFlightScreenAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AirportSettingsCubit, AirportEnum>(
          builder: (context, currentAirport) => RichText(
            text: TextSpan(
              text: AppLocalizations.of(context).directFligthsFrom,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: " ${airportToString(currentAirport, context: context)}",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(75, 148, 247, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
        SvgPicture.asset(
          'assets/icons/arrow 1.svg',
          height: 23,
          width: 23,
        )
      ],
    );
  }
}

class AviaTicketList extends StatefulWidget {
  const AviaTicketList({super.key, required this.allTickets});

  final List<DirectOnewayTicketsEntity> allTickets;

  @override
  State<AviaTicketList> createState() => _AviaTicketListState();
}

class _AviaTicketListState extends State<AviaTicketList> {
  late final List<DirectOnewayTicketsEntity> allDirectionsTickets;

  @override
  void initState() {
    super.initState();
    allDirectionsTickets = widget.allTickets;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      clipBehavior: Clip.hardEdge,
      proxyDecorator: (widget, index, animation) {
        final currentDirectionTickets = allDirectionsTickets[index];
        return GestureDetector(
          onTap: () {},
          child: AviaTicketWidget(
            directFligthsEntity: currentDirectionTickets.cheapestTicket,
            index: index,
            key: Key('$index'),
          ),
        );
      },
      padding: const EdgeInsets.only(left: 24, right: 24),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          // final MonthMatrix item = state.removeAt(oldIndex);
          // state.insert(newIndex, item);
        });
      },
      children: <Widget>[
        for (int index = 0; index < allDirectionsTickets.length; index += 1)
          GestureDetector(
            key: Key('$index'),
            onTap: () {
              showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SafeArea(
                    child: FlightPricesModal(
                      originAirportName: allDirectionsTickets[index]
                          .cheapestTicket
                          .departureLocationIataCode,
                      destinationAirportName: allDirectionsTickets[index]
                          .cheapestTicket
                          .placeOfArrivalIataCode,
                      oneWayTickets: allDirectionsTickets[index],
                    ),
                  );
                },
              );
            },
            child: AviaTicketWidget(
              directFligthsEntity: allDirectionsTickets[index].cheapestTicket,
              key: Key('$index'),
              index: index,
            ),
          )
      ],
    );
  }
}

String getCountry(AirportEnum e) {
  switch (e) {
    case AirportEnum.kutaisi:
      return 'Кутаиси';
    case AirportEnum.tbilisi:
      return 'Тбилиси';
    case AirportEnum.batumi:
      return 'Батуми';
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  const CustomAppBar({
    super.key,
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        height: preferredSize.height,
        color: Theme.of(context).appBarTheme.backgroundColor,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
