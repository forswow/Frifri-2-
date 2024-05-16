import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({required this.cardContent});

  final Widget cardContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      color: Colors.white,
      child: cardContent,
    );
  }
}
