import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/icons/app_icons.dart';
import 'package:frifri/src/core/ui_kit/styles/app_text_styles.dart';

class LocationItemTile extends StatelessWidget {
  final String title;

  const LocationItemTile({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppIcons.hotelsLocationDark,
      title: Text(
        title,
        style: AppTextStyles.locationBody,
      ),
    );
  }
}
