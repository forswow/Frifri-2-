import 'package:flutter/material.dart';

class ChooseflyTextController extends StatelessWidget {
  const ChooseflyTextController({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffF1F3F8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            hintText: 'Поиск аэропорта/города',
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            )));
  }
}
