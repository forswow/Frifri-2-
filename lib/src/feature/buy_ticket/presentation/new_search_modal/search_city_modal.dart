import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
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
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Expanded(
              child: Text("Тут делаем крутые штуки"),
            )
          ],
        ),
      ),
    );
  }

  // return EmptyStringListFrom(airlinesList: filteredAirlines);
  // return SearchIsNotEmptyListFrom(filteredAirlines: filteredAirlines);
  // } else if (filteredAirlines.isEmpty && searchText != '') {
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
