import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/slider/options_chips_card.dart';
import 'package:intl/intl.dart';

class HorizontalOptionsSlider extends StatelessWidget {
  const HorizontalOptionsSlider({super.key, required this.searchModel});

  final SearchModel searchModel;

  static const double _defaultChipsDefaultTextSize = 14;

  @override
  Widget build(BuildContext context) {
    final List cardsContent = <Widget>[
      ListenableBuilder(
        listenable: searchModel,
        builder: (context, child) {
          return Text(
            DateFormat("EEE, dd MMM").format(searchModel.departureDate!),
            style: AppStyles.textStylePoppins.copyWith(
              fontSize: _defaultChipsDefaultTextSize,
            ),
          );
        },
      ),
      ListenableBuilder(
        listenable: searchModel,
        builder: (context, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.flight,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                searchModel.isDirectFlightOnly
                    ? "Прямой перелёт"
                    : "С пересадками",
              ),
            ],
          );
        },
      ),
      Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.person,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "${searchModel.passengersAndClass!.passengers.adults}",
                style: AppStyles.textStylePoppins.copyWith(
                  fontSize: _defaultChipsDefaultTextSize,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.child_care,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "${searchModel.passengersAndClass!.passengers.children}",
                style: AppStyles.textStylePoppins.copyWith(
                  fontSize: _defaultChipsDefaultTextSize,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            tripClassToString(
              searchModel.passengersAndClass!.tripClass,
            ),
            style: AppStyles.textStylePoppins.copyWith(
              fontSize: _defaultChipsDefaultTextSize,
            ),
          ),
        ],
      )
    ];
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return OptionsChipsCard(
                cardContent: cardsContent[index],
              );
            },
            childCount: cardsContent.length,
          ),
        ),
      ],
    );
  }
}
