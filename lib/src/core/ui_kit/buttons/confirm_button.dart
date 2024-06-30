import 'package:flutter/material.dart';
import 'package:frifri/src/core/theme/colors.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({required this.child, this.onPressed, super.key});

  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
