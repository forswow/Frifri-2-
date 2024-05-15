import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/search/presentation/modals/ticket_modal/ticket_modal.dart';

class TicketPreviewCard extends StatefulWidget {
  const TicketPreviewCard({
    required this.companyName,
    required this.iconPath,
    required this.price,
    required this.time,
    required this.isLesserCost,
  });

  final String iconPath;
  final String companyName;
  final String price;
  final String time;
  final bool isLesserCost;

  @override
  State<TicketPreviewCard> createState() => _TicketPreviewCardState();
}

class _TicketPreviewCardState extends State<TicketPreviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 132,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                builder: (context) => TicketModal(
                  ticketPrice: widget.price,
                  companyIconPath: widget.iconPath,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 122,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 22, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Image.asset(widget.iconPath),
                            SizedBox(
                              width: 8,
                            ),
                            Text(widget.companyName,
                                style: AppStyles.textStylePoppins.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                          ],
                        ),
                        Text(widget.price + ' ₽',
                            style: AppStyles.textStylePoppins.copyWith(
                                color: Color(0xff4B94F7),
                                fontWeight: FontWeight.w600,
                                fontSize: 16))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.time,
                            style: AppStyles.textStylePoppins.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 30,
                        ),
                        Text('17ч 30м в пути',
                            style: AppStyles.textStylePoppins
                                .copyWith(fontSize: 12)),
                      ],
                    ),
                    Row(children: [
                      Text('LED'),
                      SizedBox(width: 30),
                      Text("EAR"),
                      SizedBox(
                        width: 44,
                      ),
                      Text('1 пересадка VCO'),
                    ])
                  ],
                ),
              ),
            ),
          ),
          widget.isLesserCost
              ? Positioned(
                  left: 20,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 139,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'Самый дешевый',
                      style: AppStyles.textStylePoppins.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
