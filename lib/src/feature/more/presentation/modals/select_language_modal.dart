import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui-kit/buttons/confirm_button.dart';

import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';

import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLanguageModal extends BottomSheetStatefulModalBase {
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return SelectLanguageModalState();
  }
}

class SelectLanguageModalState extends BottomSheetStatefulModalBaseState {
  static const _contentPadding = 24.0;
  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44,
  );

  late String initialLanguage;
  late String selectedLanguage;
  bool isConfirmButtonActive = false;

  @override
  void initState() {
    super.initState();
    initialLanguage = context.read<AppLanguageCubit>().state;
    selectedLanguage = initialLanguage;
  }

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Язык",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        CustomRadioListTile(
          value: "ENG",
          title: Text("English"),
          groupValue: selectedLanguage,
          onChanged: (newValue) {
            setState(() {
              selectedLanguage = newValue!;
              isConfirmButtonActive = selectedLanguage != initialLanguage;
            });
          },
        ),
        CustomRadioListTile(
          value: "GEO",
          title: Text("Georgian"),
          groupValue: selectedLanguage,
          onChanged: (newValue) {
            setState(
              () {
                selectedLanguage = newValue!;
                isConfirmButtonActive = selectedLanguage != initialLanguage;
              },
            );
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
          height: 48,
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
                        .selectNewLanguage(selectedLanguage);
                    context.pop();
                  }
                : null,
          ),
        ),
      ),
    ];
  }
}
