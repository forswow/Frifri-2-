import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/search/presentation/modals/passengers_modal/components/classlist.dart';
import 'package:frifri/src/feature/search/presentation/modals/passengers_modal/components/counter.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_button.dart';
import 'package:go_router/go_router.dart';

class PassengersModal extends BottomSheetStatefulModalBase {
  PassengersModal({required this.passengersData});

  Map passengersData;
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return PassengersModalState(data: passengersData);
  }
}

class PassengersModalState extends BottomSheetStatefulModalBaseState {
  Map data;

  PassengersModalState({required this.data}) : super();

  callbackForRadioButton(String value) {
    if (classGrade == value) {
      classGrade = '';
      return;
    }
    this.classGrade = value;
  }

  int oldCount = 0;
  int childCount = 0;
  String classGrade = '';

  void updateChildCount(int childCount) {
    setState(() {
      this.childCount = childCount;
    });
  }

  void updateOldCount(int oldCount) {
    setState(() {
      this.oldCount = oldCount;
    });
  }

  @override
  void initState() {
    print(data);
    oldCount = data['oldCount'];
    childCount = data['childCount'];

    super.initState();
  }

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: AppLocalizations.of(context)!.passengersAndClass,
    );
  }

  @override
  Widget build_content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
      child: Stack(alignment: Alignment.topCenter, children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CounterWidget(
                  onCountChange: updateOldCount,
                  count: oldCount,
                  titleText: AppLocalizations.of(context)!.adults,
                  limit: 9),
              SizedBox(
                height: 24,
              ),
              CounterWidget(
                titleText: AppLocalizations.of(context)!.children,
                count: childCount,
                onCountChange: updateChildCount,
                limit: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ClassListWidget(
                  callback: callbackForRadioButton,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: ChooseflyButtonComponent(
            height: 48,
            text: AppLocalizations.of(context)!.confirm,
            callback: () {
              data = {
                'oldCount': oldCount,
                'childCount': childCount,
                'classGrade': classGrade
              };
              context.pop(data);
            },
          ),
        )
      ]),
    );
  }
}
