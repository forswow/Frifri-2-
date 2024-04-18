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
class ServicesScreen extends StatefulWidget {
  /// {@macro reservation_screen}
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
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
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: Colors.white,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: ColoredBox(
                      color: const Color.fromRGBO(91, 156, 236, 0.12),
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
                title: Text(
                  data.name,
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: serviceList(context).length,
        ),
      ),
    );
  }
}
