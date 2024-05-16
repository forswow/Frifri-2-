import 'package:frifri/src/feature/search/domain/dto/passengers_dto.dart';
import 'package:frifri/src/feature/search/domain/dto/segment_dto.dart';

base class SearchDto {
  SearchDto({
    required this.marker,
    required this.host,
    required this.userIp,
    required this.locale,
    required this.passengers,
    required this.segments,
  });

  final String marker;
  final String host;
  final String userIp;
  final String locale;
  final PassengersDto passengers;
  final List<SegmentDto> segments;
}
