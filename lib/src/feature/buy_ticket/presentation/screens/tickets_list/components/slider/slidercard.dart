import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({super.key, required this.cardContent});

  final Widget cardContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      color: Colors.white,
      child: cardContent,
    );
  }
}
