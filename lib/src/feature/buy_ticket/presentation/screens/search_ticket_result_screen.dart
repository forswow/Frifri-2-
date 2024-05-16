import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/cities_inputs/cities_inputs.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/slider/horizontal_options_slider.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/ticket_preview_card.dart';

class TicketsSearchResultScreen extends StatefulWidget {
  const TicketsSearchResultScreen({super.key});

  @override
  State<TicketsSearchResultScreen> createState() =>
      _TicketsSearchResultScreenState();
}

class _TicketsSearchResultScreenState extends State<TicketsSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _TicketsSearchResultHeader(),
            _LocationPickerZone(),
            _ChipsZone(),
            _ResultedTicketsList(),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: tickets[index],
          );
        },
        itemCount: 3,
      ),
    );
  }
}

class _ChipsZone extends StatelessWidget {
  const _ChipsZone();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
      child: SizedBox(height: 40, child: HorizontalOptionsSlider()),
    );
  }
}

class _LocationPickerZone extends StatelessWidget {
  const _LocationPickerZone();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: CitiesInputs(
        citiesNames: {
          "flyFrom": "FlyFrom city",
          "flyTo": "FlyTo city",
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

List<TicketPreviewCard> tickets = [
  const TicketPreviewCard(
    isLesserCost: true,
    iconPath: 'assets/icons/utr-logo.png',
    companyName: 'Utair',
    price: 3690,
    time: '12:55 - 06:25',
  ),
  const TicketPreviewCard(
    isLesserCost: false,
    iconPath: 'assets/icons/smartavia-logo.png',
    companyName: 'Smartavia',
    price: 4160,
    time: '10:00 - 03:30',
  ),
  const TicketPreviewCard(
    isLesserCost: false,
    iconPath: 'assets/icons/s7airlines-logo.png',
    companyName: 'S7 Airlines',
    price: 4172,
    time: '17:10 - 02:20',
  ),
];
