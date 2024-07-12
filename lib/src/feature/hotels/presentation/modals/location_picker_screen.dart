import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/decorations/form_list_tile.dart';
import 'package:frifri/src/core/ui_kit/icons/app_icons.dart';
import 'package:frifri/src/core/ui_kit/styles/app_text_styles.dart';

class LocationPickerScreen extends StatelessWidget {
  const LocationPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _LocationPickerScreenHeader(),
                const SizedBox(height: 24),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: FormListTile(
                          icon: AppIcons.hotelsLocation,
                          child: Text(
                            'Город',
                            style: AppTextStyles.formTilePaleBody,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const IntrinsicWidth(
                        child: _GeoButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationPickerScreenHeader extends StatelessWidget {
  const _LocationPickerScreenHeader();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Подберём лучший отель',
        style: AppTextStyles.formTitle,
      ),
    );
  }
}

class _GeoButton extends StatelessWidget {
  const _GeoButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: AppIcons.hotelsTarget,
    );
  }
}
