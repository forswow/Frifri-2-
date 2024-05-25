import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseflyTextController extends StatelessWidget {
  const ChooseflyTextController({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF1F3F8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        hintText: AppLocalizations.of(context).airportCitySearch,
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
        ),
      ),
    );
  }
}
