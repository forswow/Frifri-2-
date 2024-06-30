import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final countryTopTextStyle = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 22,
);

final countryBottomTextStyle = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

/// {@template country_text_widget}
/// CountryTextWidget widget.
/// {@endtemplate}
class CountryTextWidget extends StatelessWidget {
  /// {@macro country_text_widget}
  const CountryTextWidget({
    required this.title, required this.subTitle, required this.crossAxisAlignment, super.key,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            FittedBox(
      
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: countryTopTextStyle,
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                subTitle,
                style: countryBottomTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
