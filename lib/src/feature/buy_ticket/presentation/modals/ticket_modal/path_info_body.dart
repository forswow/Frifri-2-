import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/shared/domain/entities/ticket_entity.dart';
import 'package:intl/intl.dart';

class SegmentInfoBody extends StatelessWidget {
  const SegmentInfoBody({
    required this.segmentEntity,
    super.key,
  });

  final SegmentEntity segmentEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/circle-icon.svg',
                width: 12,
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: const Color(0xFFE4E9F3),
                ),
              ),
              SvgPicture.asset(
                'assets/icons/circle-icon.svg',
                width: 12,
              )
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            segmentEntity.departureTime,
                            style: AppStyles.textStylePoppins.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            DateFormat('EEE, dd MMM').format(
                              segmentEntity.departureDate,
                            ),
                            style: AppStyles.textStylePoppins.copyWith(
                              color: Colors.black45,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            segmentEntity.arrivalTime,
                            style: AppStyles.textStylePoppins.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            DateFormat('EEE, dd MMM')
                                .format(segmentEntity.arrivalDate),
                            style: AppStyles.textStylePoppins.copyWith(
                              color: Colors.black45,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          segmentEntity.departureCityName,
                          style: AppStyles.textStylePoppins.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          segmentEntity.departureAirportName,
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.black45,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          segmentEntity.arrivalCityName,
                          style: AppStyles.textStylePoppins.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          segmentEntity.arrivalAirportName,
                          style: AppStyles.textStylePoppins.copyWith(
                            color: Colors.black45,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
