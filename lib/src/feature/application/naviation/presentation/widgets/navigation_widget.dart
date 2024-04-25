import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/direct_flight/presentation/screens/direct_fligths_screen.dart';
import 'package:frifri/src/feature/more/presentation/screens/more_screen.dart';
import 'package:frifri/src/feature/reservation/presentation/screens/reservation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _screens = <Widget>[
  AviaTicketScreen(),
  Scaffold(),
  ReservationScreen(),
  MoreScreen()
];

/// {@template navigation_widget}
/// NavigationWidgetScreen widget.
/// {@endtemplate}
class NavigationWidgetScreen extends StatefulWidget {
  /// {@macro navigation_widget}
  const NavigationWidgetScreen({super.key});

  @override
  State<NavigationWidgetScreen> createState() => _NavigationWidgetScreenState();
}

class _NavigationWidgetScreenState extends State<NavigationWidgetScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).appBarTheme.backgroundColor),
      child: Scaffold(
        body: _screens[currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: SafeArea(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.10,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kCardBackgroundColor,
                boxShadow: [
                  kCardShadow,
                ],
              ),
              child: Row(
                children: [
                  CustomNavigationBarItem(
                      title: AppLocalizations.of(context)!.avia,
                      assetPath: 'assets/icons/home.svg',
                      activeAssetPath: 'assets/icons/active_home.svg',
                      isActive: identical(0, currentIndex) ? true : false,
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      }),
                  CustomNavigationBarItem(
                      title: AppLocalizations.of(context)!.hotel,
                      assetPath: 'assets/icons/book-open.svg',
                      activeAssetPath: 'assets/icons/book-open.svg',
                      isActive: identical(7, currentIndex) ? true : false,
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      }),
                  Spacer(),
                  CustomNavigationBarItem(
                      title: AppLocalizations.of(context)!.service,
                      assetPath: 'assets/icons/fire.svg',
                      activeAssetPath: 'assets/icons/active_fire.svg',
                      isActive: identical(2, currentIndex) ? true : false,
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      }),
                  CustomNavigationBarItem(
                      title: AppLocalizations.of(context)!.moreFirstUpCase,
                      assetPath: 'assets/icons/more-horizontal.svg',
                      activeAssetPath: 'assets/icons/active_more.svg',
                      isActive: identical(3, currentIndex) ? true : false,
                      onPressed: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.057),
          width: MediaQuery.sizeOf(context).width * 0.135,
          height: MediaQuery.sizeOf(context).height * 0.135,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: kPrimaryAppColor,
            child: SvgPicture.asset('assets/icons/Search.svg'),
            shape: CircleBorder(),
            elevation: 0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

/// {@template navigation_widget}
/// CustomNavigationBarItem widget.
/// {@endtemplate}
class CustomNavigationBarItem extends StatelessWidget {
  /// {@macro navigation_widget}
  const CustomNavigationBarItem({
    super.key,
    required this.title,
    required this.assetPath,
    required this.onPressed,
    required this.activeAssetPath,
    required this.isActive,
  });

  final String title;
  final String assetPath;
  final String activeAssetPath;
  final bool isActive;
  final VoidCallback onPressed;

  static const double _SvgScaleFactor = 0.07;
  static const double _fontScaleFactor = 5.5;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onPressed.call(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isActive ? activeAssetPath : assetPath,
              width: MediaQuery.sizeOf(context).width * _SvgScaleFactor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                title,
                style: isActive
                    ? GoogleFonts.inter(
                        fontSize: MediaQuery.of(context).devicePixelRatio *
                            _fontScaleFactor,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryAppColor,
                      )
                    : GoogleFonts.inter(
                        fontSize: MediaQuery.of(context).devicePixelRatio *
                            _fontScaleFactor,
                        fontWeight: FontWeight.w600,
                        color: kNavBarInactiveColor,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
