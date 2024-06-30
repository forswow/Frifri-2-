import 'package:flutter_svg/svg.dart';

abstract class AppIcons {
  static final hotelsCalendarStart = SvgPicture.asset(
    'assets/icons/hotels_form_calendar_start.svg',
    width: 32,
  );

  static final hotelsCalendarEnd = SvgPicture.asset(
    'assets/icons/hotels_form_calendar_end.svg',
    width: 32,
  );

  static final hotelsPeople = SvgPicture.asset(
    'assets/icons/hotels_form_people.svg',
    width: 32,
  );

  static final hotelsLocation = SvgPicture.asset(
    'assets/icons/hotels_form_location.svg',
    width: 32,
  );
}
