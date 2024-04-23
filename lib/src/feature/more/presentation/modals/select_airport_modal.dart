import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:frifri/src/core/ui-kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui-kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/core/ui-kit/modals/base_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAirportModal extends BottomSheetStatefulModalBase {
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return SelectAirportModalState();
  }
}

class SelectAirportModalState extends BottomSheetStatefulModalBaseState {
  static const _contentPadding = 22.0;
  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44.0,
  );

  late String initialAirport;
  late String selectedAirport;
  bool isConfirmButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    initialAirport = context.read<AirportCubit>().state;
    selectedAirport = initialAirport;
  }

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Аэропорт вылета",
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        CustomRadioListTile(
          value: "Tbilisi",
          title: Text("Тибилиси"),
          groupValue: selectedAirport,
          onChanged: (newValue) {
            setState(() {
              selectedAirport = newValue!;
              isConfirmButtonEnabled = selectedAirport != initialAirport;
            });
          },
        ),
        CustomRadioListTile(
          value: "Kutaisi",
          title: Text("Кутаиси"),
          groupValue: selectedAirport,
          onChanged: (newValue) {
            setState(() {
              selectedAirport = newValue!;
              isConfirmButtonEnabled = selectedAirport != initialAirport;
            });
          },
        ),
        CustomRadioListTile(
          value: "Batumi",
          title: Text("Батуми"),
          groupValue: selectedAirport,
          onChanged: (newValue) {
            setState(() {
              selectedAirport = newValue!;
              isConfirmButtonEnabled = selectedAirport != initialAirport;
            });
          },
        )
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
            onPressed: isConfirmButtonEnabled
                ? () {
                    context.read<AirportCubit>().selectAirport(selectedAirport);
                    context.pop();
                  }
                : null,
          ),
        ),
      ),
    ];
  }
}
