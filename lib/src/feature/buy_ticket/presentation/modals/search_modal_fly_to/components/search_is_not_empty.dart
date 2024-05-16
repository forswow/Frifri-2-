import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choosefly_airport.component.dart';
import 'package:go_router/go_router.dart';

class SearchIsNotEmptyList extends StatelessWidget {
  const SearchIsNotEmptyList({super.key, this.filteredAirlines});
  final filteredAirlines;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          final String name = filteredAirlines.keys.toList()[index];
          final String shortName = filteredAirlines.values.toList()[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: AirportComponentCard(
                name: name,
                shortName: shortName.substring(0, 3).toUpperCase(),
                callback: () => context.pop(name)),
          );
        }, childCount: filteredAirlines.length))
      ],
    );
  }
}
