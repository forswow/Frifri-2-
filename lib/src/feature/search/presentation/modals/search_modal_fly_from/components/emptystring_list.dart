import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_airport.component.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyStringListFrom extends StatelessWidget {
  EmptyStringListFrom({super.key, required this.airlinesList});

  final Map<String, String> airlinesList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.antiAlias,
      slivers: [
        SliverToBoxAdapter(
          child: Text(
              AppLocalizations.of(context)!.nearestAirport.toUpperCase(),
              style: AppStyles.textStylePoppins
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12)),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 36)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final String name = airlinesList.keys.toList()[index];
              final String shortName = airlinesList.values.toList()[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AirportComponentCard(
                    name: name,
                    shortName: shortName,
                    callback: () => context.pop(name)),
              );
            },
            childCount: airlinesList.length,
            addAutomaticKeepAlives:
                true, // Добавляем автоматическое сохранение виджетов
            addRepaintBoundaries:
                true, // Добавляем границы перерисовки для оптимизации
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 36)),
        SliverToBoxAdapter(
            child: Text(
                AppLocalizations.of(context)!.recentSearches.toUpperCase(),
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black))),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final String name = airlinesList.keys.toList()[index];
              final String shortName = airlinesList.values.toList()[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AirportComponentCard(
                    name: name,
                    shortName: shortName,
                    callback: () => context.pop(name)),
              );
            },
            childCount: airlinesList.length,
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
          ),
        ),
      ],
    );
  }
}
