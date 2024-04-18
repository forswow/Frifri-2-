import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui-kit/buttons/selection_item.dart';

import 'package:frifri/src/feature/more/presentation/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

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
    return RoundedListContainer(
      separator: defaultListDivider,
      children: [
        SelectionItemTile(title: "Тбилиси"),
        SelectionItemTile(title: "Кутаиси"),
        SelectionItemTile(title: "Батуми"),
      ],
    );
  }
}
