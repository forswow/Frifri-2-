import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/search/presentation/modals/passengers_modal/passengers_modal.dart';
import 'package:frifri/src/feature/search/presentation/modals/search_modal_fly_from/searchfly_modal_from.dart';
import 'package:frifri/src/feature/search/presentation/modals/search_modal_fly_to/searchfly_modal_to.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_button.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_radiobutton.dart';

class ChooseFlyMainScreen extends StatefulWidget {
  const ChooseFlyMainScreen({super.key});

  @override
  State<ChooseFlyMainScreen> createState() => _ChooseFlyMainScreenState();
}

class _ChooseFlyMainScreenState extends State<ChooseFlyMainScreen> {
  String flyFrom = 'Выбрать';
  String? flyFromShortName;
  String flyTo = 'Выбрать';
  bool _isActive = false;

  Map passengersData = <String, dynamic>{
    'oldCount': 0,
    'childCount': 0,
    'classGrade': ''
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppLocalizations.of(context)!.whereToFly,
                  style: AppStyles.textStylePoppins
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                builder: (context) => SearchflyModalFrom(),
                              ).then((value) => setState(() {
                                    flyFrom = value;
                                  }));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.whereFrom,
                                    style: AppStyles.textStylePoppins.copyWith(
                                        color: Colors.grey, fontSize: 16)),
                                SizedBox(height: 4),
                                Text(flyFrom,
                                    style: AppStyles.textStylePoppins.copyWith(
                                        color: flyFrom !=
                                                AppLocalizations.of(context)!
                                                    .choose
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              'assets/icons/searchfly-airplane.svg'),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                builder: (context) => SearchflyModalTo(
                                    shortName:
                                        flyFrom.substring(0, 3).toUpperCase()),
                              ).then((value) => {
                                    setState(() {
                                      flyTo = value;
                                    })
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(AppLocalizations.of(context)!.where,
                                    style: AppStyles.textStylePoppins.copyWith(
                                        fontSize: 16, color: Colors.grey)),
                                SizedBox(height: 4),
                                flyTo == AppLocalizations.of(context)!.choose
                                    ? Text(flyTo,
                                        style: AppStyles.textStylePoppins
                                            .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600))
                                    : Text(flyTo.toString(),
                                        style: AppStyles.textStylePoppins
                                            .copyWith(
                                                fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey[300], thickness: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.when,
                                  style: AppStyles.textStylePoppins.copyWith(
                                      color: Colors.grey, fontSize: 16)),
                              SizedBox(height: 4),
                              Text(AppLocalizations.of(context)!.selectDate,
                                  style: AppStyles.textStylePoppins.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(height: 32, color: Colors.grey, thickness: 1),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(AppLocalizations.of(context)!.back,
                                  style: AppStyles.textStylePoppins.copyWith(
                                      color: Colors.grey, fontSize: 16)),
                              SizedBox(height: 4),
                              Text(AppLocalizations.of(context)!.selectDate,
                                  style: AppStyles.textStylePoppins.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: 1,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                      context: context,
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      builder: (context) => PassengersModal(
                                          passengersData: passengersData))
                                  .then((value) {
                                setState(() {
                                  passengersData = value;
                                  print(passengersData['classGrade']);
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .passengers,
                                        style: AppStyles.textStylePoppins
                                            .copyWith(
                                                color: Colors.grey,
                                                fontSize: 16)),
                                    SizedBox(height: 4),
                                    (passengersData['oldCount'] == 0 &&
                                            passengersData['childCount'] == 0)
                                        ? Text(
                                            AppLocalizations.of(context)!
                                                .choose,
                                            style: AppStyles.textStylePoppins
                                                .copyWith(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          )
                                        : Container(
                                            width: 130,
                                            child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Text(
                                                  '${passengersData['oldCount'] == 0 ? '' : passengersData['oldCount'].toString() + ' Взрослый'}${(passengersData['oldCount'] != 0 && passengersData['childCount'] != 0 ? ',' : '')} ${passengersData['childCount'] != 0 ? passengersData['childCount'].toString() + ' Детский' : ''} ',
                                                  style: AppStyles
                                                      .textStylePoppins
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )),
                                          )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .placeClass,
                                        style: AppStyles.textStylePoppins
                                            .copyWith(
                                                color: Colors.grey,
                                                fontSize: 16)),
                                    SizedBox(height: 4),
                                    passengersData['classGrade'] == ''
                                        ? Text(
                                            AppLocalizations.of(context)!
                                                .choose,
                                            style: AppStyles.textStylePoppins
                                                .copyWith(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600))
                                        : Text(passengersData['classGrade'],
                                            style: AppStyles.textStylePoppins
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: 78),
                          width: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    Divider(height: 1, color: Colors.grey[300], thickness: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(
                        children: [
                          RadioButton(
                            callback: () {
                              setState(() {
                                _isActive = !_isActive;
                              });
                            },
                            isActive: _isActive,
                          ),
                          Text(AppLocalizations.of(context)!.directFlightsOnly,
                              style: AppStyles.textStylePoppins.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ChooseflyButtonComponent(
                height: 48,
                text: AppLocalizations.of(context)!.findTickets,
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
