import 'package:flutter/material.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseflyButtonComponent extends StatelessWidget {
  const ChooseflyButtonComponent({
    super.key,
    required this.height,
    required this.text,
    required this.callback,
  });

  final double height;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          color: kPrimaryAppColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
