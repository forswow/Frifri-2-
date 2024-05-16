import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choosefly_radiobutton.dart';

class ClasslistRow extends StatelessWidget {
  const ClasslistRow(
      {super.key,
      required this.leadingText,
      required this.callback,
      required this.buttonIsActive});
  final bool buttonIsActive;
  final callback;
  final String leadingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 10), // Отступ слева
        RadioButton(callback: callback, isActive: buttonIsActive),
        Text(leadingText, style: AppStyles.textStylePoppins),
      ],
    );
  }
}
