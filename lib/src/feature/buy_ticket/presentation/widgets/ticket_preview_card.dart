import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/ticket_modal.dart';
import 'package:intl/intl.dart';

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
  late final int price;
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
    price = ticketEntity.price;
    time = ticketEntity.flightDuration;
    departureAtIataCode = ticketEntity.originAirport.code;
    arrivalAtIataCode = ticketEntity.destinationAirport.code;
    departureTime = ticketEntity.segmentsList.first.departureTime;

    arrivalTime = ticketEntity.segmentsList.last.arrivalTime;
    countOfTransfers = ticketEntity.segmentsList.length;

    formattedPrice = NumberFormat("#,##0").format(price).replaceAll(",", " ");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 132,
      child: Stack(
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
                padding: const EdgeInsets.fromLTRB(24, 23, 24, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
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
                              width: 180,
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  companyName,
                                  style: AppStyles.textStylePoppins.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          '$formattedPrice ₽',
                          style: AppStyles.textStylePoppins.copyWith(
                            color: const Color(0xff4B94F7),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ----------- Нижняя часть билета
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
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
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          " - ",
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
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
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              time,
                              style: AppStyles.textStylePoppins.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Количество пересадок: $countOfTransfers",
                              style: AppStyles.textStylePoppins.copyWith(
                                color: Colors.grey,
                              ),
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
                  left: 20,
                  top: -10,
                  child: Container(
                    alignment: Alignment.center,
                    width: 139,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'Самый дешевый',
                      style: AppStyles.textStylePoppins.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
