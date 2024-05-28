import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultModalHeader extends StatelessWidget {
  const DefaultModalHeader({required this.centerText, super.key});

  final String centerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                "assets/icons/close.svg",
                height: 21,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              centerText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
