final class TicketRecordEntity {
  TicketRecordEntity({
    required this.origin,
    required this.destination,
    required this.index,
  });

  final String origin;
  final String destination;
  final int index;

  Map<String, dynamic> toMap() {
    return {
      'origin': origin,
      'destination': destination,
      'index': index,
    };
  }

  factory TicketRecordEntity.fromMap(Map<String, dynamic> map) {
    return TicketRecordEntity(
      origin: map['origin'] as String,
      destination: map['destination'] as String,
      index: map['index'] as int,
    );
  }

  @override
  String toString() {
    return 'TicketRecordEntity{origin: $origin, destination: $destination, index: $index}';
  }
}
