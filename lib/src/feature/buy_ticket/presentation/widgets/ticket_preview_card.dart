import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/ticket_modal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TicketPreviewCard extends StatefulWidget {
  const TicketPreviewCard({
    super.key,
    required this.ticketEntity,
    required this.isCheapestTicket,
  });

  final TicketEntity ticketEntity;
  final bool isCheapestTicket;

  @override
  State<TicketPreviewCard> createState() => _TicketPreviewCardState();
}

class _TicketPreviewCardState extends State<TicketPreviewCard> {
  late final TicketEntity ticketEntity;
  late final String iconPath;
  late final String companyName;
  late final String price;
  late final String time;
  late final bool isCheapestTicket;

  late final String formattedPrice;
  late final String departureAtIataCode;
  late final String arrivalAtIataCode;
  late final String departureTime;
  late final String arrivalTime;

  late final int countOfTransfers;

  @override
  void initState() {
    super.initState();
    ticketEntity = widget.ticketEntity;
    isCheapestTicket = widget.isCheapestTicket;

    companyName = ticketEntity.segmentsList.first.airlineName;
    iconPath = ticketEntity.segmentsList.first.airlineLogo;
    formattedPrice = ticketEntity.formattedPrice;
    time = ticketEntity.flightDuration;
    departureAtIataCode = ticketEntity.originAirport.code;
    arrivalAtIataCode = ticketEntity.destinationAirport.code;
    departureTime = ticketEntity.segmentsList.first.departureTime;

    arrivalTime = ticketEntity.segmentsList.last.arrivalTime;
    countOfTransfers = ticketEntity.segmentsList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => TicketModal(
                ticketEntity: ticketEntity,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(18, 18, 18, 0.08),
                  offset: Offset(0, 16),
                  blurRadius: 32,
                  spreadRadius: 0,
                ),
              ],
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 18, 15, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TicketHeader(
                    iconPath: iconPath,
                    companyName: companyName,
                    formattedPrice: formattedPrice,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: FixedColumnWidth(30),
                      2: FixedColumnWidth(48),
                      3: FixedColumnWidth(24),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: [
                      TableRow(
                        children: [
                          TicketDepartureTimeAndPlace(
                            departureTime: ticketEntity.departureTime,
                            departureAtIataCode:
                                ticketEntity.originAirport.code,
                          ),
                          Text(
                            "–",
                            textAlign: TextAlign.center,
                            style: AppStyles.textStylePoppins.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TicketArrivalTimeAndPlace(
                            arrivalTime: ticketEntity.arrivalTime,
                            arrivalAtIataCode:
                                ticketEntity.destinationAirport.code,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TicketDurationAndTransfersSection(
                            time: time,
                            countOfTransfers: countOfTransfers,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        isCheapestTicket
            ? Positioned(
                left: 16,
                top: -10,
                child: Container(
                  alignment: Alignment.center,
                  width: 149,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Самый дешёвый',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStylePoppins.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class TicketDurationAndTransfersSection extends StatelessWidget {
  const TicketDurationAndTransfersSection({
    super.key,
    required this.time,
    required this.countOfTransfers,
  });

  final String time;
  final int countOfTransfers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: AppStyles.textStylePoppins.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "${AppLocalizations.of(context).countOfLayovers}: ${countOfTransfers - 1}",
            style: AppStyles.textStylePoppins.copyWith(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class TicketArrivalTimeAndPlace extends StatelessWidget {
  const TicketArrivalTimeAndPlace({
    super.key,
    required this.arrivalTime,
    required this.arrivalAtIataCode,
  });

  final String arrivalTime;
  final String arrivalAtIataCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          arrivalTime,
          style: AppStyles.textStylePoppins.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          arrivalAtIataCode,
          style: AppStyles.textStylePoppins.copyWith(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class TicketDepartureTimeAndPlace extends StatelessWidget {
  const TicketDepartureTimeAndPlace({
    super.key,
    required this.departureTime,
    required this.departureAtIataCode,
  });

  final String departureTime;
  final String departureAtIataCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          departureTime,
          style: AppStyles.textStylePoppins.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          departureAtIataCode,
          style: AppStyles.textStylePoppins.copyWith(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class TicketHeader extends StatelessWidget {
  const TicketHeader({
    super.key,
    required this.iconPath,
    required this.companyName,
    required this.formattedPrice,
  });

  final String iconPath;
  final String companyName;
  final String formattedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 35,
              height: 35,
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.fill,
                child: Image.network(
                  iconPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              width: 164,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Align(
                  child: Text(
                    companyName,
                    style: AppStyles.textStylePoppins.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          textAlign: TextAlign.center,
          formattedPrice,
          style: AppStyles.textStylePoppins.copyWith(
            color: const Color(0xff4B94F7),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
