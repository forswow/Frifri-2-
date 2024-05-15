import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  static final textStylePoppins = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
