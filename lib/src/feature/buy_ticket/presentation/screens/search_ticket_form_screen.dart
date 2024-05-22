import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/date_picker/calendar_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/passengers.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/passengers_and_class.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/passengers_modal/passengers_modal.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/new_search_modal/search_city_modal.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_result_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choosefly_radiobutton.dart';
import 'package:intl/intl.dart';

class SearchModel with ChangeNotifier {
  AirportEntity? _departureAt;
  AirportEntity? _arrivalAt;
  DateTime? _departureDate;
  DateTime? _returnDate;
  bool _isDirectFlight = false;
  PassengersAndClass? _passengers = const PassengersAndClass(
    passengers: PassengersEntity(
      adults: 1,
      children: 0,
    ),
    tripClass: TripClass.economy,
  );

  // Getters
  AirportEntity? get departureAt => _departureAt;
  AirportEntity? get arrivalAt => _arrivalAt;
  DateTime? get departureDate => _departureDate;
  DateTime? get returnDate => _returnDate;
  PassengersAndClass? get passengersAndClass => _passengers;
  bool get isDirectFlightOnly => _isDirectFlight;

  // Setters with notifyListeners
  set departureAt(AirportEntity? value) {
    _departureAt = value;
    notifyListeners();
  }

  set arrivalAt(AirportEntity? value) {
    _arrivalAt = value;
    notifyListeners();
  }

  set departureDate(DateTime? value) {
    _departureDate = value;
    notifyListeners();
  }

  set returnDate(DateTime? value) {
    _returnDate = value;
    notifyListeners();
  }

  set passengersAndClass(PassengersAndClass? value) {
    _passengers = value;
    notifyListeners();
  }

