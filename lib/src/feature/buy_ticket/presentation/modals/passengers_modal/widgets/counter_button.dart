import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffEBF3FD),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
