import 'package:flutter/material.dart';

abstract class AppDecorations {
  static const modalRoundedShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    ),
  );
}
