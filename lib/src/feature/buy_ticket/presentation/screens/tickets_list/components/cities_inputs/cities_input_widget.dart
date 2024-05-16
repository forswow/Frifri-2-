import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';

class CitiesInput extends StatelessWidget {
  const CitiesInput(
      {super.key,
      required this.cityName,
      required this.callback,
      required this.iconPath});

  final String iconPath;
  final String cityName;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(cityName,
              style: AppStyles.textStylePoppins
                  .copyWith(fontWeight: FontWeight.w600)),
          IconButton(
              onPressed: callback,
              icon: SvgPicture.asset(
                iconPath,
                width: 18,
                height: 18,
              ))
        ],
      ),
    );
  }
}
