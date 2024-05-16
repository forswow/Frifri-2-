base class PassengersDto {
  PassengersDto({
    required this.adults,
    required this.children,
    required this.infants,
  });

  final int adults;
  final int children;
  final int infants;
}
