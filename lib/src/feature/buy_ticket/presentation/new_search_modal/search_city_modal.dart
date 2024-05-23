import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choosefly_airport.component.dart';
import 'package:frifri/src/module/country_search/domain/entity/country_search_entity.dart';
import 'package:frifri/src/module/country_search/presentation/bloc/country_search_bloc.dart';
import 'package:frifri/src/module/country_search/presentation/bloc/recent_searches_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

enum SearchCityModalModeEnum {
  from,
  to,
}

class SearchCityModal extends StatelessWidget {
  const SearchCityModal({
    super.key,
    required this.searchModel,
    required this.mode,
  });

  final SearchModel searchModel;
  final SearchCityModalModeEnum mode;

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          SearchFlyModalHeader(
            searchModel: searchModel,
            mode: mode,
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
          const _SearchCityModalContent(),
        ],
      ),
    );
  }
}

class _SearchCityModalContent extends StatefulWidget {
  const _SearchCityModalContent();

  @override
  State<_SearchCityModalContent> createState() =>
      _SearchCityModalContentState();
}

class _SearchCityModalContentState extends State<_SearchCityModalContent> {
  String searchText = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: _controller,
            onChanged: onSearchFieldChanged,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              filled: true,
              labelText: AppLocalizations.of(context)!.airportCitySearch,
              labelStyle: AppStyles.textStylePoppins,
              fillColor: const Color(0xFFF1F3F8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: BlocBuilder<SearchCityBloc, SearchCityState>(
              builder: (BuildContext context, state) {
                switch (state) {
                  case Idle():
                    return BlocBuilder<RecentSearchesCubit,
                        List<CountrySearchEntity>>(
                      builder: (context, state) {
                        logger.i(state.toString());
                        return SearchCityResult(
                          title: "Ранее искали",
                          searchResult: state,
                        );
                      },
                    );
                  case SearchInProgress():
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SearchCompleted():
                    return SearchCityResult(
                      title: "Результаты поиска",
                      searchResult: state.countrySearchList,
                    );
                  case SearchFailure():
                    return Container();
                }
              },
            ),
          )
        ]),
      ),
    );
  }

  void onSearchFieldChanged(String newText) {
    searchText = newText;
    context.read<SearchCityBloc>().add(StartCitySearchEvent(text: newText));
  }

  // return EmptyStringListFrom(airlinesList: filteredAirlines);
  // return SearchIsNotEmptyListFrom(filteredAirlines: filteredAirlines);
  // } else if (filteredAirlines.isEmpty && searchText != '') {
}

class SearchCityResult extends StatelessWidget {
  const SearchCityResult({
    super.key,
    required this.searchResult,
    required this.title,
  });

  final List<CountrySearchEntity> searchResult;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              title,
              style: AppStyles.textStylePoppins.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final String name = searchResult[index].name;
              final String code = searchResult[index].code;

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AirportComponentCard(
                  name: name,
                  shortName: code,
                  callback: () {
                    context
                        .read<RecentSearchesCubit>()
                        .addRecentSearch(searchResult[index]);

                    context.pop(
                      AirportEntity(
                        name: name,
                        code: code,
                      ),
                    );
                  },
                ),
              );
            },
            childCount: searchResult.length,
          ),
        )
      ],
    );
  }
}

class SearchFlyModalHeader extends StatelessWidget {
  const SearchFlyModalHeader({
    super.key,
    required this.searchModel,
    required this.mode,
  });

  final SearchModel searchModel;
  final SearchCityModalModeEnum mode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/close.svg",
                      height: 21,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'ОТКУДА',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: mode == SearchCityModalModeEnum.from
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            searchModel.departureAt != null
                                ? Text(
                                    searchModel.departureAt!.code,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        SvgPicture.asset('assets/icons/searchfly-airplane.svg'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'КУДА',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: mode == SearchCityModalModeEnum.to
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            searchModel.arrivalAt != null
                                ? Text(
                                    searchModel.arrivalAt!.code,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
