import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/feature/more/domain/constans/more_item_list.dart';
import 'package:go_router/go_router.dart';
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
                            fontWeight: FontWeight.w600,
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
                  ElevatedButton(
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
                      ))
                ],
              ),
            ),
          ),
        );
      });
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).appBarTheme.backgroundColor),
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
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
            itemBuilder: (context, index) {
              final data = moreItemList(context)[index];
              return InkWell(
                onTap: (){},
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.027,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        data.assetPath,
                        height: MediaQuery.sizeOf(context).height * 0.026,
                        width: 24,
                      ),
                      const SizedBox(width: 9.7),
                      Text(
                        data.name,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg',
                          height: MediaQuery.sizeOf(context).height * 0.026,
                          width: 20)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Divider(
                  height: 0,
                  color: Color.fromRGBO(230, 232, 236, 1),
                ),
              );
            },
            itemCount: moreItemList(context).length),
      ),
    );
  }
}
