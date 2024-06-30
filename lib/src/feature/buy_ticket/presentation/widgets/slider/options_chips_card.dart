import 'package:flutter/material.dart';

class OptionsChipsCard extends StatelessWidget {
  const OptionsChipsCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      child: child,
    );
  }
}
