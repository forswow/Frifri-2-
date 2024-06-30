// To parse this JSON data, do
//
//     final ticketsSearchQuery = ticketsSearchQueryFromJson(jsonString);

import 'dart:convert';

import 'package:frifri/src/feature/shared/data/dto/ticket_search_query.dart';

TicketsSearchIdResult ticketsSearchIdResultFromJson(String str) =>
    TicketsSearchIdResult.fromJson(json.decode(str));

String ticketsSearchIdResultToJson(TicketsSearchIdResult data) =>
    json.encode(data.toJson());

class TicketsSearchIdResult {
  final String searchId;
  final List<Segment> segments;
  final Passengers passengers;
  final String currency;
  final String locale;
  final String cleanMarker;
  final bool travelpayoutsApiRequest;
  final bool knowEnglish;
  final Map<String, double> currencyRates;
  final Meta meta;
  final AirlineRules tariffMapping;
  final AirlineRules airlineRules;
  final String market;
  final String marker;
  final bool openJaw;
  final bool internal;
  final bool affiliate;
  final String tripClass;
  final bool range;
  final String serverName;
  final DateTime initiatedAt;
  final String originCountry;
  final String destinationCountry;
  final Map<String, MetropolyAirport> metropolyAirports;
  final String host;
  final double startSearchTimestamp;
  final int searchDepth;
  final bool showAds;
  final AdsenseQuery adsenseQuery;
  final AirlineFeatures airlineFeatures;
  final dynamic tags;

  TicketsSearchIdResult({
    required this.searchId,
    required this.segments,
    required this.passengers,
    required this.currency,
    required this.locale,
    required this.cleanMarker,
    required this.travelpayoutsApiRequest,
    required this.knowEnglish,
    required this.currencyRates,
    required this.meta,
    required this.tariffMapping,
    required this.airlineRules,
    required this.market,
    required this.marker,
    required this.openJaw,
    required this.internal,
    required this.affiliate,
    required this.tripClass,
    required this.range,
    required this.serverName,
    required this.initiatedAt,
    required this.originCountry,
    required this.destinationCountry,
    required this.metropolyAirports,
    required this.host,
    required this.startSearchTimestamp,
    required this.searchDepth,
    required this.showAds,
    required this.adsenseQuery,
    required this.airlineFeatures,
    required this.tags,
  });

  factory TicketsSearchIdResult.fromJson(Map<String, dynamic> json) =>
      TicketsSearchIdResult(
        searchId: json['search_id'],
        segments: List<Segment>.from(
            json['segments'].map((x) => Segment.fromJson(x))),
        passengers: Passengers.fromJson(json['passengers']),
        currency: json['currency'],
        locale: json['locale'],
        cleanMarker: json['clean_marker'],
        travelpayoutsApiRequest: json['travelpayouts_api_request'],
        knowEnglish: json['know_english'],
        currencyRates: Map.from(json['currency_rates'])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        meta: Meta.fromJson(json['meta']),
        tariffMapping: AirlineRules.fromJson(json['tariff_mapping']),
        airlineRules: AirlineRules.fromJson(json['airline_rules']),
        market: json['market'],
        marker: json['marker'],
        openJaw: json['open_jaw'],
        internal: json['internal'],
        affiliate: json['affiliate'],
        tripClass: json['trip_class'],
        range: json['range'],
        serverName: json['server_name'],
        initiatedAt: DateTime.parse(json['initiated_at']),
        originCountry: json['origin_country'],
        destinationCountry: json['destination_country'],
        metropolyAirports: Map.from(json['metropoly_airports']).map((k, v) =>
            MapEntry<String, MetropolyAirport>(
                k, MetropolyAirport.fromJson(v))),
        host: json['host'],
        startSearchTimestamp: json['start_search_timestamp']?.toDouble(),
        searchDepth: json['search_depth'],
        showAds: json['show_ads'],
        adsenseQuery: AdsenseQuery.fromJson(json['adsense_query']),
        airlineFeatures: AirlineFeatures.fromJson(json['airline_features']),
        tags: json['tags'],
      );

  Map<String, dynamic> toJson() => {
        'search_id': searchId,
        'segments': List<dynamic>.from(segments.map((x) => x.toJson())),
        'passengers': passengers.toJson(),
        'currency': currency,
        'locale': locale,
        'clean_marker': cleanMarker,
        'travelpayouts_api_request': travelpayoutsApiRequest,
        'know_english': knowEnglish,
        'currency_rates': Map.from(currencyRates)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'meta': meta.toJson(),
        'tariff_mapping': tariffMapping.toJson(),
        'airline_rules': airlineRules.toJson(),
        'market': market,
        'marker': marker,
        'open_jaw': openJaw,
        'internal': internal,
        'affiliate': affiliate,
        'trip_class': tripClass,
        'range': range,
        'server_name': serverName,
        'initiated_at': initiatedAt.toIso8601String(),
        'origin_country': originCountry,
        'destination_country': destinationCountry,
        'metropoly_airports': Map.from(metropolyAirports)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'host': host,
        'start_search_timestamp': startSearchTimestamp,
        'search_depth': searchDepth,
        'show_ads': showAds,
        'adsense_query': adsenseQuery.toJson(),
        'airline_features': airlineFeatures.toJson(),
        'tags': tags,
      };
}

class AdsenseQuery {
  final String query;
  final Ad adTop;
  final Ad adFooter;
  final Ad adThird;
  final PageOptions adTopPageOptions;
  final PageOptions pageOptions;

  AdsenseQuery({
    required this.query,
    required this.adTop,
    required this.adFooter,
    required this.adThird,
    required this.adTopPageOptions,
    required this.pageOptions,
  });

