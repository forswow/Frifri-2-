import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

const TextStyle _listTileTextStyle = TextStyle(
  fontSize: 16.0,
);

const _defaultListDivider = Divider(
  height: 1,
  thickness: 0.5,
  indent: 16,
);

class ConfidentialityModal extends StatelessWidget {
  const ConfidentialityModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultModalWrapper(
      child: Column(
        children: [
          DefaultModalHeader(
            centerText: "Конфиденциальность",
          ),
          _ConfidentialityModalContent()
        ],
      ),
    );
  }
}

class _ConfidentialityModalContent extends StatelessWidget {
  const _ConfidentialityModalContent();

  @override
  Widget build(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        GestureDetector(
          onTap: () {},
          child: const ListTile(
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
          child: const ListTile(
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
