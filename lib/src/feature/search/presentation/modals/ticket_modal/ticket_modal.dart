import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/search/presentation/modals/ticket_modal/path_info_body.dart';
import 'package:frifri/src/feature/search/presentation/modals/ticket_modal/path_info_header.dart';
import 'package:frifri/src/feature/search/presentation/modals/ticket_modal/path_info_transfer.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_button.dart';

class TicketModal extends BottomSheetStatefulModalBase {
  TicketModal({required this.companyIconPath, required this.ticketPrice});

  final String ticketPrice;

  final String companyIconPath;

  @override
  State<BottomSheetStatefulModalBase> createState() {
    return TicketModalState(
        companyIconPath: companyIconPath, ticketPrice: ticketPrice);
  }
}

class TicketModalState extends BottomSheetStatefulModalBaseState {
  TicketModalState({required this.companyIconPath, required this.ticketPrice});

  final String companyIconPath;
  final String ticketPrice;

  @override
  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(46, 64, 46, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('TBS',
                  style: AppStyles.textStylePoppins
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600)),
              Text('Tbilisi', style: AppStyles.textStylePoppins),
            ],
          ),
          Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/avia-copy.svg',
                width: 150,
              ),
              Text("2h 45m",
                  style: AppStyles.textStylePoppins
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('TBS',
                  style: AppStyles.textStylePoppins
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600)),
              Text('Tbilisi', style: AppStyles.textStylePoppins),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
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
          ChooseflyButtonComponent(
            height: 50,
            text: "Купить билет за $ticketPrice ₽",
            callback: () {},
          ),
        ],
      ),
    );
  }
}
