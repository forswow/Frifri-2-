import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({required this.isActive, super.key});
  final bool isActive;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? SvgPicture.asset('assets/icons/searchfly-radiobutton-active.svg')
        : SvgPicture.asset('assets/icons/searchfly-radiobutton.svg');
  }
}
