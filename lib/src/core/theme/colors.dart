import 'package:flutter/material.dart';

// Application
const kPrimaryAppColor = Color.fromRGBO(227, 13, 5, 1);
const kPrimaryBackgroundColor = Color.fromRGBO(241, 243, 248, 1);

// Typography
const kPrimaryTextColor = Color.fromRGBO(0, 0, 0, 0.9);
const kSecondaryTextColor = Color.fromRGBO(0, 0, 0, 0.5);
const kFaqBodyTextColor = Color.fromRGBO(0, 0, 0, 0.6);

const kPriceColor = Color.fromRGBO(75, 148, 247, 1);
const kCheapestPriceTextColor = Color.fromRGBO(39, 174, 96, 1);

const kBlueTextGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[
    Color.fromRGBO(91, 156, 236, 1),
    Color.fromRGBO(170, 208, 255, 1),
  ],
);

// Buttons
const kPrimaryButtonEnabledColor = Color.fromRGBO(227, 13, 5, 1);
const kPrimaryButtonDisabledColor = Color.fromRGBO(255, 211, 211, 1);

// Card
const kCardBackgroundColor = Colors.white;
const kCardShadow = BoxShadow(
  color: Color.fromRGBO(115, 135, 174, 0.12),
  offset: Offset(0, 4),
  blurRadius: 12,
  spreadRadius: 0,
);

// Navigation Bar
const kNavBarActiveColor = kPrimaryAppColor;
const kNavBarInactiveColor = Colors.grey;

// Rounded Icon
const kRoundedButtonBackgroundColor = Color.fromRGBO(235, 243, 253, 1);
const kRoundedButtonIconColor = Color.fromRGBO(91, 156, 236, 1);

// Borders
const kBorderPrimaryColor = Color.fromRGBO(227, 227, 227, 1);
const kDividerPrimaryColor = Color.fromRGBO(230, 232, 236, 1);
