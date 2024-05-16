import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/currency_bloc.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

const _contentPadding = 22;
const _defaultListDivider = Divider(
  height: 1,
  thickness: 0.5,
  indent: 44,
);

class SelectCurrencyModal extends StatelessWidget {
  const SelectCurrencyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          const DefaultModalHeader(
            centerText: "Валюта",
          ),
          _SelectCurrencyModalContent(),
        ],
      ),
    );
  }
}

class _SelectCurrencyModalContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectCurrencyModalContentState();
  }
}

class _SelectCurrencyModalContentState
    extends State<_SelectCurrencyModalContent> {
  late String initialCurrency;
  late String selectedCurrency;
  late bool isConfirmButtonActive;

  @override
  void initState() {
    super.initState();

    initialCurrency = context.read<CurrencyCubit>().state;
    selectedCurrency = initialCurrency;
    isConfirmButtonActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RoundedListContainer(
            separator: _defaultListDivider,
            children: [
              CustomRadioListTile(
                value: "USD",
                title: const Text("Доллары"),
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
                title: const Text("Евро"),
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
                title: const Text("Лари"),
                groupValue: selectedCurrency,
                onChanged: (newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                    isConfirmButtonActive = selectedCurrency != initialCurrency;
                  });
                },
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - _contentPadding * 2,
            height: 48,
            child: ConfirmationButton(
              onPressed: isConfirmButtonActive
                  ? () {
                      context
                          .read<CurrencyCubit>()
                          .selectCurrency(selectedCurrency);
                      context.pop();
                    }
                  : null,
              child: Text(
                AppLocalizations.of(context)!.confirm,
                style: GoogleFonts.inter(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
