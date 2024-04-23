import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';

import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

class SelectCurrencyModal extends BottomSheetStatelessModalBase {
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
  late String selectedCurrency;

  @override
  void initState() {
    super.initState();
    selectedCurrency = context.read<CurrencyCubit>().state;
  }

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
              context.read<CurrencyCubit>().selectCurrency(newValue);
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
              context.read<CurrencyCubit>().selectCurrency(newValue);
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
              context.read<CurrencyCubit>().selectCurrency(newValue);
            });
          },
        ),
      ],
    );
  }
}
