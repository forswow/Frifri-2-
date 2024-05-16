import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/more/presentation/widgets/custom_radio_list.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/passengers_modal/components/counter.dart';

const _checkboxGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0594, 1.23528],
  colors: [
    Color.fromRGBO(91, 156, 236, 1),
    Color.fromRGBO(170, 208, 255, 1),
  ],
);

class PassengersModal extends StatelessWidget {
  const PassengersModal({super.key, 
    this.adultPassengersCount = 1,
    this.childCount = 0,
    this.flightClass = "",
  });

  final int adultPassengersCount;
  final int childCount;
  final String? flightClass;

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          DefaultModalHeader(
            centerText: AppLocalizations.of(context)!.passengersAndClass,
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
          // Модалка <--------------
          _PassengersModalContent(
            adultPassengersCount: adultPassengersCount,
            childCount: childCount,
            flightClass: flightClass,
          ),
        ],
      ),
    );
  }
}

class _PassengersModalContent extends StatefulWidget {
  const _PassengersModalContent({
    required this.adultPassengersCount,
    required this.childCount,
    required this.flightClass,
  });

  final int adultPassengersCount;
  final int childCount;
  final String? flightClass;

  @override
  State<StatefulWidget> createState() {
    return _PassengersModalContentState();
  }
}

class _PassengersModalContentState extends State<_PassengersModalContent> {
  late int adultPassengersCount;
  late int childCount;
  late String? flightClass;

  @override
  void initState() {
    super.initState();

    adultPassengersCount = widget.adultPassengersCount;
    childCount = widget.childCount;
    flightClass = widget.flightClass;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Counter(
                      onCountChange: updateOldCount,
                      count: adultPassengersCount,
                      titleText: AppLocalizations.of(context)!.adults,
                      limit: 9,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Counter(
                      titleText: AppLocalizations.of(context)!.children,
                      count: childCount,
                      onCountChange: updateChildCount,
                      limit: 6,
                    ),
                    RoundedListContainer(
                      children: [
                        CustomRadioListTile<String?>(
                          fill: _checkboxGradientColor,
                          value: "Эконом",
                          title: const Text("Эконом"),
                          groupValue: flightClass,
                          onChanged: updateFlightClass,
                        ),
                        CustomRadioListTile<String?>(
                          fill: _checkboxGradientColor,
                          value: "Комфорт",
                          title: const Text("Комфорт"),
                          groupValue: flightClass,
                          onChanged: updateFlightClass,
                        ),
                        CustomRadioListTile<String?>(
                          fill: _checkboxGradientColor,
                          value: "Первый",
                          title: const Text("Первый"),
                          groupValue: flightClass,
                          onChanged: updateFlightClass,
                        ),
                        CustomRadioListTile<String?>(
                          fill: _checkboxGradientColor,
                          value: "Бизнес",
                          title: const Text("Бизнес"),
                          groupValue: flightClass,
                          onChanged: updateFlightClass,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ConfirmationButton(
              onPressed: isConfirmationButtonActive ? commitUserChoice : null,
              child: Text(
                AppLocalizations.of(context)!.confirm,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void commitUserChoice() {
    Navigator.pop(context, [adultPassengersCount, childCount, flightClass]);
  }

  void updateChildCount(int childCount) {
    setState(() {
      this.childCount = childCount;
    });
  }

  void updateOldCount(int oldCount) {
    setState(() {
      adultPassengersCount = oldCount;
    });
  }

  void updateFlightClass(String? newFlightClass) {
    setState(() {
      flightClass = newFlightClass;
    });
  }

  bool get isConfirmationButtonActive {
    return adultPassengersCount > 0 && flightClass != null;
  }
}
