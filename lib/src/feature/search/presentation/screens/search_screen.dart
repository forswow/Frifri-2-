import 'package:flutter/material.dart';
import 'package:frifri/src/core/network/dio_client.dart';
import 'package:frifri/src/feature/buy_ticket/data/data_sources/avia_tickets_api_client_impl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //API_KEY=31c30d4e58d9cd3a3dc5cd2b8123e1b1
  // API_BASE_URL=https://api.travelpayouts.com
  // API_MARKER=406687
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Fetch link id"),
            ),
          ],
        ),
      ),
    );
  }
}
