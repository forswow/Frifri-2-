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
        url: url,
        ticketEntity: ticketEntity,
      ),
    ));
    await Future.delayed(const Duration(seconds: 5), () async {
      await UrlLauncherHelper.launchInWeb(url)
          .whenComplete(() async => Future.delayed(
                const Duration(milliseconds: 200),
                () => Navigator.of(context).pop(),
              ));
    });
  }
}

String _formatDomain(String url) {
  // Удаляем протокол (http:// или https://)
  String domain = url.replaceFirst(RegExp(r'^(https?://)?(www\.)?'), '');

  // Извлекаем доменное имя до первого слэша или вопросительного знака
  domain = domain.split(RegExp(r'[/\?]')).first;
  //domain = parts.first; // Получаем только доменное имя

  // Заменяем дефисы на пробелы
  domain = domain.replaceAll('-', ' ');

  // Приводим к нужному формату: первая буква каждого слова заглавная
  final List<String> domainParts = domain.split('.');
  final String formattedDomain = domainParts
      .map((part) => part
          .split(' ')
          .map(
              (word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
          .join(' '))
      .join('.');

  return formattedDomain;
}

class FullTicketInfoDialog extends StatelessWidget {
  const FullTicketInfoDialog({
    required this.ticketEntity,
    required this.url,
    super.key,
  });
  final TicketEntity ticketEntity;
  final String url;

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
                        text: '${_formatDomain(url)}\n\n',
                        // '${ticketEntity.originAirport.name} - ${ticketEntity.destinationAirport.name}\n',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 24 / 16,
                        ),
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
                height: 20 / 10,
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
      child: Column(children: _buildFragment(ticketEntity)),
    );
  }
}

List<Widget> _buildFragment(TicketEntity ticketEntity) {
  if (ticketEntity.isDirect) {
    return ticketEntity.segmentsList
        .mapIndexed(
          (index, segment) => _buildTicket(
              originCode:
                  ticketEntity.originAirport.name == segment.departureCityName
                      ? ticketEntity.originAirport.code
                      : ticketEntity.destinationAirport.code,
              departureCityName: segment.departureCityName,
              destinationCode: ticketEntity.destinationAirport.name ==
                      segment.arrivalCityName
                  ? ticketEntity.destinationAirport.code
                  : ticketEntity.originAirport.code,
              arrivalCityName: segment.arrivalCityName,
              durationInMinutes: _getdurationInMinutes(ticketEntity),
              isDirect: ticketEntity.isDirect
                  ? (ticketEntity.isDirect && index == 0)
                  : !ticketEntity.isDirect,
              top: index != 0 ? 34 : 0),
        )
        .toList();
  } else {
    int firstDurationInMinutes = 0;
    int lastDurationInMinutes = 0;
    String firstOriginCode = '';
    String firstDestinationCode = '';
    String lastOriginCode = '';
    String lastDestinationCode = '';
    String currentArrivalCity = '';
    int exitIndex = 0;

    for (int i = 0; i < ticketEntity.segmentsList.length; i++) {
      final segment = ticketEntity.segmentsList[i];
      currentArrivalCity = segment.departureCityName;

      if (currentArrivalCity != ticketEntity.destinationAirport.name) {
        firstDurationInMinutes += segment.durationInMinutes;
        firstOriginCode = ticketEntity.originAirport.code;

        firstDestinationCode = ticketEntity.destinationAirport.code;
        exitIndex = i;
      } else {
        break;
      }
    }

    for (int i = exitIndex + 1; i < ticketEntity.segmentsList.length; i++) {
      final segment = ticketEntity.segmentsList[i];
      lastOriginCode = ticketEntity.originAirport.code;

      lastDestinationCode = ticketEntity.destinationAirport.code;

      lastDurationInMinutes += segment.durationInMinutes;
    }
    return [
      _buildTicket(
        durationInMinutes: firstDurationInMinutes,
        departureCityName: ticketEntity.originAirport.name,
        arrivalCityName: ticketEntity.destinationAirport.name,
        originCode: firstOriginCode,
        destinationCode: firstDestinationCode,
        isDirect: true,
        top: 0,
      ),
      if (lastOriginCode.isNotEmpty)
        _buildTicket(
          durationInMinutes: lastDurationInMinutes,
          departureCityName: ticketEntity.originAirport.name,
          arrivalCityName: ticketEntity.destinationAirport.name,
          originCode: lastOriginCode,
          destinationCode: lastDestinationCode,
          isDirect: false,
          top: 34,
        ),
    ];
  }
}

Widget _buildTicket({
  required String departureCityName,
  required String arrivalCityName,
  required String originCode,
  required String destinationCode,
  required bool isDirect,
  required int durationInMinutes,
  required double top,
}) =>
    Padding(
      padding: EdgeInsets.only(top: top),
      child: _TicketModalSubHeader(
        originCode: originCode,
        destinationCode: destinationCode,
        isDirect: isDirect,
        departureCityName: departureCityName,
        durationInMinutes: durationInMinutes,
        arrivalCityName: arrivalCityName,
      ),
    );

int _getdurationInMinutes(TicketEntity ticketEntity) {
  int durationInMinutes = 0;
  for (int i = 0; i < ticketEntity.segmentsList.length; i++) {
    final segment = ticketEntity.segmentsList[i];

    final currentArrivalCity = segment.departureCityName;

    if (currentArrivalCity != ticketEntity.destinationAirport.name) {
      durationInMinutes += segment.durationInMinutes;
    } else {
      break;
    }
  }
  return durationInMinutes;
}

class _TicketModalSubHeader extends StatelessWidget {
  const _TicketModalSubHeader({
    required this.isDirect,
    required this.originCode,
    required this.destinationCode,
    required this.departureCityName,
    required this.durationInMinutes,
    required this.arrivalCityName,
  });

  final bool isDirect;
  final String originCode;
  final String destinationCode;
  final String departureCityName;
  final int durationInMinutes;
  final String arrivalCityName;
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
                  departureCityName,
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
              angle: 0,
              child: SvgPicture.asset(
                !isDirect
                    ? 'assets/icons/avia-reverse.svg'
                    : 'assets/icons/avia-copy.svg',
                width: 150,
                height: 32,
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
                durationInMinutes,
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
                arrivalCityName,
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
