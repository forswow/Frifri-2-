import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_ticket_bloc.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  late final SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    searchBloc = Dependencies.of(context).searchBloc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<SearchBloc, SearchState>(
            bloc: searchBloc,
            builder: (context, state) {
              switch (state) {
                case EnteringParameters():
                  return Text(state.ticketsSearchQuery.locale);

                case SearchCompleted():
                  return Text(state.ticketList.first.searchId);
                case Failure():
                  return Text("");

                case LinkFetched():
                  return Text("");
              }
            },
          );
        },
      ),
    );
  }
}
