import 'package:flutter/material.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_airport.component.dart';
import 'package:go_router/go_router.dart';

class SearchIsNotEmptyListFrom extends StatelessWidget {
  SearchIsNotEmptyListFrom({super.key, required this.filteredAirlines});
  var filteredAirlines;

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
