import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/more/domain/constans/more_item_list.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static const _moreMenuTextScaleFactor = 0.036;
  static const _moreMenuIconScaleFactor = 0.034;
  static const _arrowIconScaleFactor = 0.026;
  static const _generalPadding = 24.0;
  static const _dividerHeightScaleFactor = 0.0125;

  @override
  Widget build(BuildContext context) {
    // 24 - 14 = 10
    const tilePadding = _generalPadding - 14.0;
    // 24 - 10 = 14
    const tileContentPadding = _generalPadding - tilePadding;
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
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              AppLocalizations.of(context).more,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: ListView.separated(
          // Padding + contentPadding = 24 пикселя по дизайну
          // это нужно чтобы эффект тапа не казался уродливым (прижатым к иконкам)
          padding: const EdgeInsets.only(
              left: tileContentPadding, right: tileContentPadding, top: 20),
          itemBuilder: (context, index) {
            final moreItemEntity = moreItemList(context)[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: tileContentPadding,
              ),
              onTap: moreItemEntity.onPreseed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              horizontalTitleGap: 9.17,
              leading: SvgPicture.asset(
                moreItemEntity.assetPath,
                height: MediaQuery.sizeOf(context).height *
                    _moreMenuIconScaleFactor,
                width:
                    MediaQuery.sizeOf(context).width * _moreMenuIconScaleFactor,
              ),
              title: Text(
                moreItemEntity.name,
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.sizeOf(context).width *
                      _moreMenuTextScaleFactor,
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
              height:
                  MediaQuery.sizeOf(context).height * _dividerHeightScaleFactor,
              color: kDividerPrimaryColor,
            );
          },
          itemCount: moreItemList(context).length,
        ),
      ),
    );
  }
}