  factory AdsenseQuery.fromJson(Map<String, dynamic> json) => AdsenseQuery(
        query: json['query'],
        adTop: Ad.fromJson(json['ad_top']),
        adFooter: Ad.fromJson(json['ad_footer']),
        adThird: Ad.fromJson(json['ad_third']),
        adTopPageOptions: PageOptions.fromJson(json['ad_top_page_options']),
        pageOptions: PageOptions.fromJson(json['page_options']),
      );

  Map<String, dynamic> toJson() => {
        'query': query,
        'ad_top': adTop.toJson(),
        'ad_footer': adFooter.toJson(),
        'ad_third': adThird.toJson(),
        'ad_top_page_options': adTopPageOptions.toJson(),
        'page_options': pageOptions.toJson(),
      };
}

class Ad {
  final String colorBackground;
  final String container;
  final int fontSizeTitle;
  final int lines;
  final String linkTarget;
  final String width;
  final int number;
  final String colorDomainLink;
  final String colorText;
  final String colorTitleLink;
  final bool detailedAttribution;
  final bool longerHeadlines;
  final int maxTop;

  Ad({
    required this.colorBackground,
    required this.container,
    required this.fontSizeTitle,
    required this.lines,
    required this.linkTarget,
    required this.width,
    required this.number,
    required this.colorDomainLink,
    required this.colorText,
    required this.colorTitleLink,
    required this.detailedAttribution,
    required this.longerHeadlines,
    required this.maxTop,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        colorBackground: json['colorBackground'],
        container: json['container'],
        fontSizeTitle: json['fontSizeTitle'],
        lines: json['lines'],
        linkTarget: json['linkTarget'],
        width: json['width'],
        number: json['number'],
        colorDomainLink: json['colorDomainLink'],
        colorText: json['colorText'],
        colorTitleLink: json['colorTitleLink'],
        detailedAttribution: json['detailedAttribution'],
        longerHeadlines: json['longerHeadlines'],
        maxTop: json['maxTop'],
      );

  Map<String, dynamic> toJson() => {
        'colorBackground': colorBackground,
        'container': container,
        'fontSizeTitle': fontSizeTitle,
        'lines': lines,
        'linkTarget': linkTarget,
        'width': width,
        'number': number,
        'colorDomainLink': colorDomainLink,
        'colorText': colorText,
        'colorTitleLink': colorTitleLink,
        'detailedAttribution': detailedAttribution,
        'longerHeadlines': longerHeadlines,
        'maxTop': maxTop,
      };
}

class PageOptions {
  final bool siteLinks;
  final int adPage;
  final String channel;
  final String hl;
  final String pubId;

  PageOptions({
    required this.siteLinks,
    required this.adPage,
    required this.channel,
    required this.hl,
    required this.pubId,
  });

  factory PageOptions.fromJson(Map<String, dynamic> json) => PageOptions(
        siteLinks: json['siteLinks'],
        adPage: json['adPage'],
        channel: json['channel'],
        hl: json['hl'],
        pubId: json['pubID'],
      );

  Map<String, dynamic> toJson() => {
        'siteLinks': siteLinks,
        'adPage': adPage,
        'channel': channel,
        'hl': hl,
        'pubID': pubId,
      };
}

class AirlineFeatures {
  final Dd dd;
  final Su su;

  AirlineFeatures({
    required this.dd,
    required this.su,
  });

  factory AirlineFeatures.fromJson(Map<String, dynamic> json) =>
      AirlineFeatures(
        dd: Dd.fromJson(json['DD']),
        su: Su.fromJson(json['SU']),
      );

  Map<String, dynamic> toJson() => {
        'DD': dd.toJson(),
        'SU': su.toJson(),
      };
}

class Dd {
  final String borts;
  final bool isFree;
  final String descr;

  Dd({
    required this.borts,
    required this.isFree,
    required this.descr,
  });

  factory Dd.fromJson(Map<String, dynamic> json) => Dd(
        borts: json['borts'],
        isFree: json['is_free'],
        descr: json['descr'],
      );

  Map<String, dynamic> toJson() => {
        'borts': borts,
        'is_free': isFree,
        'descr': descr,
      };
}

class Su {
  final List<String> borts;
  final bool isFree;
  final String descr;

  Su({
    required this.borts,
    required this.isFree,
    required this.descr,
  });

  factory Su.fromJson(Map<String, dynamic> json) => Su(
        borts: List<String>.from(json['borts'].map((x) => x)),
        isFree: json['is_free'],
        descr: json['descr'],
      );

  Map<String, dynamic> toJson() => {
        'borts': List<dynamic>.from(borts.map((x) => x)),
        'is_free': isFree,
        'descr': descr,
      };
}

class AirlineRules {
  AirlineRules();

  factory AirlineRules.fromJson(Map<String, dynamic> json) => AirlineRules();

  Map<String, dynamic> toJson() => {};
}

class Meta {
  final String uuid;

  Meta({
    required this.uuid,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        uuid: json['uuid'],
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
      };
}

class MetropolyAirport {
  final String code;
  final List<String> airports;
  final String timezone;

  MetropolyAirport({
    required this.code,
    required this.airports,
    required this.timezone,
  });

  factory MetropolyAirport.fromJson(Map<String, dynamic> json) =>
      MetropolyAirport(
        code: json['code'],
        airports: List<String>.from(json['airports'].map((x) => x)),
        timezone: json['timezone'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'airports': List<dynamic>.from(airports.map((x) => x)),
        'timezone': timezone,
      };
}
