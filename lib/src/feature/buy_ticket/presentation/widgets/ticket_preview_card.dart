import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/ticket_modal.dart';
import 'package:intl/intl.dart';

class TicketPreviewCard extends StatefulWidget {
  const TicketPreviewCard({
    super.key,
    required this.companyName,
    required this.iconPath,
    required this.price,
    required this.time,
    required this.isLesserCost,
    required this.departureAtIataCode,
    required this.arrivalAtIataCode,
    required this.departureTime,
    required this.arrivalTime,
  });

  final String iconPath;
  final String companyName;
  final int price;
  final String time;
  final bool isLesserCost;

  final String departureAtIataCode;
  final String arrivalAtIataCode;

  final String departureTime;
  final String arrivalTime;

  @override
  State<TicketPreviewCard> createState() => _TicketPreviewCardState();
}

class _TicketPreviewCardState extends State<TicketPreviewCard> {
  late final String iconPath;
  late final String companyName;
  late final int price;
  late final String time;
  late final bool isLesserCost;

  late final String formattedPrice;
  late final String departureAtIataCode;
  late final String arrivalAtIataCode;
  late final String departureTime;
  late final String arrivalTime;

  @override
  void initState() {
    super.initState();

    iconPath = widget.iconPath;
    companyName = widget.companyName;
    price = widget.price;
    time = widget.time;
    isLesserCost = widget.isLesserCost;

    formattedPrice = NumberFormat("#,##0").format(price).replaceAll(",", " ");

    departureAtIataCode = widget.departureAtIataCode;
    arrivalAtIataCode = widget.arrivalAtIataCode;

    departureTime = widget.departureTime;
    arrivalTime = widget.arrivalTime;
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
                  ticketPrice: price,
                  companyIconPath: iconPath,
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
                            Text(
                              textAlign: TextAlign.center,
                              companyName,
                              style: AppStyles.textStylePoppins.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
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
                              "17ч 30м в пути",
                              style: AppStyles.textStylePoppins.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "1 пересадка VKO",
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
          isLesserCost
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
