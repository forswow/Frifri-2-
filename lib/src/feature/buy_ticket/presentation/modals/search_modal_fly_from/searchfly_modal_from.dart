import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/search_modal_fly_from/components/emptystring_list.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/search_modal_fly_from/components/search_is_not_empty.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFlyModalFrom extends StatelessWidget {
  const SearchFlyModalFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultModalWrapper(
      child: Column(
        children: [
          SearchFlyModalHeader(),
          Divider(
            height: 0,
            thickness: 0.5,
          ),
          _SearchFlyModalFromContent(),
        ],
      ),
    );
  }
}

class _SearchFlyModalFromContent extends StatefulWidget {
  const _SearchFlyModalFromContent();

  @override
  State<_SearchFlyModalFromContent> createState() =>
      _SearchFlyModalFromContentState();
}

class _SearchFlyModalFromContentState
    extends State<_SearchFlyModalFromContent> {
  String searchText = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
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
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: returnContent(),
            )
          ],
        ),
      ),
    );
  }

  returnContent() {
    var filteredAirlines = Map.fromEntries(
      airlinesList.entries.where(
        (entry) {
          return entry.key
              .toLowerCase()
              .contains(searchText.toString().toLowerCase());
        },
      ),
    );

    if (searchText == '') {
      return EmptyStringListFrom(airlinesList: filteredAirlines);
    } else if (filteredAirlines.isNotEmpty) {
      return SearchIsNotEmptyListFrom(filteredAirlines: filteredAirlines);
    } else if (filteredAirlines.isEmpty && searchText != '') {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(_controller.text.toString(), style: const TextStyle(fontSize: 30)),
            const Text('По данному запросу ничего не найдено'),
          ],
        ),
      );
    }
    return Container(
      child: const Center(
        child: Text('Ошибка при поиске'),
      ),
    );
  }
}

class SearchFlyModalHeader extends StatelessWidget {
  const SearchFlyModalHeader({
    super.key,
  });

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
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SvgPicture.asset('assets/icons/searchfly-airplane.svg'),
                        Text(
                          'КУДА',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black26,
                          ),
                        )
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

const airlinesList = <String, String>{
  'Батуми': 'BUS',
  'Тбилиси': 'TBS',
  'Кутаиси': 'KUT'
};
