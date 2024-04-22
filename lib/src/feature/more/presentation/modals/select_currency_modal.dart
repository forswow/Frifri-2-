import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui-kit/buttons/selection_item.dart';

import 'package:frifri/src/feature/more/presentation/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

class SelectCurrencyModal extends BottomSheetModalBase {
  const SelectCurrencyModal({super.key});

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Валюта",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return _CurrencySelectionList();
  }
}

class _CurrencySelectionList extends StatefulWidget {
  const _CurrencySelectionList({super.key});

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44,
  );

  @override
  State<_CurrencySelectionList> createState() => _CurrencySelectionListState();
}

class _CurrencySelectionListState extends State<_CurrencySelectionList> {
  String selectedCurrency = "USD";

  @override
  Widget build(BuildContext context) {
    return RoundedListContainer(
      separator: _CurrencySelectionList._defaultListDivider,
      children: [
        CustomRadioListTile(
          value: "USD",
          title: Text("Доллары"),
          groupValue: selectedCurrency,
          onChanged: (newValue) {
            setState(() {
              selectedCurrency = newValue!;
            });
          },
        ),
        CustomRadioListTile(
          value: "EUR",
          title: Text("Евро"),
          groupValue: selectedCurrency,
          onChanged: (newValue) {
            setState(() {
              selectedCurrency = newValue!;
            });
          },
        ),
        CustomRadioListTile(
          value: "LAR",
          title: Text("Лари"),
          groupValue: selectedCurrency,
          onChanged: (newValue) {
            setState(() {
              selectedCurrency = newValue!;
            });
          },
        ),
      ],
    );
  }
}
