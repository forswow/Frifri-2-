import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Заменить
class SegmentLayoverInfo extends StatelessWidget {
  const SegmentLayoverInfo({
    super.key,
    required this.firstSegmentArrivalTimestamp,
    required this.secondSegmentDepartureTimestamp,
    required this.cityName,
  });

  //      __ duration __
  //     /              \
  //    /                \
  //  departure          arrival
  //  SEGMENT1           SEGMENT2

  final String cityName;
  final int firstSegmentArrivalTimestamp;
  final int secondSegmentDepartureTimestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(27, 14, 22, 12),
      decoration: const BoxDecoration(
        color: Color(0xF8F8F8F8),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 10,
            child: Text(
              ' ${AppLocalizations.of(context).transferTo} $cityName',
              textAlign: TextAlign.center,
              style: AppStyles.textStylePoppins.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SvgPicture.asset(
              height: 34,
              "assets/icons/walking.svg",
            ),
          ),
          Flexible(
            flex: 10,
            child: Text(
              computeLayoverDuration(
                firstSegmentArrivalTimestamp,
                secondSegmentDepartureTimestamp,
                context
              ),
              textAlign: TextAlign.center,
              style: AppStyles.textStylePoppins.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String computeLayoverDuration(int firstSegmentDepartureTimestamp,
      int secondSegmentArrivalTimestamp, BuildContext context) {
    final word = AppLocalizations.of(context);

    DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(
        firstSegmentDepartureTimestamp * 1000);
    DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(
        secondSegmentArrivalTimestamp * 1000);

    Duration difference = dateTime2.difference(dateTime1);

    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);

    String formattedDifference = '${hours}${word.hours}  ${minutes}${word.minutes}';

    return formattedDifference;
  }
}
