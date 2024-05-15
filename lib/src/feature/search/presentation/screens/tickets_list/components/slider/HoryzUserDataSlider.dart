import 'package:flutter/material.dart';
import 'package:frifri/src/feature/search/presentation/screens/tickets_list/components/slider/slidercard.dart';

class HoryzUserDataSlider extends StatelessWidget {
  HoryzUserDataSlider({required this.passengerData});

  final passengerData;

  @override
  Widget build(BuildContext context) {
    final List cardsContent = <Widget>[
      Text('Дата вылета'),
      Row(
        children: <Widget>[
          Icon(Icons.add),
          Text(' обратно'),
        ],
      ),
      Row(
        children: <Widget>[
          passengerData['adultPlaces'] > 0
              ? Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(passengerData['adultPlaces'].toString()),
                  ],
                )
              : Text(''),
          SizedBox(
            width: 6,
          ),
          passengerData['childPlaces'] > 0
              ? Row(
                  children: <Widget>[
                    Icon(
                      Icons.child_care,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(passengerData['childPlaces'].toString()),
                  ],
                )
              : Text(""),
          passengerData['flyClass'] != ''
              ? Text(', ${passengerData['flyClass']} ')
              : Text('')
        ],
      )
    ];
    print(passengerData);
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return SliderCard(
              cardContent: cardsContent[index],
            );
          }, childCount: cardsContent.length),
        ),
      ],
    );
  }
}
