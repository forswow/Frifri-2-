import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/modals/base_modal.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_airport.component.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchflyModalFrom extends BottomSheetStatelessModalBase {
  const SearchflyModalFrom({super.key});

  static const TextStyle _listTileTextStyle = TextStyle(
    fontSize: 16.0,
  );

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 16,
  );

  @override
  Widget build_header(BuildContext context) {
    return Padding(
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
                      Text('ОТКУДА',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      SvgPicture.asset('assets/icons/searchfly-airplane.svg'),
                      Text('КУДА',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black26))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build_content(BuildContext context) {
    final _controller = TextEditingController();
    String searchText = '';

    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: (text) {},
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                labelText: 'Поиск аэропорта/города',
                labelStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                fillColor: Color(0xFFF1F3F8),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: searchText == ''
                  ? CustomScrollView(
                      clipBehavior: Clip.antiAlias,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text('БЛИЖАЙШИЙ АЭРОПОРТ',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 36)),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var airline = airlines[index];
                              var airlineName = airline['name'];
                              var airlaneShortName = airline['shortName'];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: AirportComponentCard(
                                  name: airlineName,
                                  shortName: airlaneShortName,
                                  callback: () {
                                    context.pop(airlineName);
                                  },
                                ),
                              );
                            },
                            childCount: airlines.length,
                            addAutomaticKeepAlives:
                                true, // Добавляем автоматическое сохранение виджетов
                            addRepaintBoundaries:
                                true, // Добавляем границы перерисовки для оптимизации
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 36)),
                        SliverToBoxAdapter(
                            child: Text('НЕДАВНИЕ ПОИСКИ',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))),
                        SliverToBoxAdapter(child: SizedBox(height: 16)),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var airline = airlines[index];
                              var airlineName = airline['name'];
                              var airlaneShortName = airline['shortName'];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: AirportComponentCard(
                                  name: airlineName,
                                  shortName: airlaneShortName,
                                  callback: () {
                                    context.pop(airlineName);
                                  },
                                ),
                              );
                            },
                            childCount: airlines.length,
                            addAutomaticKeepAlives:
                                true, // Добавляем автоматическое сохранение виджетов
                            addRepaintBoundaries:
                                true, // Добавляем границы перерисовки для оптимизации
                          ),
                        ),
                      ],
                    )
                  : Container(
                      child: Center(
                        child: Text(_controller.value.toString()),
                      ),
                    ),
            )
          ],
        ));
  }
}

List airlines = [
  {'name': 'Батуми', 'shortName': " BUS"},
  {'name': 'Тбилиси', 'shortName': " TBS"},
  {'name': 'Кутаиси', 'shortName': " KUT"},
];
