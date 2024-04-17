import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  final DirectFligthsEntity directFligthsEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.16,
          width: MediaQuery.sizeOf(context).width,
          child: ColoredBox(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
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
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          AppLocalizations.of(context)!.flightCost,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '23 690 ₽',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: const Color.fromRGBO(75, 148, 247, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
