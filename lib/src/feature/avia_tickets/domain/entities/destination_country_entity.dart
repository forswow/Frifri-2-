class DestinationCountryEntity {
  DestinationCountryEntity({
    required this.id,
    required this.origin,
    required this.destination,
  });

  final int id;
  final String origin;
  final String destination;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'origin': origin,
      'destination': destination,
    };
  }

  factory DestinationCountryEntity.fromMap(Map<String, dynamic> map) {
    return DestinationCountryEntity(
      id: map['id'] as int,
      origin: map['origin'] as String,
      destination: map['destination'] as String,
    );
  }

  @override
  String toString() {
    return 'DestinationCountryEntity{id: $id, origin: $origin, destination: $destination}';
  }
}
