import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static final formTitle = GoogleFonts.poppins(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static final formTileBody = GoogleFonts.poppins(
    fontSize: 14,
    color: const Color(0xFF000000),
    fontWeight: FontWeight.w600,
  );

  static final formTilePaleBody = GoogleFonts.poppins(
    fontSize: 14,
    color: const Color(0xFFE0E0E0),
    fontWeight: FontWeight.w600,
  );

  static final locationBody = GoogleFonts.poppins(
    fontSize: 15,
    color: const Color(0xFF1C1C28),
    fontWeight: FontWeight.w400,
  );
}
