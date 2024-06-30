import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/extensions/string_extensions.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_cities/recent_city_searches_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/bloc/search_cities/search_city_bloc.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/choose_fly_airport.component.dart';
import 'package:frifri/src/feature/more/domain/language_bloc.dart';
import 'package:frifri/src/feature/shared/domain/entities/airport_entity.dart';
import 'package:frifri/src/feature/shared/domain/entities/country_search_entity.dart';
import 'package:google_fonts/google_fonts.dart';

enum SearchCityModalModeEnum {
  from,
  to,
}

class SearchCityModal extends StatelessWidget {
  const SearchCityModal({
    required this.searchModel, required this.mode, super.key,
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
              labelText: AppLocalizations.of(context).airportCitySearch,
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
              builder: (context, state) {
                switch (state) {
                  case Idle():
                    return BlocBuilder<RecentSearchesCubit,
                        List<AutocompleteEntity>>(
                      builder: (context, state) {
                        return SearchCityResult(
                          title: AppLocalizations.of(context).recentSearches,
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
                      title: 'Результаты поиска',
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
    final locale = context.read<AppLanguageSettingsCubit>().state;
    context
        .read<SearchCityBloc>()
        .add(StartCitySearchEvent(text: newText, locale: locale));
  }

  // return EmptyStringListFrom(airlinesList: filteredAirlines);
  // return SearchIsNotEmptyListFrom(filteredAirlines: filteredAirlines);
  // } else if (filteredAirlines.isEmpty && searchText != '') {
}

class SearchCityResult extends StatelessWidget {
  const SearchCityResult({
    required this.searchResult, required this.title, super.key,
  });

  final List<AutocompleteEntity> searchResult;
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

                    // Здесь НЕЛЬЗЯ использовать context.pop
                    // т.к. он использует неверный контекст и закрывает
                    // последний экран вместо модального окна, в котором мы находимся
                    // (так происходит только если в стеке 2 окна, с 1 всё нормально :/)
                    Navigator.of(context).pop(
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
    required this.searchModel, required this.mode, super.key,
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
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/close.svg',
                      height: 21,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context).whereFrom.captialize(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: mode == SearchCityModalModeEnum.from
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          if (searchModel.departureAt != null) Text(
                                  searchModel.departureAt!.code,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ) else const SizedBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(
                          'assets/icons/searchfly-airplane.svg'),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)
                                .whereToFly
                                .captialize(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: mode == SearchCityModalModeEnum.to
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          if (searchModel.arrivalAt != null) Text(
                                  searchModel.arrivalAt!.code,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ) else const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
