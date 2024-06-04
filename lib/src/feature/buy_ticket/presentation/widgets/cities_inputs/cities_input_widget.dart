import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';

class CitiesInput extends StatelessWidget {
  const CitiesInput({
    super.key,
    required this.iconPath,
    required this.cityName,
    required this.onIconPressed,
    this.onTitlePressed,
  });

  final String iconPath;
  final String cityName;
  final VoidCallback? onIconPressed;
  final VoidCallback? onTitlePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTitlePressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              cityName,
              style: AppStyles.textStylePoppins.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.zero,
              onPressed: onIconPressed,
              icon: SvgPicture.asset(
                iconPath,
                width: 18,
                height: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
