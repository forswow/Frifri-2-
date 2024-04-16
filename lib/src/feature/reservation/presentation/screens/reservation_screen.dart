import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/feature/reservation/data/helpers/url_launcher_helper.dart';
import 'package:frifri/src/feature/reservation/domain/constans/service_list.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template reservation_screen}
/// ReservationScreen widget.
/// {@endtemplate}
class ReservationScreen extends StatefulWidget {
  /// {@macro reservation_screen}
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).appBarTheme.backgroundColor),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: Theme.of(context).appBarTheme.centerTitle,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              AppLocalizations.of(context)!.service,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
            itemBuilder: (conntext, index) {
              final data = serviceList(context)[index];
              return GestureDetector(
                onTap: () => UrlLauncherHelper.launchInWeb(data.link),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    width: MediaQuery.sizeOf(context).width,
                    child: ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: ColoredBox(
                                  color: const Color.fromRGBO(
                                      91, 156, 236, 0.12),
                                  child: FractionallySizedBox(
                                    heightFactor: 0.9,
                                    widthFactor: 0.9,
                                    child: Center(
                                      child: SvgPicture.asset(data.assetPath),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                data.name,
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false,
                                    applyHeightToLastDescent: false),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  // textStyle: const TextStyle(height: 0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemCount: serviceList(context).length),
      ),
    );
  }
}
