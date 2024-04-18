import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frifri/src/core/theme/colors.dart';

import 'package:frifri/src/core/ui-kit/painters/custom_checkbox.dart';
import 'package:frifri/src/feature/more/presentation/modals/base_modal.dart';

class SelectAirportModal extends BottomSheetModalBase {
  const SelectAirportModal({super.key});

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Аэропорт вылета",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return Container(
      child: _AirportSelectionList(),
    );
  }
}

class _AirportSelectionList extends StatelessWidget {
  const _AirportSelectionList({super.key});

  static const defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        border: Border.all(
          color: kBorderPrimaryColor,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: _AirportSelectionItem(airportTitle: "Тбилиси"),
          ),
          defaultListDivider,
          _AirportSelectionItem(airportTitle: "Кутаиси"),
          defaultListDivider,
          _AirportSelectionItem(airportTitle: "Батуми")
        ],
      ),
    );
  }
}

class _AirportSelectionItem extends StatelessWidget {
  const _AirportSelectionItem({required this.airportTitle, super.key});

  final String airportTitle;

  static const defaultTextStyle = TextStyle(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 12,
        right: 0,
      ),
      minLeadingWidth: 0,
      title: Text(
        airportTitle,
        style: defaultTextStyle,
      ),
      leading: const CustomCheckBox(),
    );
  }
}
