import 'package:frifri/src/feature/buy_ticket/domain/entities/airport_entity.dart';

class SearchForm {
  AirportEntity? origin;
  AirportEntity? destination;

  DateTime? departDate;
  DateTime? returnDate;

  String? currency;

  SearchForm({
    this.origin,
    this.destination,
    this.departDate,
    this.returnDate,
    this.currency,
  });
}
