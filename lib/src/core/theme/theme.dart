import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(241, 243, 248, 1),
  appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromRGBO(241, 243, 248, 1),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      centerTitle: false),
  bottomSheetTheme: const BottomSheetThemeData(),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(),
      displaySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      )),
);
