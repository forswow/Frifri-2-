import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choosefly_airport.component.dart';
import 'package:go_router/go_router.dart';

class EmptyStringListTo extends StatelessWidget {
  const EmptyStringListTo({
    super.key,
    required this.airlinesList,
  });
  final Map<String, String> airlinesList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.antiAlias,
      slivers: [
        SliverToBoxAdapter(
          child: Text('БЛИЖАЙШИЙ АЭРОПОРТ',
              style: AppStyles.textStylePoppins
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 36)),
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
                  callback: () => context.pop(
                    AirportEntity(name: name, code: shortName),
                  ),
                ),
              );
            },
            childCount: airlinesList.length,
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 36)),
        SliverToBoxAdapter(
            child: Text('НЕДАВНИЕ ПОИСКИ',
                style: AppStyles.textStylePoppins
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w500))),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
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
                  callback: () => context.pop(name),
                ),
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
