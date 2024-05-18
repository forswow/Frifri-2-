import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/search/search_data_sources.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';

import 'package:frifri/src/feature/buy_ticket/data/repositories/search_ticket_repository_impl.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_ticket_bloc.dart';
import 'package:frifri/src/feature/search/data/data_sources/search_ticket_repository.dart';

import '../../../more/domain/language_bloc.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  late final SearchBloc searchBloc;

  late final SearchTicketRepoImpl searchTicketRepoImpl;

  late final SearchDataSources searchTicketDataSources;

  @override
  void initState() {
    super.initState();
    searchBloc = Dependencies.of(context).searchBloc;
    searchTicketRepoImpl = Dependencies.of(context).searchTicketRepoImpl;
    searchTicketDataSources = SearchDataSources();
  }

  String searchId = 'empty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(searchId),
            SizedBox(height: 10),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await searchTicketRepoImpl.searchTicket(
                        TicketsSearchQuery(passengers: Passengers(), segments: [
                      Segment(
                          origin: 'GYD',
                          destination: 'TBS',
                          date: '2024-05-18'),
                    ]));

                    setState(() {
                      searchId = result.searchId;
                    });
                    print(result.searchId);
                    final data = await searchTicketDataSources
                        .httpRequest(result.searchId);

                    setState(() {});
                    // await Future.delayed(const Duration(seconds: 60), () async {
                    //   print('timer 60 seconds completed');
                    // });
                  } on Object catch (error, stack) {
                    logger.e('message', error: error, stackTrace: stack);
                    // debugPrintStack(stackTrace: stack, label: '$error');
                  }
                },
                child: const Text("Main")),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await searchTicketDataSources.getSearch();
                  } on Object catch (error, stack) {
                    debugPrintStack(label: '$error', stackTrace: stack);
                  }
                },
                child: const Text("TicketID")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Link")),
          ],
        ),
      )),
    );
  }
}
