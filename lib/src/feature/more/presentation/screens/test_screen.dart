import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/feature/application/root_app/wrappers/locale_wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template test_screen}
/// TestScreen widget.
/// {@endtemplate}
class TestScreen extends StatefulWidget {
  /// {@macro test_screen}
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void showPushNotification() => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.9,
          width: MediaQuery.sizeOf(context).width,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 26),
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => context.pop(),
                          child: SvgPicture.asset('assets/icons/close.svg'),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 24),
                    child: Divider(
                      height: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.pushNotification,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 70,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: CupertinoSwitch(
                              value: true,
                              onChanged: (bool value) {},
                              activeColor: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(227, 14, 5, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(
                              AppLocalizations.of(context)!.confirm,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.airTickets),
            Text(LocaleWrapper.maybeOf(context)!.currentLocale),
            ElevatedButton(
                onPressed: () {
                  LocaleWrapper.maybeOf(context)!.changeLangauge('ru');
                },
                child: const Text('hello world ')),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: ElevatedButton(
                    onPressed: () {
                      showPushNotification();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(227, 14, 5, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      AppLocalizations.of(context)!.confirm,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
