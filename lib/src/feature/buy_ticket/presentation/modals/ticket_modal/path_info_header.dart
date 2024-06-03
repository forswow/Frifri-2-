import 'package:flutter/material.dart';
import 'package:frifri/src/core/extensions/formatters.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/ticket_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SegmentInfoHeader extends StatelessWidget {
  const SegmentInfoHeader({
    super.key,
    required this.segmentEntity,
  });

  final SegmentEntity segmentEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 32,
              height: 32,
              child: Image.network(
                segmentEntity.airlineLogo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Text>[
                Text(
                  segmentEntity.airlineName,
                  style: AppStyles.textStylePoppins
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  formatMinutesToHoursAndMinutes(
                    segmentEntity.durationInMinutes,
                    AppLocalizations.of(context),
                  ),
                  style: AppStyles.textStylePoppins.copyWith(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
