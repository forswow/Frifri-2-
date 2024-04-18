import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/more/domain/constans/more_item_list.dart';
import 'package:frifri/src/feature/more/presentation/modals/more_settings_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template more_screen}
/// MoreScreen widget.
/// {@endtemplate}
class MoreScreen extends StatefulWidget {
  /// {@macro more_screen}
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    final _devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    const _moreMenuTextScaleFactor = 6.2;
    const _moreMenuIconScaleFactor = 0.034;
    const _arrowIconScaleFactor = 0.026;

    const _generalPadding = 24.0;

    // 24 - 14 = 10
    const _tilePadding = _generalPadding - 14.0;
    // 24 - 10 = 14
    const _tileContentPadding = _generalPadding - _tilePadding;
    // Суммарно = 24

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              AppLocalizations.of(context)!.more,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: ListView.separated(
          // Padding + contentPadding = 24 пикселя по дизайну
          // это нужно чтобы эффект тапа не казался уродливым (прижатым к иконкам)
          padding: const EdgeInsets.only(
              left: _tileContentPadding, right: _tileContentPadding, top: 20),
          itemBuilder: (context, index) {
            final data = moreItemList(context)[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: _tileContentPadding,
              ),
              onTap: () {
                // Для тесто на тап по лист тайлу
                showPushNotification(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              horizontalTitleGap: 9.17,
              leading: SvgPicture.asset(
                data.assetPath,
                height: MediaQuery.sizeOf(context).height *
                    _moreMenuIconScaleFactor,
                width:
                    MediaQuery.sizeOf(context).width * _moreMenuIconScaleFactor,
              ),
              title: Text(
                data.name,
                style: GoogleFonts.poppins(
                  fontSize: _devicePixelRatio * _moreMenuTextScaleFactor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                height:
                    MediaQuery.sizeOf(context).height * _arrowIconScaleFactor,
                width: MediaQuery.sizeOf(context).width * _arrowIconScaleFactor,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 10,
              color: kDividerPrimaryColor,
            );
          },
          itemCount: moreItemList(context).length,
        ),
      ),
    );
  }
}
