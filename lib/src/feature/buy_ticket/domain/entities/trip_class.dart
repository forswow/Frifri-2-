enum TripClass {
  economy,
  comfort,
  first,
  business,
}

String tripClassToString(TripClass tripClass) {
  return switch (tripClass) {
    TripClass.economy => 'Эконом',
    TripClass.comfort => 'Комфорт',
    TripClass.first => 'Первый',
    TripClass.business => 'Бизнес'
  };
}

String tripClassToDataString(TripClass tripClass) {
  return switch (tripClass) {
    TripClass.economy => "Y",
    TripClass.comfort => "Y",
    TripClass.first => "C",
    TripClass.business => "C"
  };
}
