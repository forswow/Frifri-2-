import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/feature/more/domain/constans/more_item_list.dart';
import 'package:frifri/src/feature/more/domain/entities/more_item_entity.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template more_screen}
/// MoreScreen widget.
/// {@endtemplate}
class MoreScreen extends StatelessWidget {
  /// {@macro more_screen}
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapTileListView(
      title: AppLocalizations.of(context).more,
      items: moreItemList(context),
    );
  }
}

class WrapTileListView extends StatelessWidget {
  const WrapTileListView({
    required this.title,
    required this.items,
    super.key,
  });
  final String title;
  final List<SettingsEntity> items;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffF1F3F8),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 16,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 39),
                  child: Wrap(
                    runSpacing: 24,
                    spacing: 24,
                    children: items.map((item) {
                      return GestureDetector(
                        onTap: item.onPressed,
                        child: GridTile(
                          child: Container(
                            width: 124,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff5B9CEC)
                                          .withOpacity(.12),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: ClipOval(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4, sigmaY: 4),
                                        child: SvgPicture.asset(
                                          item.assetPath,
                                          height: 24,
                                          width: 24,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xff5B9CEC),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 16 / 14,
                                      color: const Color(0xff23262F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
