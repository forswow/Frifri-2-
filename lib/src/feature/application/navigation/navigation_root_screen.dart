import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/application/navigation/navigation_manager.dart';
import 'package:frifri/src/feature/avia_tickets/presentation/widgets/flight_prices_modal.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final currentNavigationIndex = navigationShell.currentIndex;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigationBar(
        navigationIndex: currentNavigationIndex,
      ),
      floatingActionButton: const _CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    required this.navigationIndex,
    super.key,
  });

  final int navigationIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.10,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kCardBackgroundColor,
            boxShadow: const [
              kCardShadow,
            ],
          ),
          child: Row(
            children: [
              CustomNavigationBarItem(
                title: AppLocalizations.of(context).avia,
                assetPath: 'assets/icons/home.svg',
                activeAssetPath: 'assets/icons/home_active.svg',
                isActive: navigationIndex == 0,
                onPressed: () {
                  context.go(NavigationManager.aviaTickets);
                },
              ),
              CustomNavigationBarItem(
                title: AppLocalizations.of(context).hotel,
                assetPath: 'assets/icons/book-open.svg',
                activeAssetPath: 'assets/icons/book_open_active.svg',
                isActive: navigationIndex == 1,
                onPressed: () {
                  context.go(NavigationManager.hotels);
                },
              ),
              const Spacer(),
              CustomNavigationBarItem(
                title: AppLocalizations.of(context).service,
                assetPath: 'assets/icons/fire.svg',
                activeAssetPath: 'assets/icons/active_fire.svg',
                isActive: navigationIndex == 2,
                onPressed: () {
                  context.go(NavigationManager.services);
                },
              ),
              CustomNavigationBarItem(
                title: AppLocalizations.of(context).moreFirstUpCase,
                assetPath: 'assets/icons/more-horizontal.svg',
                activeAssetPath: 'assets/icons/active_more.svg',
                isActive: navigationIndex == 3,
                onPressed: () {
                  context.go(NavigationManager.more);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.057),
      width: MediaQuery.sizeOf(context).width * 0.155,
      height: MediaQuery.sizeOf(context).height * 0.155,
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context) => const FlightPricesModal(
              destinationAirportName: "Владивосток",
              originAirportName: "Хуяндок",
            ),
          );
          // Раскоментить после добавления модального окна
          // context.go(NavigationManager.search);
        },
        backgroundColor: kPrimaryAppColor,
        shape: const CircleBorder(),
        elevation: 0,
        child: FractionallySizedBox(
          widthFactor: 0.6,
          heightFactor: 0.6,
          child: SvgPicture.asset('assets/icons/Search.svg'),
        ),
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

  static const double _svgScaleFactor = 0.07;
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
              width: MediaQuery.sizeOf(context).width * _svgScaleFactor,
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
