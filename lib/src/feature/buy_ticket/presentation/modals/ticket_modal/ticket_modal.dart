import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_body.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_header.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_transfer.dart';
import 'package:intl/intl.dart';

class TicketModal extends StatelessWidget {
  const TicketModal({
    required this.ticketPrice,
    required this.companyIconPath,
  });

  final int ticketPrice;
  final String companyIconPath;

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(children: [
        _TicketModalHeader(),
        _TicketModalContent(
          ticketPrice: ticketPrice,
          companyIconPath: companyIconPath,
        )
      ]),
    );
  }
}

class _TicketModalContent extends StatefulWidget {
  const _TicketModalContent({
    required this.ticketPrice,
    required this.companyIconPath,
  });

  final int ticketPrice;
  final String companyIconPath;

  @override
  State<_TicketModalContent> createState() => __TicketModalContentState();
}

class __TicketModalContentState extends State<_TicketModalContent> {
  late final int ticketPrice;
  late final String companyIconPath;

  late final String formattedTicketPrice;

  @override
  void initState() {
    super.initState();

    ticketPrice = widget.ticketPrice;
    companyIconPath = widget.companyIconPath;

    formattedTicketPrice =
        NumberFormat("#,##0").format(ticketPrice).replaceAll(",", " ");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 17, 16, 0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffEDEDEE)),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: <Widget>[
                      PathInfoHeader(companyIconPath: companyIconPath),
                      SizedBox(height: 16),
                      PathInfoBody(),
                      SizedBox(height: 20),
                      PathInfoTransfer(),
                      SizedBox(
                        height: 20,
                      ),
                      PathInfoHeader(companyIconPath: companyIconPath),
                      SizedBox(height: 16),
                      PathInfoBody(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ConfirmationButton(
              child: Text(
                "Подтвердить покупку билета",
                style: AppStyles.textStylePoppins.copyWith(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _TicketModalHeader extends StatelessWidget {
  const _TicketModalHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(46, 64, 46, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'TBS',
                style: AppStyles.textStylePoppins
                    .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                'Tbilisi',
                style: AppStyles.textStylePoppins,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/avia-copy.svg',
                width: 150,
              ),
              Text(
                "2h 45m",
                style: AppStyles.textStylePoppins.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'TBS',
                style: AppStyles.textStylePoppins.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Tbilisi',
                style: AppStyles.textStylePoppins,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
