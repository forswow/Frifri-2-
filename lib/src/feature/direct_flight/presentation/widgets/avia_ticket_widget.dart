import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/direct_flight/domain/entities/direct_flights_entity.dart';
import 'package:frifri/src/feature/direct_flight/presentation/screens/direct_fligths_screen.dart';
import 'package:frifri/src/feature/direct_flight/presentation/widgets/country_text_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template direct_flights_screen}
/// AviaTicketWidget widget.
/// {@endtemplate}
class AviaTicketWidget extends StatelessWidget {
  /// {@macro direct_flights_screen}
  const AviaTicketWidget(
      {super.key, required this.directFligthsEntity, required this.index});

  static const _priceTextScaleFactor = 6.5;
  static const _aboutPriceTextScaleFactor = 4.40;

  final DirectFligthsEntity directFligthsEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    final _devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const CountryTextWidget(
                  title: 'TBS',
                  subTitle: 'Тбилиси',
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/avia copy.svg',
                        width: MediaQuery.sizeOf(context).width * 0.4,
                      ),
                      const Text('2ч 35м')
                    ],
                  ),
                ),
                const CountryTextWidget(
                    title: 'GYD',
                    subTitle: 'Баку',
                    crossAxisAlignment: CrossAxisAlignment.end)
              ],
            ),
          ),
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
                  AppLocalizations.of(context)!.flightCost,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: _devicePixelRatio * _aboutPriceTextScaleFactor,
                    color: kSecondaryTextColor,
                  ),
                ),
                Text(
                  '23 690 ₽',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: _devicePixelRatio * _priceTextScaleFactor,
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
