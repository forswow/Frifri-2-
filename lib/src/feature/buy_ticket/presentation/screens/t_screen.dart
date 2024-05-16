import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/data/DTO/search_tickets.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client_impl.dart';
import 'package:intl/intl.dart';

import '../../data/dto/ticket_search_query.dart';

class TScreen extends StatefulWidget {
  const TScreen({super.key});

  @override
  State<TScreen> createState() => _TScreenState();
}

class _TScreenState extends State<TScreen> {
  final inputFormat = DateFormat('yyyy-mm-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () async {
              try {
                final date = DateTime.now();

                final options = TicketsSearchQuery(
                  host: "frifri.ge",
                  locale: "en",
                  marker: '406687',
                  segments: [
                    Segment(
                      origin: "MOW",
                      destination: "BUS",
                      date: "2024-05-18",
                    ),
                  ],
                  tripClass: 'Y',
                  passengers: Passengers(adults: 1),
                  userIp: "127.0.0.1",
                );

                print('${date.year}-0${date.month}-${date.day}');
                await AviaTicketsApiClientImpl()
                    .searchTickets(options: options)
                    .then((value) async {
                  print('Parse data');
                  await AviaTicketsApiClientImpl()
                      .getTicketsBySearchId(searchId: value.searchId)
                      .then((value) {
                    for (var element in value) {
                      print(element..toString());
                    }
                  });
                });
              } on Object catch (error, stack) {
                print(error);
                // debugPrintStack(stackTrace: stack, label: '$error');
              }
            },
            child: const Text("Get prices")),
      )),
    );
  }
}
