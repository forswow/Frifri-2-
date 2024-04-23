import 'package:flutter/material.dart';

import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

class ConfidentialityModal extends BottomSheetStatelessModalBase {
  const ConfidentialityModal({super.key});

  static const TextStyle _listTileTextStyle = TextStyle(
    fontSize: 16.0,
  );

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 16,
  );

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Конфиденциальность",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        GestureDetector(
          onTap: () {},
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 16, right: 12),
            title: Text(
              "Политика конфидециальности",
              style: _listTileTextStyle,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 16, right: 12),
            title: Text(
              "Лицензионное соглашение",
              style: _listTileTextStyle,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
      ],
    );
  }
}
