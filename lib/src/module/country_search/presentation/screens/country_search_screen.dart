import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/dependencies/dependencies.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/module/country_search/data/data_sources/country_search_data_sources.dart';
import 'package:frifri/src/module/country_search/domain/dto/input_dto.dart';
import 'package:frifri/src/module/country_search/presentation/bloc/country_search_bloc.dart';

import '../../../../core/network/exceptions/nework_exception.dart';

class CountrySearchScreen extends StatefulWidget {
  const CountrySearchScreen({super.key});

  @override
  State<CountrySearchScreen> createState() => _CountrySearchScreenState();
}

class _CountrySearchScreenState extends State<CountrySearchScreen> {
  late final SearchCityBloc countrySearchBloc;
  final searchController = TextEditingController();

  @override
  void initState() {
    countrySearchBloc = Dependencies.of(context).searchCityBloc;
    searchController.addListener(_searchHandler);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: searchController,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    final list = await SearchCityDataSources()
                        .fetchCountrySearch(
                            InputDto(locale: 'ru', term: 'Казах'));

                    for (var element in list) {
                      logger.i(element);
                    }
                  } on NetworkException catch (error, stack) {
                    logger.e('', error: error, stackTrace: stack);
                  } on DioException catch (error, stack) {
                    logger.i('',
                        error: error.response!.realUri, stackTrace: stack);
                  }
                },
                child: const Text(' fetch')),
          ),
          BlocBuilder<SearchCityBloc, CountrySearchState>(
            bloc: countrySearchBloc,
            builder: (context, state) {
              switch (state) {
                case Idle():
                  return const SliverToBoxAdapter(
                    child: Text("idle"),
                  );
                case SearchCompleted():
                  return SliverList.builder(
                    itemBuilder: (context, index) {
                      final searchList = state.countrySearchList[index];
                      return ListTile(
                        title: Text(searchList.countryName),
                        subtitle: Text(searchList.name),
                        trailing: Text(searchList.code),
                      );
                    },
                    itemCount: state.countrySearchList.length,
                  );
                case SearchFailure():
                  return const SliverToBoxAdapter(
                    child: Text("failure"),
                  );
              }
            },
          )
        ],
      )),
    );
  }

  void _searchHandler() {
    final text = searchController.text;

    countrySearchBloc.add(SearchCountry(
        inputDto: InputDto(
            locale: context.read<AppLanguageCubit>().state, term: text)));
  }
}
