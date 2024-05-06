import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@template choose_location_widget}
/// CustomCheckBox widget.
/// {@endtemplate}
class CustomCheckBox extends StatefulWidget {
  /// {@macro choose_location_widget}
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        setState(
          () {
            active = !active;
          },
        );
      },
      child: Container(
        height: 16,
        width: 16,
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.5,
          child: active ? SvgPicture.asset('assets/icons/action.svg') : null,
        ),
        decoration: BoxDecoration(
          color: active ? Color.fromRGBO(227, 14, 5, 1) : Colors.transparent,
          border: active
              ? null
              : Border.all(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
