import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/theme/colors.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? title;
  final ValueChanged<T?> onChanged;
  final dynamic fill; // Color or LinearGradient

  const CustomRadioListTile({super.key, 
    required this.value,
    required this.groupValue,
    required this.onChanged,
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
    super.key,
    required this.isSelected,
    required this.fill,
  });

  final bool isSelected;
  final dynamic fill;

  @override
  Widget build(BuildContext context) {
    Color? color = fill.runtimeType == Color ? fill : null;
    LinearGradient? gradient = fill.runtimeType == LinearGradient ? fill : null;

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
