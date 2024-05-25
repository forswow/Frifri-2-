import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/more/domain/airport_bloc.dart';
import 'package:frifri/src/feature/more/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

const _contentPadding = 22.0;
const _defaultListDivider = Divider(
  height: 1,
  thickness: 0.5,
  indent: 44.0,
);

class SelectAirportModal extends StatelessWidget {
  const SelectAirportModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          DefaultModalHeader(
            centerText: AppLocalizations.of(context).departureAirport,
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          _SelectAirportModalContent(),
        ],
      ),
    );
  }
}

class _SelectAirportModalContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectAirportModalContentState();
  }
}

class _SelectAirportModalContentState
    extends State<_SelectAirportModalContent> {
  late AirportEnum initialAirport;
  late AirportEnum selectedAirport;
  late bool isConfirmButtonEnabled;

  @override
  void initState() {
    super.initState();

    initialAirport = context.read<AirportCubit>().state;
    selectedAirport = initialAirport;
    isConfirmButtonEnabled = false;
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
                value: AirportEnum.tbilisi,
                title: Text(
                  // "Тбилиси",
                  AppLocalizations.of(context).cityTbilisi,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black,
                  ),
                ),
                groupValue: selectedAirport,
                onChanged: (newValue) {
                  setState(
                    () {
                      selectedAirport = newValue!;
                      isConfirmButtonEnabled =
                          selectedAirport != initialAirport;
                    },
                  );
                },
              ),
              CustomRadioListTile(
                value: AirportEnum.kutaisi,
                title: Text(
                  AppLocalizations.of(context).cityKutaisi,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black,
                  ),
                ),
                groupValue: selectedAirport,
                onChanged: (newValue) {
                  setState(
                    () {
                      selectedAirport = newValue!;
                      isConfirmButtonEnabled =
                          selectedAirport != initialAirport;
                    },
                  );
                },
              ),
              CustomRadioListTile(
                value: AirportEnum.batumi,
                title: Text(
                  AppLocalizations.of(context).cityBatumi,
                  style: AppStyles.textStylePoppins.copyWith(
                    color: Colors.black,
                  ),
                ),
                groupValue: selectedAirport,
                onChanged: (newValue) {
                  setState(
                    () {
                      selectedAirport = newValue!;
                      isConfirmButtonEnabled =
                          selectedAirport != initialAirport;
                    },
                  );
                },
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - _contentPadding * 2,
            height: 48,
            child: ConfirmationButton(
              onPressed: isConfirmButtonEnabled
                  ? () {
                      context
                          .read<AirportCubit>()
                          .selectAirport(selectedAirport);
                      context.pop();
                    }
                  : null,
              child: Text(
                AppLocalizations.of(context).confirm,
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
