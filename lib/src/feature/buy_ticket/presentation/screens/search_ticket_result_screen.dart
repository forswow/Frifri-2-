import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_tickets/search_ticket_bloc_states.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/search_city_modal.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/cities_inputs/cities_input_widget.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/slider/horizontal_options_slider.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/ticket_preview_card.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchTicketsResultScreen extends StatefulWidget {
  const SearchTicketsResultScreen({super.key, required this.searchModel});

  final SearchModel searchModel;

  @override
  State<SearchTicketsResultScreen> createState() =>
      _SearchTicketsResultScreenState();
}

class _SearchTicketsResultScreenState extends State<SearchTicketsResultScreen> {
  late final SearchModel _searchModel;
  late final SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    _searchModel = widget.searchModel;
    searchBloc = context.read<SearchBloc>();
    final locale = context.read<AppLanguageCubit>().state.toLowerCase();

    final currencyEnum = context.read<CurrencyCubit>().state;
    final currency = currencyEnum.name;

    searchBloc.add(
      StartSearchTicketEvent(
        searchModelForm: _searchModel,
        locale: locale,
        currency: currency,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListenableBuilder(
          listenable: _searchModel,
          builder: (context, child) {
            return Column(
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
                const SizedBox(
                  height: 14,
                ),
                _ResultedTicketsList(
                  searchModel: _searchModel,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ResultedTicketsList extends StatelessWidget {
  const _ResultedTicketsList({
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state) {
            case SearchComplete():
              if (state.tickets.isEmpty) {
                return Center(
                  child: Text(
                    "К сожалению билеты по вашему запросу не найдены",
                    style: AppStyles.textStylePoppins.copyWith(
                      fontSize: 16,
                    ),
                  ),
                );
              }

              final directOnlyTickets = state.tickets
                  .where(
                    (element) => element.isDirect,
                  )
                  .toList();

              if (directOnlyTickets.isEmpty && searchModel.isDirectFlightOnly) {
                return Center(
                  child: Text(
                    "По выбранному рейсу не найдено прямых отправлений",
                    style: AppStyles.textStylePoppins.copyWith(
                      fontSize: 16,
                    ),
                  ),
                );
              }

              if (searchModel.isDirectFlightOnly) {
                return ListView.builder(
                  itemCount: directOnlyTickets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      key: ValueKey(index),
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TicketPreviewCard(
                        ticketEntity: directOnlyTickets[index],
                        isCheapestTicket: index == 0,
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: state.tickets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TicketPreviewCard(
                        ticketEntity: state.tickets[index],
                        isCheapestTicket: index == 0,
                      ),
                    );
                  },
                );
              }

            case SearchingInProgress():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SearchInitial():
              return Container();
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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            CitiesInput(
              cityName: searchModel.departureAt?.name ?? "Укажите город",
              onTitlePressed: () async {
                final AirportEntity? location = await showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) => SearchCityModal(
                    searchModel: searchModel,
                    mode: SearchCityModalModeEnum.from,
                  ),
                );

                if (location == null) {
                  return;
                }

                if (searchModel.arrivalAt != null) {
                  if (location.code == searchModel.arrivalAt!.code) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Вы выбрали одну и ту же локацию"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                    return;
                  }
                }

                searchModel.departureAt = location;
                if (context.mounted) {
                  final locale = context.read<AppLanguageCubit>().state;
                  final currency = context.read<CurrencyCubit>().state.name;
                  context.read<SearchBloc>().add(
                        StartSearchTicketEvent(
                          searchModelForm: searchModel,
                          locale: locale,
                          currency: currency,
                        ),
                      );
                }
              },
              onIconPressed: () async {
                var tmp = searchModel.departureAt;
                searchModel.departureAt = searchModel.arrivalAt;
                searchModel.arrivalAt = tmp;
                final locale = context.read<AppLanguageCubit>().state;
                final currency = context.read<CurrencyCubit>().state.name;
                context.read<SearchBloc>().add(
                      StartSearchTicketEvent(
                        searchModelForm: searchModel,
                        locale: locale,
                        currency: currency,
                      ),
                    );
              },
              iconPath: 'assets/icons/arrow-up-down.svg',
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 20,
            ),
            CitiesInput(
              cityName: searchModel.arrivalAt?.name ?? "Укажите город",
              onTitlePressed: () async {
                final AirportEntity? location = await showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) => SearchCityModal(
                    searchModel: searchModel,
                    mode: SearchCityModalModeEnum.to,
                  ),
                );

                if (location == null) {
                  return;
                }

                if (searchModel.departureAt != null) {
                  if (location.code == searchModel.departureAt!.code) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Вы выбрали одну и ту же локацию"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                    return;
                  }
                }

                searchModel.arrivalAt = location;
                if (context.mounted) {
                  final locale = context.read<AppLanguageCubit>().state;
                  final currency = context.read<CurrencyCubit>().state.name;
                  context.read<SearchBloc>().add(
                        StartSearchTicketEvent(
                          searchModelForm: searchModel,
                          locale: locale,
                          currency: currency,
                        ),
                      );
                }
              },
              onIconPressed: () {
                searchModel.arrivalAt = null;
                context.pop();
              },
              iconPath: 'assets/icons/x.svg',
            ),
          ],
        ),
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
        AppLocalizations.of(context).whereToFly,
        style: AppStyles.textStylePoppins.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
