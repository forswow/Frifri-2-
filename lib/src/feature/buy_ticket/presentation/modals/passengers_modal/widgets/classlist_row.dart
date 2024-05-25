import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choose_fly_radiobutton.dart';

class ClasslistRow extends StatelessWidget {
  const ClasslistRow({
    super.key,
    required this.leadingText,
    required this.buttonIsActive,
  });
  final bool buttonIsActive;
  final String leadingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10), // Отступ слева
        RadioButton(isActive: buttonIsActive),
        Text(leadingText, style: AppStyles.textStylePoppins),
      ],
    );
  }
}
