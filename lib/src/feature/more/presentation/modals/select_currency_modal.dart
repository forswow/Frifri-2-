import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:frifri/src/core/ui-kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectCurrencyModal extends BottomSheetStatefulModalBase {
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return SelectCurrencyModalState();
  }
}

class SelectCurrencyModalState extends BottomSheetStatefulModalBaseState {
  static const _contentPadding = 22;
  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44,
  );

  late String initialCurrency;
  late String selectedCurrency;

  bool isConfirmButtonActive = false;

  @override
  void initState() {
    super.initState();
    initialCurrency = context.read<CurrencyCubit>().state;
    selectedCurrency = initialCurrency;
  }

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Валюта",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        CustomRadioListTile(
          value: "USD",
          title: Text("Доллары"),
          groupValue: selectedCurrency,
          onChanged: (newValue) {
            setState(() {
              selectedCurrency = newValue!;
              isConfirmButtonActive = selectedCurrency != initialCurrency;
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
              isConfirmButtonActive = selectedCurrency != initialCurrency;
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
              isConfirmButtonActive = selectedCurrency != initialCurrency;
            });
          },
        ),
      ],
    );
  }

  @override
  List<Widget> build_overlay(BuildContext context) {
    return [
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width - _contentPadding * 2,
          child: ConfirmationButton(
            child: Text(
              AppLocalizations.of(context)!.confirm,
              style: GoogleFonts.inter(
                color: Colors.white,
              ),
            ),
            onPressed: isConfirmButtonActive
                ? () {
                    context
                        .read<AppLanguageCubit>()
                        .selectNewLanguage(selectedCurrency);
                    context.pop();
                  }
                : null,
          ),
        ),
      ),
    ];
  }
}
