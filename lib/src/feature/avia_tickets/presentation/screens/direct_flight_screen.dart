import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_event.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/bloc/direct_flight_bloc/direct_flight_bloc_state.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/avia_ticket_widget.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/flight_prices_modal.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/more/presentation/modals/select_airport_modal.dart';
import 'package:frifri/src/feature/shared/data/dto/month_matrix.dart';
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
    final locale = context.watch<AppLanguageSettingsCubit>().state;
    final currency = context.watch<CurrencySettingsCubit>().state;
    final location = context.watch<AirportSettingsCubit>().state;
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
          child: Row(
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
                        text:
                            " ${airportToString(currentAirport, context: context)}",
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
          ),
        ),
        actions: const [],
      ),
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              directFlightBloc.add(
                FetchTicketPrices(
                  locale: locale,
                  currency: currency.name,
                  origin: getCountryCode(
                    location,
                  ),
                ),
              );
            },
            child: BlocConsumer<DirectFlightBloc, DirectFlightState>(
              bloc: directFlightBloc
                ..add(
                  FetchTicketPrices(
                    locale: locale,
                    currency: currency.name,
                    origin: getCountryCode(
                      location,
                    ),
                  ),
                ),
              listener: (context, state) {},
              builder: (context, state) {
                return switch (state) {
                  DirectFlight$Idle() => const Text('idle'),
                  DirectFlight$TicketSuccess() => ListView.builder(
                      itemCount: state.tickets.length,
                      itemBuilder: (context, index) {
                        return const Text('s');
                      }),
                  DirectFlight$AirportsFetchingInProgress() => const Text(
                      'Получаем гороода вылета',
                    ),
                  DirectFlight$TicketFetch() => const Text(
                      'Получаем билеты',
                    ),
                  DirectFlight$AirportsFetchingSuccess() =>
                    const Text('Города полученны'),
                  DirectFlight$Error() => Text(
                      state.message,
                    ),
                  DirectFlight$MonthSuccess() => AviaTicketList(
                      state: state.monthMatrix,
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

class AviaTicketList extends StatefulWidget {
  const AviaTicketList({super.key, required this.state});

  final List<MonthMatrix> state;

  @override
  State<AviaTicketList> createState() => _AviaTicketListState();
}

class _AviaTicketListState extends State<AviaTicketList> {
  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    return ReorderableListView(
      clipBehavior: Clip.hardEdge,
      proxyDecorator: (widget, index, animation) {
        final data = state[index];
        return GestureDetector(
          onTap: () {},
          child: AviaTicketWidget(
            directFligthsEntity: data,
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
          final MonthMatrix item = state.removeAt(oldIndex);
          state.insert(newIndex, item);
        });
      },
      children: <Widget>[
        for (int index = 0; index < state.length; index += 1)
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
                      originAirportName: state[index].origin,
                      destinationAirportName: state[index].destination,
                      monthMatrixDayInfo: state[index].data,
                    ),
                  );
                },
              );
            },
            child: AviaTicketWidget(
              directFligthsEntity: state[index],
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

String getCountryCode(AirportEnum e) {
  switch (e) {
    case AirportEnum.kutaisi:
      return 'KUT';
    case AirportEnum.tbilisi:
      return 'TBS';
    case AirportEnum.batumi:
      return 'BUS';
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
