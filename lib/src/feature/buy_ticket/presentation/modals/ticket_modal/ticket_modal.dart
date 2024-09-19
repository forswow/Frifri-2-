import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/extensions/formatters.dart';
import 'package:frifri/src/core/helpers/url_launcher_helper.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/flight_prices_modal.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_body.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_header.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/ticket_modal/path_info_layover_info.dart';
import 'package:frifri/src/feature/shared/domain/entities/ticket_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketModal extends StatelessWidget {
  const TicketModal({
    required this.ticketEntity,
    super.key,
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
                          if (index <= allSegments.length - 2 &&
                              !ticketEntity.isDirect) ...[
                            if (allSegments[index + 1].departureCityName ==
                                ticketEntity.destinationAirport.name) ...[
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(27, 14, 22, 12),
                                  decoration: const BoxDecoration(
                                    color: Color(0xF8F8F8F8),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Text(
                                            AppLocalizations.of(context).back,
                                            textAlign: TextAlign.center,
                                            style: AppStyles.textStylePoppins
                                                .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.6),
                                            ),
                                          ),
                                        ),
                                      ]))
                            ] else ...[
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
                  '${AppLocalizations.of(context).buyATicketFor} $formattedTicketPrice',
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

  Future<void> _onBookingPressed() async {
    final bookingUrlResult = await Dependencies.of(context)
        .bookingDataSources
        .getABookingLink(
            searchId: ticketEntity.searchId, termsUrl: ticketEntity.termsUrl);

    final String url = bookingUrlResult.url;
    unawaited(showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => FullTicketInfoDialog(
        ticketEntity: ticketEntity,
      ),
    ));
    await Future.delayed(const Duration(seconds: 2), () async {
      await UrlLauncherHelper.launchInWeb(url)
          .whenComplete(() async => Future.delayed(
                const Duration(milliseconds: 200),
                () => Navigator.of(context).pop(),
              ));
    });
  }
}

class FullTicketInfoDialog extends StatelessWidget {
  const FullTicketInfoDialog({
    required this.ticketEntity,
    super.key,
  });
  final TicketEntity ticketEntity;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: const Color(0xffF1F3F8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/Illustration.svg'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Переход для покупки\n',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 24 / 16),
                      ),
                      TextSpan(
                        text:
                            '${ticketEntity.originAirport.name} - ${ticketEntity.destinationAirport.name}\n',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 24 / 16),
                      ),
                      TextSpan(
                          text: ticketEntity.formattedPrice,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4B94F7),
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 76),
            child: Text(
              'Проверьте правильность цены и деталей перелета перед бронированием.',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 14 / 10,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
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
      child: Column(
        children: [
          ...ticketEntity.segmentsList.mapIndexed((index, segment) {
            if (!ticketEntity.isDirect && index != 0) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(top: index != 0 ? 4 : 0),
              child: _TicketModalSubHeader(
                segment: segment,
                originCode:
                    ticketEntity.originAirport.name == segment.departureCityName
                        ? ticketEntity.originAirport.code
                        : ticketEntity.destinationAirport.code,
                destinationCode: ticketEntity.destinationAirport.name ==
                        segment.departureCityName
                    ? ticketEntity.originAirport.code
                    : ticketEntity.destinationAirport.code,
                isDirect: ticketEntity.isDirect
                    ? (ticketEntity.isDirect && index == 0)
                    : !ticketEntity.isDirect,
              ),
            );
          })
        ],
      ),
    );
  }
}

class _TicketModalSubHeader extends StatelessWidget {
  const _TicketModalSubHeader({
    required this.segment,
    required this.isDirect,
    required this.originCode,
    required this.destinationCode,
  });

  final SegmentEntity segment;
  final bool isDirect;
  final String originCode;
  final String destinationCode;
  @override
  Widget build(BuildContext context) {
    return Row(
      //  crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                child: Text(
                  originCode,
                  style: AppStyles.textStylePoppins
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              FittedBox(
                child: Text(
                  segment.departureCityName,
                  textAlign: TextAlign.right,
                  style: AppStyles.textStylePoppins,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Transform.rotate(
              angle: !isDirect ? 3.14 : 0,
              child: SvgPicture.asset(
                'assets/icons/avia-copy.svg',
                width: 150,
              ),
            ),
            if (!isDirect)
              const SizedBox(
                height: 4,
              )
            else
              const SizedBox.shrink(),
            Text(
              formatMinutesToHoursAndMinutes(
                segment.durationInMinutes,
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
                destinationCode,
                style: AppStyles.textStylePoppins.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                segment.arrivalCityName,
                textAlign: TextAlign.right,
                style: AppStyles.textStylePoppins,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
