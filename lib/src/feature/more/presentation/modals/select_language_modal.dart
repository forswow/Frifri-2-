import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';

import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

class SelectLanguageModal extends BottomSheetStatelessModalBase {
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

class _LanguageSelectionList extends StatefulWidget {
  const _LanguageSelectionList({super.key});

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44,
  );

  @override
  State<_LanguageSelectionList> createState() => _LanguageSelectionListState();
}

class _LanguageSelectionListState extends State<_LanguageSelectionList> {
  late String currentLanguage;

  @override
  void initState() {
    super.initState();
    currentLanguage = context.read<AppLanguageCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedListContainer(
      separator: _LanguageSelectionList._defaultListDivider,
      children: [
        CustomRadioListTile(
          value: "ENG",
          title: Text("English"),
          groupValue: currentLanguage,
          onChanged: (newValue) {
            setState(() {
              currentLanguage = newValue!;
              context
                  .read<AppLanguageCubit>()
                  .selectNewLanguage(currentLanguage);
            });
          },
        ),
        CustomRadioListTile(
          value: "GEO",
          title: Text("Georgian"),
          groupValue: currentLanguage,
          onChanged: (newValue) {
            setState(
              () {
                currentLanguage = newValue!;
                context
                    .read<AppLanguageCubit>()
                    .selectNewLanguage(currentLanguage);
              },
            );
          },
        ),
      ],
    );
  }
}
