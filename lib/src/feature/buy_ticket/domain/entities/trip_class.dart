enum TripClass {
  economy,
  comfort,
  first,
  business,
}

String tripClassToString(TripClass tripClass) {
  switch (tripClass) {
    case TripClass.economy:
      return 'Эконом';
    case TripClass.comfort:
      return 'Комфорт';
    case TripClass.first:
      return 'Первый';
    case TripClass.business:
      return 'Бизнес';
  }
}