  set isDirectFlightOnly(bool value) {
    _isDirectFlight = value;
    notifyListeners();
  }
}

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
  // Начальные значения формы
  // формироваться она будет при submit-е
  // с помощью полей ниже
  final _searchModel = SearchModel();

  void onFindTicketsButtonClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TicketsSearchResultScreen(
            searchModel: _searchModel,
          );
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
                    LocationPickerZone(
                      searchModel: _searchModel,
                    ),
                    _defaultDivider,
                    FlightDatePickerZone(
                      searchModel: _searchModel,
                    ),
                    _defaultDivider,
                    PassengersAndClassPickerZone(
                      searchModel: _searchModel,
                    ),
                    _defaultDivider,
                    DirectFlightCheckZone(
                      searchModel: _searchModel,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ListenableBuilder(
                  listenable: _searchModel,
                  builder: (context, child) {
                    return ConfirmationButton(
                      onPressed: isConfirmationButtonActive()
                          ? () => onFindTicketsButtonClick(context)
                          : null,
                      child: Text(
                        AppLocalizations.of(context)!.findTickets,
                        style: AppStyles.textStylePoppins.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isConfirmationButtonActive() {
    return _searchModel.departureAt != null &&
        _searchModel.arrivalAt != null &&
        _searchModel.departureDate != null &&
        _searchModel.passengersAndClass != null;
  }
}

class LocationPickerZone extends StatelessWidget {
  const LocationPickerZone({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          Expanded(
            child: FromLocationPicker(
              searchModel: searchModel,
            ),
          ),
          SvgPicture.asset(
            'assets/icons/searchfly-airplane.svg',
          ),
          Expanded(
            child: ToLocationPicker(
              searchModel: searchModel,
            ),
          ),
        ],
      ),
    );
  }
}

class ToLocationPicker extends StatelessWidget {
  const ToLocationPicker({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final AirportEntity? location = await showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => SearchCityModal(
            searchModel: searchModel,
            mode: SearchCityModalModeEnum.to,
          ),
        );

        if (location == null) return;

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
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.where,
                style: AppStyles.textStylePoppins.copyWith(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                " *",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ListenableBuilder(
            listenable: searchModel,
            builder: (context, child) {
              return Text(
                searchModel.arrivalAt?.name ?? "Выбрать",
                style: AppStyles.textStylePoppins.copyWith(
                  fontWeight: FontWeight.w600,
                  color: searchModel.arrivalAt == null
                      ? Colors.grey
                      : Colors.black,
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
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final AirportEntity? location = await showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => SearchCityModal(
            searchModel: searchModel,
            mode: SearchCityModalModeEnum.from,
          ),
        );

        if (location == null) return;

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
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.whereFrom,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                " *",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ListenableBuilder(
            listenable: searchModel,
            builder: (context, child) {
              return Text(
                searchModel.departureAt == null
                    ? AppLocalizations.of(context)!.choose
                    : searchModel.departureAt!.name,
                style: AppStyles.textStylePoppins.copyWith(
                  color: searchModel.departureAt == null
                      ? Colors.grey
                      : Colors.black,
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
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          Expanded(
            child: DepartureDatePicker(
              searchModel: searchModel,
            ),
          ),
          Expanded(
            child: ReturnDatePicker(
              searchModel: searchModel,
            ),
          ),
        ],
      ),
    );
  }
}

class DepartureDatePicker extends StatelessWidget {
  const DepartureDatePicker({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final DateTime? departureDate = await showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => CalendarModal(
            title: AppLocalizations.of(context)!.when,
            initialDate: DateTime.now(),
            availableFromDate: DateTime.now(),
            isOneWay: true,
            originIataCode: searchModel.departureAt?.code,
            destinationIataCode: searchModel.arrivalAt?.code,
            countOfMonths: 12,
          ),
        );

        if (departureDate == null) return;

        if (searchModel.returnDate != null) {
          searchModel.returnDate = null;
        }

        searchModel.departureDate = departureDate;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.when,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                " *",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ListenableBuilder(
            listenable: searchModel,
            builder: (context, child) {
              return Text(
                searchModel.departureDate == null
                    ? AppLocalizations.of(context)!.choose
                    : DateFormat('dd MMMM yyyy')
                        .format(searchModel.departureDate!),
                style: AppStyles.textStylePoppins.copyWith(
                  color: searchModel.departureDate == null
                      ? Colors.grey
                      : Colors.black,
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

class ReturnDatePicker extends StatelessWidget {
  const ReturnDatePicker({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final DateTime leastAvailableDate;
        leastAvailableDate = searchModel.departureDate ?? DateTime.now();

        final DateTime? returnDate = await showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => CalendarModal(
            title: AppLocalizations.of(context)!.back,
            initialDate: leastAvailableDate,
            availableFromDate: leastAvailableDate,
            isOneWay: false,
            originIataCode: searchModel.departureAt?.code,
            destinationIataCode: searchModel.arrivalAt?.code,
            countOfMonths: 12,
          ),
        );

        if (returnDate == null) return;

        searchModel.returnDate = returnDate;
      },
      child: Column(
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
          ListenableBuilder(
            listenable: searchModel,
            builder: (context, child) {
              return Text(
                searchModel.returnDate == null
                    ? AppLocalizations.of(context)!.choose
                    : DateFormat('dd MMMM yyyy')
                        .format(searchModel.returnDate!),
                style: AppStyles.textStylePoppins.copyWith(
                  color: searchModel.returnDate == null
                      ? Colors.grey
                      : Colors.black,
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

class DirectFlightCheckZone extends StatelessWidget {
  const DirectFlightCheckZone({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        searchModel.isDirectFlightOnly = !searchModel.isDirectFlightOnly;
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          children: [
            ListenableBuilder(
              listenable: searchModel,
              builder: (context, child) {
                return RadioButton(
                  isActive: searchModel.isDirectFlightOnly,
                );
              },
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
      ),
    );
  }
}

class PassengersAndClassPickerZone extends StatelessWidget {
  const PassengersAndClassPickerZone({
    super.key,
    required this.searchModel,
  });

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: InkWell(
            onTap: () async {
              final PassengersAndClass? passengers = await showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                builder: (context) => PassengersModal(
                  adultPassengersCount:
                      searchModel.passengersAndClass?.passengers.adults ?? 1,
                  childCount:
                      searchModel.passengersAndClass?.passengers.children ?? 0,
                  flightClass: searchModel.passengersAndClass?.tripClass,
                ),
              );

              if (passengers == null) return;

              searchModel.passengersAndClass = passengers;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.passengers,
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          " *",
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.red[900],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ListenableBuilder(
                      listenable: searchModel,
                      builder: (context, child) {
                        return ListenableBuilder(
                          listenable: searchModel,
                          builder: (context, child) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              width: 155,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  searchModel.passengersAndClass == null
                                      ? AppLocalizations.of(context)!.choose
                                      : "${searchModel.passengersAndClass!.passengers.adults} ${AppLocalizations.of(context)!.adults} ${searchModel.passengersAndClass!.passengers.children} ${AppLocalizations.of(context)!.children}",
                                  style: AppStyles.textStylePoppins.copyWith(
                                    color:
                                        searchModel.passengersAndClass == null
                                            ? Colors.grey
                                            : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.placeClass,
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          " *",
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.red[900],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ListenableBuilder(
                      listenable: searchModel,
                      builder: (context, child) {
                        return Text(
                          searchModel.passengersAndClass == null
                              ? AppLocalizations.of(context)!.choose
                              : tripClassToString(
                                  searchModel.passengersAndClass!.tripClass,
                                  context: context,
                                ),
                          style: AppStyles.textStylePoppins.copyWith(
                            color: searchModel.passengersAndClass == null
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
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
