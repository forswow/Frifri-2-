import 'package:frifri/src/core/extensions/date_time.dart';

final class DirectFlightTransfer {
  DirectFlightTransfer({
    required this.origin,
    required this.destination,
    required this.departureAt,
    required this.returnAt,
    required this.oneWay,
    required this.direct,
    required this.market,
    required this.limit,
    required this.page,
    required this.sorting,
    required this.unique,
    required this.currency,
  });

  DirectFlightTransfer.optional({
    required final String currencyParam,
    required final String destinationParam,
    required final String originParam,
  })  : origin = originParam,
        destination = destinationParam,
        currency = currencyParam,
        // departureAt = DateTime.now().getNowParseDate,
        // returnAt = DateTime.now().getLastMonthDay,

        departureAt = '2024-06-01',
        returnAt = '2024-06-30',

        oneWay = true,
        direct = true,
        market = 'ru',
        page = 1,
        limit = 30,
        unique = false,
        sorting = 'price';

  final String currency;
  final String origin;
  final String destination;
  final String departureAt;
  final String returnAt;
  final bool oneWay;
  final bool direct;
  final String market;
  final int limit;
  final int page;
  final String sorting;
  final bool unique;

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'origin': origin,
      'destination': destination,
      'departure_at': departureAt,
      'return_at': returnAt,
      'one_way': oneWay,
      'direct': direct,
      'market': market,
      'limit': limit,
      'page': page,
      'sorting': sorting,
      'unique': unique,
    };
  }

  factory DirectFlightTransfer.fromMap(Map<String, dynamic> map) {
    return DirectFlightTransfer(
      currency: map['currency'] as String,
      origin: map['origin'] as String,
      destination: map['destination'] as String,
      departureAt: map['departureAt'] as String,
      returnAt: map['returnAt'] as String,
      oneWay: map['oneWay'] as bool,
      direct: map['direct'] as bool,
      market: map['market'] as String,
      limit: map['limit'] as int,
      page: map['page'] as int,
      sorting: map['sorting'] as String,
      unique: map['unique'] as bool,
    );
  }
}
