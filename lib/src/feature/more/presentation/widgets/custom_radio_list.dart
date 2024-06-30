import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/theme/colors.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? title;
  final ValueChanged<T?> onChanged;
  final dynamic fill; // Color or LinearGradient

  const CustomRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
    this.title,
    this.fill = kPrimaryAppColor,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Feedback.forTap(context);
        onChanged(value);
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            RadioButtonCheck(
              isSelected: value == groupValue,
              fill: fill,
            ),
            const SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }
}

class RadioButtonCheck extends StatelessWidget {
  const RadioButtonCheck({
    required this.isSelected,
    required this.fill,
    super.key,
  });

  final bool isSelected;
  final dynamic fill;

  @override
  Widget build(BuildContext context) {
    final Color? color;
    if (fill.runtimeType == Color) {
      color = fill as Color?;
    } else {
      color = null;
    }
    final LinearGradient? gradient;
    if (fill.runtimeType == LinearGradient) {
      gradient = fill as LinearGradient?;
    } else {
      gradient = null;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: isSelected ? gradient : null,
        color: isSelected ? color : null,
        border: isSelected
            ? null
            : Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.12),
              ),
        borderRadius: BorderRadius.circular(100),
      ),
      height: 16,
      width: 16,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        child: isSelected ? SvgPicture.asset('assets/icons/action.svg') : null,
      ),
    );
  }
}
