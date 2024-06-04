import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/avit_ticket_entity.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/country_text_widget.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:frifri/src/core/extensions/formatters.dart';

/// {@template direct_flights_screen}
/// AviaTicketWidget widget.
/// {@endtemplate}
class AviaTicketWidget extends StatelessWidget {
  /// {@macro direct_flights_screen}
  const AviaTicketWidget(
      {super.key, required this.directFligthsEntity, required this.index});

  static const _priceTextScaleFactor = 6.5;
  static const _aboutPriceTextScaleFactor = 4.40;

  final DirectFlightEntity directFligthsEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final currency = context.watch<CurrencySettingsCubit>().state;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          /// -------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CountryTextWidget(
                title: directFligthsEntity.departureLocation,
                subTitle: directFligthsEntity.departureLocationIataCode,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/avia-copy.svg',
                        width: MediaQuery.sizeOf(context).width * 0.4,
                      ),
                      Text(
                        formatMinutesToHoursAndMinutes(
                          directFligthsEntity.flightTimeInMinutes,
                          AppLocalizations.of(context),
                        ),
                      ),
                      // Text(data.data.first.duration.toString()),
                    ],
                  ),
                ),
              ),
              CountryTextWidget(
                title: directFligthsEntity.placeOfArrival,
                subTitle: directFligthsEntity.placeOfArrivalIataCode,
                crossAxisAlignment: CrossAxisAlignment.end,
              )
            ],
          ),

          /// ------------------------
          FractionallySizedBox(
            widthFactor: 1,
            child: CustomPaint(
              painter: DashedLinePainter(),
              size: Size(
                MediaQuery.sizeOf(context).width,
                MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).flightCost,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: devicePixelRatio * _aboutPriceTextScaleFactor,
                    color: kSecondaryTextColor,
                  ),
                ),
                Text(
                  '${formatCurrencyWithSpaces(
                    directFligthsEntity.price,
                    currency,
                  )} ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: devicePixelRatio * _priceTextScaleFactor,
                    color: kPriceColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dashedlinePainter = Paint();
    dashedlinePainter.strokeWidth = 1.5;
    dashedlinePainter.style = PaintingStyle.stroke;
    dashedlinePainter.color = const Color.fromRGBO(165, 168, 176, 1);

    double dashWidth = 5;
    double dashSpace = 5;
    double startX = 20;
    double endX = size.width - 20;
    final path = Path();

    while (startX < endX) {
      path.moveTo(startX, size.height / 2);
      path.lineTo(startX + dashWidth, size.height / 2);
      startX += dashWidth + dashSpace;
    }

    final halfCirclePaint = Paint()
      ..color = const Color.fromRGBO(237, 239, 244, 1)
      ..style = PaintingStyle.fill;

    final halfCircleRadius = size.height / 1.5;

    final firstHalfCircleRect = Rect.fromCircle(
        center: Offset(0, size.height / 2), radius: halfCircleRadius);
    final secondHalfCircleRect = Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: halfCircleRadius);

    final firstHalfCirclePath = Path()
      ..moveTo(0, size.height / 2)
      ..arcTo(firstHalfCircleRect, -math.pi / 2, math.pi, false);

    final secondHalfCirclePath = Path()
      ..moveTo(size.width, size.height / 2)
      ..arcTo(secondHalfCircleRect, math.pi / 2, math.pi, false);

    canvas.drawPath(path, dashedlinePainter);
    canvas.drawPath(firstHalfCirclePath, halfCirclePaint);
    canvas.drawPath(secondHalfCirclePath, halfCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
