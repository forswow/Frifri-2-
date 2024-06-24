import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/extensions/formatters.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/shared/domain/entities/ticket_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_body.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_header.dart';
import 'package:frifri/src/core/helpers/url_launcher_helper.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_layover_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TicketModal extends StatelessWidget {
  const TicketModal({
    super.key,
    required this.ticketEntity,
  });

  final TicketEntity ticketEntity;

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          _TicketModalHeader(
            ticketEntity: ticketEntity,
          ),
          _TicketModalContent(
            ticketEntity: ticketEntity,
          ),
        ],
      ),
    );
  }
}

class _TicketModalContent extends StatefulWidget {
  const _TicketModalContent({
    required this.ticketEntity,
  });

  final TicketEntity ticketEntity;

  @override
  State<_TicketModalContent> createState() => __TicketModalContentState();
}

class __TicketModalContentState extends State<_TicketModalContent> {
  late final String ticketPrice;
  late final String companyIconPath;
  late final String formattedTicketPrice;

  late final TicketEntity ticketEntity;

  late final List<SegmentEntity> allSegments;

  @override
  void initState() {
    super.initState();

    ticketEntity = widget.ticketEntity;
    allSegments = ticketEntity.segmentsList;

    ticketPrice = ticketEntity.formattedPrice;
    companyIconPath = ticketEntity.segmentsList.first.airlineLogo;
    formattedTicketPrice = ticketEntity.formattedPrice;
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
                  padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffEDEDEE),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: List<Widget>.generate(
                      allSegments.length,
                      (index) => Column(
                        children: [
                          SegmentInfoHeader(
                            segmentEntity: allSegments[index],
                          ),
                          const SizedBox(height: 16),
                          SegmentInfoBody(
                            segmentEntity: allSegments[index],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (index <= allSegments.length - 2) ...[
                            SegmentLayoverInfo(
                              cityName:
                                  allSegments[index + 1].departureAirportName,
                              firstSegmentArrivalTimestamp:
                                  allSegments[index].arrivalTimestamp,
                              secondSegmentDepartureTimestamp:
                                  allSegments[index + 1].departureTimestamp,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              child: ConfirmationButton(
                onPressed: _onBookingPressed,
                child: Text(
                  "${AppLocalizations.of(context).buyATicketFor} $formattedTicketPrice",
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onBookingPressed() async {
    final bookingUrlResult = await Dependencies.of(context)
        .bookingDataSources
        .getABookingLink(
            searchId: ticketEntity.searchId, termsUrl: ticketEntity.termsUrl);

    final String url = bookingUrlResult.url;

    await UrlLauncherHelper.launchInWeb(url);
  }
}

class _TicketModalHeader extends StatelessWidget {
  const _TicketModalHeader({
    required this.ticketEntity,
  });

  final TicketEntity ticketEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(46, 64, 46, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    ticketEntity.originAirport.code,
                    style: AppStyles.textStylePoppins
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    ticketEntity.originAirport.name,
                    textAlign: TextAlign.right,
                    style: AppStyles.textStylePoppins,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/avia-copy.svg',
                width: 150,
              ),
              Text(
                formatMinutesToHoursAndMinutes(
                  ticketEntity.durationInMinutes,
                  AppLocalizations.of(context),
                ),
                style: AppStyles.textStylePoppins.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  ticketEntity.destinationAirport.code,
                  style: AppStyles.textStylePoppins.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ticketEntity.destinationAirport.name,
                  textAlign: TextAlign.right,
                  style: AppStyles.textStylePoppins,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
