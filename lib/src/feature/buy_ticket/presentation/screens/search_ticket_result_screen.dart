import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_states.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/cities_inputs/cities_inputs.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/slider/horizontal_options_slider.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/ticket_preview_card.dart';

class TicketsSearchResultScreen extends StatefulWidget {
  const TicketsSearchResultScreen({super.key, required this.searchModel});

  final SearchModel searchModel;

  @override
  State<TicketsSearchResultScreen> createState() =>
      _TicketsSearchResultScreenState();
}

class _TicketsSearchResultScreenState extends State<TicketsSearchResultScreen> {
  late final SearchModel _searchModel;
  late final SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    _searchModel = widget.searchModel;
    searchBloc = context.read<SearchBloc>();

    searchBloc.add(
      StartSearchTicketEvent(_searchModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _TicketsSearchResultHeader(),
            _LocationPickerZone(
              searchModel: _searchModel,
            ),
            _ChipsZone(
              searchModel: _searchModel,
            ),
            const _ResultedTicketsList(),
          ],
        ),
      ),
    );
  }
}

class _ResultedTicketsList extends StatelessWidget {
  const _ResultedTicketsList();

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 16),
    //         child: tickets[index],
    //       );
    //     },
    //     itemCount: 3,
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchComplete) {
            return ListView.builder(
              itemCount: state.tickets.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TicketPreviewCard(
                    companyName:
                        state.tickets[index].segmentsList.first.airlineName,
                    iconPath:
                        state.tickets[index].segmentsList.first.airlineLogo,
                    isLesserCost: index == 0,
                    price: state.tickets[index].price,
                    time: state.tickets[index].flightDuration,
                    departureAtIataCode:
                        state.tickets[index].originAirport.code,
                    arrivalAtIataCode:
                        state.tickets[index].destinationAirport.code,
                    departureTime:
                        state.tickets[index].segmentsList.first.departureTime,
                    arrivalTime:
                        state.tickets[index].segmentsList.last.arrivalTime,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

class _ChipsZone extends StatelessWidget {
  const _ChipsZone({required this.searchModel});

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 0, 0),
      child: SizedBox(
        height: 40,
        child: HorizontalOptionsSlider(
          searchModel: searchModel,
        ),
      ),
    );
  }
}

class _LocationPickerZone extends StatelessWidget {
  const _LocationPickerZone({required this.searchModel});

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: CitiesInputs(
        searchModel: searchModel,
        citiesNames: {
          "flyFrom": searchModel.departureAt!.name,
          "flyTo": searchModel.arrivalAt!.name,
        },
      ),
    );
  }
}

class _TicketsSearchResultHeader extends StatelessWidget {
  const _TicketsSearchResultHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
      child: Text(
        AppLocalizations.of(context)!.whereToFly,
        style: AppStyles.textStylePoppins.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
