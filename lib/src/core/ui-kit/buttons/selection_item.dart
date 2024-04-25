import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui-kit/painters/custom_checkbox.dart';

class SelectionItemTile extends StatelessWidget {
  const SelectionItemTile({required this.title, super.key});

  final String title;

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
        title,
        style: defaultTextStyle,
      ),
      leading: const CustomCheckBox(),
    );
  }
}
