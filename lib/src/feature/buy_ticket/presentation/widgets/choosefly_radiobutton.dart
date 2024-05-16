import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RadioButton extends StatefulWidget {
  const RadioButton(
      {super.key, required this.callback, required this.isActive});
  final bool isActive;

  final VoidCallback callback;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.callback,
      icon: widget.isActive
          ? SvgPicture.asset('assets/icons/searchfly-radiobutton-active.svg')
          : SvgPicture.asset('assets/icons/searchfly-radiobutton.svg'),
    );
  }
}
