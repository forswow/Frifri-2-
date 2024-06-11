import 'package:flutter/material.dart';
import 'package:frifri/src/core/data_base/search_database.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/avia_tickets/data/data_sources/database/ticket_record_local_data_sources.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/ticket_record_entity.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late AppDatabase appDatabase;
  late final TicketRecordLocalDataSources ticketRecordLocalDataSources;

  @override
  void initState() {
    appDatabase = Dependencies.of(context).appDatabase;
    ticketRecordLocalDataSources =
        TicketRecordLocalDataSources(database: appDatabase);
    super.initState();
  }

  final remoteList = [
    TicketRecordEntity(origin: 'TBS', destination: "BTM", index: 10),
    TicketRecordEntity(origin: 'CUT', destination: "ROM", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "CUT", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "MOW", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "HRU", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "TJJ", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "DKK", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "SSS", index: 10),
    TicketRecordEntity(origin: 'TBS', destination: "FRu", index: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final list =
                    await ticketRecordLocalDataSources.fetchTickets('TBS');

                final localList = List.from(list);

                for (var e in localList) {
                  if (!remoteList.contains(e)) {
                    list.remove(e);
                  }
                }
              },
              child: const Text('Fetch tickets list'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Stopwatch stop = Stopwatch();
                stop.start();
                await ticketRecordLocalDataSources.insertTickets([]);

                stop.stop();

                print(stop.elapsedMilliseconds);
              },
              child: const Text('Insert tickets list'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Stopwatch stop = Stopwatch();
                stop.start();
                stop.stop();
                await ticketRecordLocalDataSources.deleteTickets('TBS');
                print(stop.elapsedMilliseconds);
              },
              child: const Text('Delete tickets list'),
            ),
          ],
        ),
      )),
    );
  }
}
