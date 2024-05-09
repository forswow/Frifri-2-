import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/search/presentation/modals/passengers_modal/widgets/classlist_row.dart';

class ClassListWidget extends StatefulWidget {
  const ClassListWidget({super.key, required this.callback});
  final callback;

  @override
  State<ClassListWidget> createState() => _ClassListWidgetState();
}

class _ClassListWidgetState extends State<ClassListWidget> {
  final String economy = 'Эконом';
  final String comfort = 'Комфорт';
  final String firstClass = 'Первый';
  final String business = 'Бизнес';

  bool _isActiveFirst = false;
  bool _isActiveSecond = false;
  bool _isActiveThird = false;
  bool _isActiveFourth = false;
  void toggleActive(param) {
    setState(() {
      if (param == 'Эконом') {
        _isActiveFirst = !_isActiveFirst;
        _isActiveSecond = false;
        _isActiveThird = false;
        _isActiveFourth = false;
        return;
      }

      if (param == 'Комфорт') {
        _isActiveSecond = !_isActiveSecond;
        _isActiveFirst = false;
        _isActiveThird = false;
        _isActiveFourth = false;
        return;
      }

      if (param == 'Первый') {
        _isActiveThird = !_isActiveThird;
        _isActiveFirst = false;
        _isActiveSecond = false;
        _isActiveFourth = false;
        return;
      }

      if (param == 'Бизнес') {
        _isActiveFourth = !_isActiveFourth;
        _isActiveFirst = false;
        _isActiveSecond = false;
        _isActiveThird = false;
        return;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(AppLocalizations.of(context)!.placeClass,
            style: AppStyles.textStylePoppins.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff202020))),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              right: BorderSide(color: Colors.grey, width: 1),
              left: BorderSide(color: Colors.grey, width: 1),
              top: BorderSide(color: Colors.grey, width: 1),
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              ClasslistRow(
                buttonIsActive: _isActiveFirst,
                callback: () {
                  widget.callback(economy);

                  toggleActive(economy);
                },
                leadingText: AppLocalizations.of(context)!.economy,
              ),
              Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 58), // Линия после первой строки
              ClasslistRow(
                buttonIsActive: _isActiveSecond,
                callback: () {
                  widget.callback(comfort);

                  toggleActive(comfort);
                },
                leadingText: AppLocalizations.of(context)!.comfort,
              ),
              Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 58), // Линия после второй строки
              ClasslistRow(
                buttonIsActive: _isActiveThird,
                callback: () {
                  widget.callback(firstClass);

                  toggleActive(firstClass);
                },
                leadingText: AppLocalizations.of(context)!.firstClass,
              ),
              Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 58), // Линия после третьей строки
              ClasslistRow(
                buttonIsActive: _isActiveFourth,
                callback: () {
                  widget.callback(business);

                  toggleActive(business);
                },
                leadingText: AppLocalizations.of(context)!.business,
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        )
      ],
    );
  }
}
