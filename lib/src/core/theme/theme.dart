import 'package:flutter/material.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: kPrimaryBackgroundColor,
  appBarTheme: AppBarTheme(
      backgroundColor: kPrimaryBackgroundColor,
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
    ),
  ),
);
