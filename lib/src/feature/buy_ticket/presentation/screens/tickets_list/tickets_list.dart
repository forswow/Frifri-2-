import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/tickets_list/components/cities_inputs/cities_inputs.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/tickets_list/components/slider/HoryzUserDataSlider.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/tickets_list/components/ticket_preview_card/ticket_preview_card.dart';

class TicketsList extends StatefulWidget {
  const TicketsList({super.key});

  @override
  State<TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
              child: Text(AppLocalizations.of(context)!.whereToFly,
                  style: AppStyles.textStylePoppins
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: CitiesInputs(
                citiesNames: {
                  "flyFrom": "FlyFrom city",
                  "flyTo": "FlyTo city",
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 0, 0),
              child: Container(height: 40, child: HoryzUserDataSlider()),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: tickets[index],
                  );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<TicketPreviewCard> tickets = [
  TicketPreviewCard(
      isLesserCost: true,
      iconPath: 'assets/icons/utr-logo.png',
      companyName: 'Utair',
      price: 3690,
      time: '12:55 - 06:25'),
  TicketPreviewCard(
      isLesserCost: false,
      iconPath: 'assets/icons/smartavia-logo.png',
      companyName: 'Smartavia',
      price: 4160,
      time: '10:00 - 03:30'),
  TicketPreviewCard(
      isLesserCost: false,
      iconPath: 'assets/icons/s7airlines-logo.png',
      companyName: 'S7 Airlines',
      price: 4172,
      time: '17:10 - 02:20'),
];
