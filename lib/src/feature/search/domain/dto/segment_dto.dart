base class SegmentDto {
  SegmentDto({
    required this.origin,
    required this.destination,
    required this.date,
  });

  final String origin;
  final String destination;
  final String date;
}