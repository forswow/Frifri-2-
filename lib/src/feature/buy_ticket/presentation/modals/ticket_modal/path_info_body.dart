import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:intl/intl.dart';

class PathInfoBody extends StatelessWidget {
  const PathInfoBody({
    super.key,
    required this.segmentEntity,
  });

  final SegmentEntity segmentEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/circle-icon.svg',
              width: 18,
            ),
            Container(
              width: 2,
              height: 50,
              color: const Color(0xFFE4E9F3),
            ),
            SvgPicture.asset(
              'assets/icons/circle-icon.svg',
              width: 18,
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  segmentEntity.departureTime,
                  style: AppStyles.textStylePoppins.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  DateFormat("EEE, dd MMM").format(segmentEntity.departureDate),
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black45,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  segmentEntity.arrivalTime,
                  style: AppStyles.textStylePoppins.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  DateFormat("EEE, dd MMM").format(segmentEntity.arrivalDate),
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black45,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 180,
                  child: Text(
                    segmentEntity.departureCityName,
                    style: AppStyles.textStylePoppins.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    segmentEntity.departureAirportName,
                    style: AppStyles.textStylePoppins.copyWith(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 180,
                  child: Text(
                    segmentEntity.arrivalCityName,
                    style: AppStyles.textStylePoppins.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    segmentEntity.arrivalAirportName,
                    style: AppStyles.textStylePoppins.copyWith(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
