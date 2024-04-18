import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui-kit/buttons/selection_item.dart';

import 'package:frifri/src/feature/more/presentation/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

class SelectLanguageModal extends BottomSheetModalBase {
  const SelectLanguageModal({super.key});

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Язык",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return _LanguageSelectionList();
  }
}

class _LanguageSelectionList extends StatelessWidget {
  const _LanguageSelectionList({super.key});

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44,
  );

  @override
  Widget build(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        SelectionItemTile(title: "English"),
        SelectionItemTile(title: "Georgian"),
        SelectionItemTile(title: "Russian"),
      ],
    );
  }
}
