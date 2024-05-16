import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';

class Passengers {
  int adults = 1;
  int children = 0;
  TripClass? tripClass;

  Passengers({
    this.adults = 1,
    this.children = 0,
    this.tripClass,
  });
}
