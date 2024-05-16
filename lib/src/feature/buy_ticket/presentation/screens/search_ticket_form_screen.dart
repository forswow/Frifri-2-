import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/date_picker/calendar_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_events.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/true_search_ticket_bloc_states.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/passengers_modal/passengers_modal.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/search_modal_fly_from/searchfly_modal_from.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/search_modal_fly_to/searchfly_modal_to.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_result_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choosefly_radiobutton.dart';

final _defaultDivider = Divider(
  height: 1,
  color: Colors.grey[300],
  thickness: 1,
);

class SearchTicketFormScreen extends StatefulWidget {
  const SearchTicketFormScreen({super.key});

  @override
  State<SearchTicketFormScreen> createState() => _SearchTicketFormScreenState();
}

class _SearchTicketFormScreenState extends State<SearchTicketFormScreen> {
  late final SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    searchBloc = context.read<SearchBloc>();
  }

  void onFindTicketsButtonClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TicketsSearchResultScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const _SearchTicketScreenHeader(),
              const SizedBox(height: 24),
              // Форма
              FormWrapper(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LocationPickerZone(),
                    _defaultDivider,
                    const FlightDatePickerZone(),
                    _defaultDivider,
                    const PassengersAndClassPickerZone(),
                    _defaultDivider,
                    const DirectFlightCheckZone(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ConfirmationButton(
                  onPressed: onFindTicketsButtonClick,
                  child: Text(
                    AppLocalizations.of(context)!.findTickets,
                    style: AppStyles.textStylePoppins.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationPickerZone extends StatelessWidget {
  const LocationPickerZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          const Expanded(
            child: FromLocationPicker(),
          ),
          SvgPicture.asset(
            'assets/icons/searchfly-airplane.svg',
          ),
          const Expanded(
            child: ToLocationPicker(),
          ),
        ],
      ),
    );
  }
}

class ToLocationPicker extends StatelessWidget {
  const ToLocationPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final AirportEntity? location = await showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => SearchFlyModalTo(
            shortName: "Выбрать".substring(0, 3).toUpperCase(),
          ),
        );

        if (location == null) return;

        if (context.mounted) {
          context.read<SearchBloc>().add(InputArrivalAtEvent(location));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            AppLocalizations.of(context)!.where,
            style: AppStyles.textStylePoppins.copyWith(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is FillingFormOptions) {
                return Text(
                  state.arrivalAt == null
                      ? AppLocalizations.of(context)!.choose
                      : state.arrivalAt!.name,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: state.arrivalAt == null ? Colors.grey : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }

              return Text(
                "Выбрать",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FromLocationPicker extends StatelessWidget {
  const FromLocationPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final AirportEntity? location = await showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => const SearchFlyModalFrom(),
        );
        if (location == null) return;
        if (context.mounted) {
          context.read<SearchBloc>().add(InputDepartureAtEvent(location));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.whereFrom,
            style: AppStyles.textStylePoppins.copyWith(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (BuildContext context, state) {
              if (state is FillingFormOptions) {
                return Text(
                  state.departureAt == null
                      ? AppLocalizations.of(context)!.choose
                      : state.departureAt!.name,
                  style: AppStyles.textStylePoppins.copyWith(
                    color:
                        state.departureAt == null ? Colors.grey : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }

              return Text(
                "Выбрать",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FlightDatePickerZone extends StatelessWidget {
  const FlightDatePickerZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (context) => const CalendarModal(),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.when,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.selectDate,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Divider(
            height: 32,
            color: Colors.grey,
            thickness: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.back,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.selectDate,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DirectFlightCheckZone extends StatelessWidget {
  const DirectFlightCheckZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: [
          RadioButton(
            callback: () {},
            isActive: true,
          ),
          Text(
            AppLocalizations.of(context)!.directFlightsOnly,
            style: AppStyles.textStylePoppins.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class PassengersAndClassPickerZone extends StatelessWidget {
  const PassengersAndClassPickerZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                builder: (context) => const PassengersModal(
                  adultPassengersCount: 1,
                  childCount: 0,
                  flightClass: null,
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.passengers,
                        style: AppStyles.textStylePoppins
                            .copyWith(color: Colors.grey, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.choose,
                      style: AppStyles.textStylePoppins.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppLocalizations.of(context)!.placeClass,
                        style: AppStyles.textStylePoppins
                            .copyWith(color: Colors.grey, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.choose,
                      style: AppStyles.textStylePoppins.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 78),
          width: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: child,
    );
  }
}

class _SearchTicketScreenHeader extends StatelessWidget {
  const _SearchTicketScreenHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.whereToFly,
      style: AppStyles.textStylePoppins.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
