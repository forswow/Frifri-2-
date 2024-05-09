import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CounterButton extends StatelessWidget {
  const CounterButton(
      {super.key, required this.symbol, required this.callback});
  final String symbol;
  final callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffEBF3FD), borderRadius: BorderRadius.circular(12)),
        child: SvgPicture.asset(
          'assets/icons/search-$symbol-icon.svg',
        ),
      ),
    );
  }
}
