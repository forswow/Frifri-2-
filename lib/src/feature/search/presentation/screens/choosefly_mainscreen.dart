import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/feature/search/presentation/modals/searchfly_modal_from.dart';
import 'package:frifri/src/feature/search/presentation/modals/searchfly_modal_to.dart';
import 'package:frifri/src/feature/search/presentation/widgets/choosefly_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseFlyMainScreen extends StatefulWidget {
  const ChooseFlyMainScreen({super.key});

  @override
  State<ChooseFlyMainScreen> createState() => _ChooseFlyMainScreenState();
}

class _ChooseFlyMainScreenState extends State<ChooseFlyMainScreen> {
  bool isActive = false;

  String? flyFrom;
  String? flyFromShortName;

  String? flyTo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Куда летим?',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                builder: (context) => SearchflyModalFrom(),
                              ).then((value) => setState(() {
                                    flyFrom = value;
                                  }));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Откуда',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey, fontSize: 16)),
                                SizedBox(height: 4),
                                Text(flyFrom ?? 'Выбрать',
                                    style: GoogleFonts.poppins(
                                        color: flyFrom != null
                                            ? Colors.black
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              'assets/icons/searchfly-airplane.svg'),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                builder: (context) => SearchflyModalTo(
                                    shortName:
                                        flyFrom!.substring(0, 3).toUpperCase()),
                              ).then((value) => {
                                    setState(() {
                                      flyTo = value;
                                    })
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Куда',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey, fontSize: 16)),
                                SizedBox(height: 4),
                                flyTo == null
                                    ? Text('Выбрать',
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600))
                                    : Text(flyTo.toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey[300], thickness: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Когда',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey, fontSize: 16)),
                              SizedBox(height: 4),
                              Text('Выбрать дату',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(height: 32, color: Colors.grey, thickness: 1),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Обратно',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey, fontSize: 16)),
                              SizedBox(height: 4),
                              Text('Выбрать дату',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: 1,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Пассажиры',
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      )),
                                  SizedBox(height: 4),
                                  Text('Выбрать',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Класс',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey, fontSize: 16)),
                                  SizedBox(height: 4),
                                  Text('Выбрать',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: 78),
                          width: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    Divider(height: 1, color: Colors.grey[300], thickness: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isActive = !isActive;
                                });
                              },
                              icon: isActive
                                  ? SvgPicture.asset(
                                      'assets/icons/searchfly-radiobutton-active.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/searchfly-radiobutton.svg')),
                          Text('Только прямые рейсы',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ChooseflyButtonComponent(
                height: 48,
                text: 'Найти билеты',
                callback: () {
                  print(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
