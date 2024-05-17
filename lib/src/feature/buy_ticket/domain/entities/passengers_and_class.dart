import 'package:frifri/src/feature/buy_ticket/domain/entities/passengers.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/trip_class.dart';

class PassengersAndClass {
  const PassengersAndClass({
    required this.passengers,
    required this.tripClass,
  });

  final TripClass tripClass;
  final PassengersEntity passengers;
}
