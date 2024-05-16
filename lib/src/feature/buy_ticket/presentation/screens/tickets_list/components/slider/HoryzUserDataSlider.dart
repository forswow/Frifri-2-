import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/tickets_list/components/slider/slidercard.dart';

class HoryzUserDataSlider extends StatelessWidget {
  const HoryzUserDataSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List cardsContent = <Widget>[
      const Text('Дата вылета'),
      const Row(
        children: <Widget>[
          Icon(Icons.add),
          Text(' обратно'),
        ],
      ),
      const Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.grey,
                size: 20,
              ),
              Text("ADULT PLACES"),
            ],
          ),
          Text(''),
          SizedBox(
            width: 6,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.child_care,
                color: Colors.grey,
                size: 20,
              ),
              Text("CHILD PLACES"),
            ],
          ),
          Text('FLIGHT CLASS'),
        ],
      )
    ];
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return OptionsChipsCard(
              cardContent: cardsContent[index],
            );
          }, childCount: cardsContent.length),
        ),
      ],
    );
  }
}
