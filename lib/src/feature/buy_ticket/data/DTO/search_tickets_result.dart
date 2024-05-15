// To parse this JSON data, do
//
//     final ticketsSearchResultBySearchId = ticketsSearchResultBySearchIdFromJson(jsonString);

import 'dart:convert';

List<TicketsSearchResultBySearchId> ticketsSearchResultBySearchIdFromJson(
        String str) =>
    List<TicketsSearchResultBySearchId>.from(
        json.decode(str).map((x) => TicketsSearchResultBySearchId.fromJson(x)));

String ticketsSearchResultBySearchIdToJson(
        List<TicketsSearchResultBySearchId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketsSearchResultBySearchId {
  final List<Proposal>? proposals;
  final Map<String, Airport>? airports;
  final String searchId;
  final String? chunkId;
  final Meta? meta;
  final Airlines? airlines;
  final Map<String, GatesInfo>? gatesInfo;
  final FlightInfo? flightInfo;
  final List<TicketsSearchResultBySearchIdSegment>? segments;
  final String? market;
  final String? cleanMarker;
  final bool? openJaw;
  final String? currency;
  final DateTime? initiatedAt;
  final FiltersBoundary? filtersBoundary;

  TicketsSearchResultBySearchId({
    this.proposals,
    this.airports,
    required this.searchId,
    this.chunkId,
    this.meta,
    this.airlines,
    this.gatesInfo,
    this.flightInfo,
    this.segments,
    this.market,
    this.cleanMarker,
    this.openJaw,
    this.currency,
    this.initiatedAt,
    this.filtersBoundary,
  });

  factory TicketsSearchResultBySearchId.fromJson(Map<String, dynamic> json) =>
      TicketsSearchResultBySearchId(
        proposals: json["proposals"] == null
            ? []
            : List<Proposal>.from(
                json["proposals"]!.map((x) => Proposal.fromJson(x))),
        airports: Map.from(json["airports"]!)
            .map((k, v) => MapEntry<String, Airport>(k, Airport.fromJson(v))),
        searchId: json["search_id"],
        chunkId: json["chunk_id"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        airlines: json["airlines"] == null
            ? null
            : Airlines.fromJson(json["airlines"]),
        gatesInfo: Map.from(json["gates_info"]!).map(
            (k, v) => MapEntry<String, GatesInfo>(k, GatesInfo.fromJson(v))),
        flightInfo: json["flight_info"] == null
            ? null
            : FlightInfo.fromJson(json["flight_info"]),
        segments: json["segments"] == null
            ? []
            : List<TicketsSearchResultBySearchIdSegment>.from(json["segments"]!
                .map((x) => TicketsSearchResultBySearchIdSegment.fromJson(x))),
        market: json["market"],
        cleanMarker: json["clean_marker"],
        openJaw: json["open_jaw"],
        currency: json["currency"],
        initiatedAt: json["initiated_at"] == null
            ? null
            : DateTime.parse(json["initiated_at"]),
        filtersBoundary: json["filters_boundary"] == null
            ? null
            : FiltersBoundary.fromJson(json["filters_boundary"]),
      );

  Map<String, dynamic> toJson() => {
        "proposals": proposals == null
            ? []
            : List<dynamic>.from(proposals!.map((x) => x.toJson())),
        "airports": Map.from(airports!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "search_id": searchId,
        "chunk_id": chunkId,
        "meta": meta?.toJson(),
        "airlines": airlines?.toJson(),
        "gates_info": Map.from(gatesInfo!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "flight_info": flightInfo?.toJson(),
        "segments": segments == null
            ? []
            : List<dynamic>.from(segments!.map((x) => x.toJson())),
        "market": market,
        "clean_marker": cleanMarker,
        "open_jaw": openJaw,
        "currency": currency,
        "initiated_at": initiatedAt?.toIso8601String(),
        "filters_boundary": filtersBoundary?.toJson(),
      };
}

class Airlines {
  final The3F? b2;
  final The3F? pc;
  final The3F? a4;
  final The3F? tk;
  final The3F? the5F;
  final The3F? the5N;
  final The3F? the6R;
  final The3F? f7;
  final The3F? ut;
  final The3F? ji;
  final The3F? the3F;
  final The3F? su;
  final The3F? fv;
  final The3F? the5G;
  final The3F? u6;
  final The3F? a9;
  final The3F? s7;
  final The3F? dp;
  final The3F? ly;
  final The3F? iz;
  final The3F? j2;
  final The3F? xy;
  final The3F? f3;
  final The3F? ms;
  final The3F? dv;
  final The3F? hy;
  final The3F? ju;
  final The3F? fz;
  final The0T? the0T;

  Airlines({
    this.b2,
    this.pc,
    this.a4,
    this.tk,
    this.the5F,
    this.the5N,
    this.the6R,
    this.f7,
    this.ut,
    this.ji,
    this.the3F,
    this.su,
    this.fv,
    this.the5G,
    this.u6,
    this.a9,
    this.s7,
    this.dp,
    this.ly,
    this.iz,
    this.j2,
    this.xy,
    this.f3,
    this.ms,
    this.dv,
    this.hy,
    this.ju,
    this.fz,
    this.the0T,
  });

  factory Airlines.fromJson(Map<String, dynamic> json) => Airlines(
        b2: json["B2"] == null ? null : The3F.fromJson(json["B2"]),
        pc: json["PC"] == null ? null : The3F.fromJson(json["PC"]),
        a4: json["A4"] == null ? null : The3F.fromJson(json["A4"]),
        tk: json["TK"] == null ? null : The3F.fromJson(json["TK"]),
        the5F: json["5F"] == null ? null : The3F.fromJson(json["5F"]),
        the5N: json["5N"] == null ? null : The3F.fromJson(json["5N"]),
        the6R: json["6R"] == null ? null : The3F.fromJson(json["6R"]),
        f7: json["F7"] == null ? null : The3F.fromJson(json["F7"]),
        ut: json["UT"] == null ? null : The3F.fromJson(json["UT"]),
        ji: json["JI"] == null ? null : The3F.fromJson(json["JI"]),
        the3F: json["3F"] == null ? null : The3F.fromJson(json["3F"]),
        su: json["SU"] == null ? null : The3F.fromJson(json["SU"]),
        fv: json["FV"] == null ? null : The3F.fromJson(json["FV"]),
        the5G: json["5G"] == null ? null : The3F.fromJson(json["5G"]),
        u6: json["U6"] == null ? null : The3F.fromJson(json["U6"]),
        a9: json["A9"] == null ? null : The3F.fromJson(json["A9"]),
        s7: json["S7"] == null ? null : The3F.fromJson(json["S7"]),
        dp: json["DP"] == null ? null : The3F.fromJson(json["DP"]),
        ly: json["LY"] == null ? null : The3F.fromJson(json["LY"]),
        iz: json["IZ"] == null ? null : The3F.fromJson(json["IZ"]),
        j2: json["J2"] == null ? null : The3F.fromJson(json["J2"]),
        xy: json["XY"] == null ? null : The3F.fromJson(json["XY"]),
        f3: json["F3"] == null ? null : The3F.fromJson(json["F3"]),
        ms: json["MS"] == null ? null : The3F.fromJson(json["MS"]),
        dv: json["DV"] == null ? null : The3F.fromJson(json["DV"]),
        hy: json["HY"] == null ? null : The3F.fromJson(json["HY"]),
        ju: json["JU"] == null ? null : The3F.fromJson(json["JU"]),
        fz: json["FZ"] == null ? null : The3F.fromJson(json["FZ"]),
        the0T: json["0T"] == null ? null : The0T.fromJson(json["0T"]),
      );

  Map<String, dynamic> toJson() => {
        "B2": b2?.toJson(),
        "PC": pc?.toJson(),
        "A4": a4?.toJson(),
        "TK": tk?.toJson(),
        "5F": the5F?.toJson(),
        "5N": the5N?.toJson(),
        "6R": the6R?.toJson(),
        "F7": f7?.toJson(),
        "UT": ut?.toJson(),
        "JI": ji?.toJson(),
        "3F": the3F?.toJson(),
        "SU": su?.toJson(),
        "FV": fv?.toJson(),
        "5G": the5G?.toJson(),
        "U6": u6?.toJson(),
        "A9": a9?.toJson(),
        "S7": s7?.toJson(),
        "DP": dp?.toJson(),
        "LY": ly?.toJson(),
        "IZ": iz?.toJson(),
        "J2": j2?.toJson(),
        "XY": xy?.toJson(),
        "F3": f3?.toJson(),
        "MS": ms?.toJson(),
        "DV": dv?.toJson(),
        "HY": hy?.toJson(),
        "JU": ju?.toJson(),
        "FZ": fz?.toJson(),
        "0T": the0T?.toJson(),
      };
}

class The3F {
  final String iata;
  final double averageRate;
  final int rates;
  final String name;
  final int? id;
  final String? brandColor;
  final bool? lowcost;
  final int? allianceId;
  final String? allianceName;

  The3F({
    required this.iata,
    required this.averageRate,
    required this.rates,
    required this.name,
    this.id,
    this.brandColor,
    this.lowcost,
    this.allianceId,
    this.allianceName,
  });

  factory The3F.fromJson(Map<String, dynamic> json) => The3F(
        iata: json["iata"],
        averageRate: json["average_rate"]?.toDouble(),
        rates: json["rates"],
        name: json["name"],
        id: json["id"],
        brandColor: json["brand_color"],
        lowcost: json["lowcost"],
        allianceId: json["alliance_id"],
        allianceName: json["alliance_name"],
      );

  Map<String, dynamic> toJson() => {
        "iata": iata,
        "average_rate": averageRate,
        "rates": rates,
        "name": name,
        "id": id,
        "brand_color": brandColor,
        "lowcost": lowcost,
        "alliance_id": allianceId,
        "alliance_name": allianceName,
      };
}

class The0T {
  final String iata;
  final String name;

  The0T({
    required this.iata,
    required this.name,
  });

  factory The0T.fromJson(Map<String, dynamic> json) => The0T(
        iata: json["iata"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iata": iata,
        "name": name,
      };
}

class Airport {
  final String name;
  final String city;
  final String cityCode;
  final String country;
  final String countryCode;
  final String timeZone;
  final Coordinates coordinates;

  Airport({
    required this.name,
    required this.city,
    required this.cityCode,
    required this.country,
    required this.countryCode,
    required this.timeZone,
    required this.coordinates,
  });

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        name: json["name"],
        city: json["city"],
        cityCode: json["city_code"],
        country: json["country"],
        countryCode: json["country_code"],
        timeZone: json["time_zone"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "city_code": cityCode,
        "country": country,
        "country_code": countryCode,
        "time_zone": timeZone,
        "coordinates": coordinates.toJson(),
      };
}

class Coordinates {
  final double lat;
  final double lon;

  Coordinates({
    required this.lat,
    required this.lon,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class FiltersBoundary {
  final Map<String, int> stopsCount;
  final ArrivalDatetime0 departureMinutes0;
  final Time0 arrivalTime0;
  final ArrivalDatetime0 arrivalDatetime0;
  final Airports airports;
  final ArrivalDatetime0 flightsDuration;
  final ArrivalDatetime0 stopsDuration;
  final ArrivalDatetime0 price;
  final Time0 departureTime0;

  FiltersBoundary({
    required this.stopsCount,
    required this.departureMinutes0,
    required this.arrivalTime0,
    required this.arrivalDatetime0,
    required this.airports,
    required this.flightsDuration,
    required this.stopsDuration,
    required this.price,
    required this.departureTime0,
  });

  factory FiltersBoundary.fromJson(Map<String, dynamic> json) =>
      FiltersBoundary(
        stopsCount: Map.from(json["stops_count"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        departureMinutes0:
            ArrivalDatetime0.fromJson(json["departure_minutes_0"]),
        arrivalTime0: Time0.fromJson(json["arrival_time_0"]),
        arrivalDatetime0: ArrivalDatetime0.fromJson(json["arrival_datetime_0"]),
        airports: Airports.fromJson(json["airports"]),
        flightsDuration: ArrivalDatetime0.fromJson(json["flights_duration"]),
        stopsDuration: ArrivalDatetime0.fromJson(json["stops_duration"]),
        price: ArrivalDatetime0.fromJson(json["price"]),
        departureTime0: Time0.fromJson(json["departure_time_0"]),
      );

  Map<String, dynamic> toJson() => {
        "stops_count":
            Map.from(stopsCount).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "departure_minutes_0": departureMinutes0.toJson(),
        "arrival_time_0": arrivalTime0.toJson(),
        "arrival_datetime_0": arrivalDatetime0.toJson(),
        "airports": airports.toJson(),
        "flights_duration": flightsDuration.toJson(),
        "stops_duration": stopsDuration.toJson(),
        "price": price.toJson(),
        "departure_time_0": departureTime0.toJson(),
      };
}

class Airports {
  final List<String> arrival;
  final List<String> departure;

  Airports({
    required this.arrival,
    required this.departure,
  });

  factory Airports.fromJson(Map<String, dynamic> json) => Airports(
        arrival: List<String>.from(json["arrival"].map((x) => x)),
        departure: List<String>.from(json["departure"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "arrival": List<dynamic>.from(arrival.map((x) => x)),
        "departure": List<dynamic>.from(departure.map((x) => x)),
      };
}

class ArrivalDatetime0 {
  final int max;
  final double min;

  ArrivalDatetime0({
    required this.max,
    required this.min,
  });

  factory ArrivalDatetime0.fromJson(Map<String, dynamic> json) =>
      ArrivalDatetime0(
        max: json["max"],
        min: json["min"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}

class Time0 {
  final String max;
  final String min;

  Time0({
    required this.max,
    required this.min,
  });

  factory Time0.fromJson(Map<String, dynamic> json) => Time0(
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}

class FlightInfo {
  FlightInfo();

  factory FlightInfo.fromJson(Map<String, dynamic> json) => FlightInfo();

  Map<String, dynamic> toJson() => {};
}

class GatesInfo {
  final int id;
  final String label;
  final List<String> paymentMethods;
  final int productivity;
  final String currencyCode;
  final bool? mobileVersion;
  final List<String>? airlineIatas;
  final bool? isAirline;

  GatesInfo({
    required this.id,
    required this.label,
    required this.paymentMethods,
    required this.productivity,
    required this.currencyCode,
    this.mobileVersion,
    this.airlineIatas,
    this.isAirline,
  });

  factory GatesInfo.fromJson(Map<String, dynamic> json) => GatesInfo(
        id: json["id"],
        label: json["label"],
        paymentMethods:
            List<String>.from(json["payment_methods"].map((x) => x)),
        productivity: json["productivity"],
        currencyCode: json["currency_code"],
        mobileVersion: json["mobile_version"],
        airlineIatas: json["airline_iatas"] == null
            ? []
            : List<String>.from(json["airline_iatas"]!.map((x) => x)),
        isAirline: json["is_airline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "payment_methods": List<dynamic>.from(paymentMethods.map((x) => x)),
        "productivity": productivity,
        "currency_code": currencyCode,
        "mobile_version": mobileVersion,
        "airline_iatas": airlineIatas == null
            ? []
            : List<dynamic>.from(airlineIatas!.map((x) => x)),
        "is_airline": isAirline,
      };
}

class Meta {
  final String uuid;
  final List<Gate> gates;

  Meta({
    required this.uuid,
    required this.gates,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        uuid: json["uuid"],
        gates: List<Gate>.from(json["gates"].map((x) => Gate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "gates": List<dynamic>.from(gates.map((x) => x.toJson())),
      };
}

class Gate {
  final int count;
  final int goodCount;
  final BadCount badCount;
  final double duration;
  final int id;
  final String gateLabel;
  final int mergedCodeshares;
  final Error error;
  final double createdAt;
  final String serverName;
  final bool cache;
  final String cacheSearchUuid;

  Gate({
    required this.count,
    required this.goodCount,
    required this.badCount,
    required this.duration,
    required this.id,
    required this.gateLabel,
    required this.mergedCodeshares,
    required this.error,
    required this.createdAt,
    required this.serverName,
    required this.cache,
    required this.cacheSearchUuid,
  });

  factory Gate.fromJson(Map<String, dynamic> json) => Gate(
        count: json["count"],
        goodCount: json["good_count"],
        badCount: BadCount.fromJson(json["bad_count"]),
        duration: json["duration"]?.toDouble(),
        id: json["id"],
        gateLabel: json["gate_label"],
        mergedCodeshares: json["merged_codeshares"],
        error: Error.fromJson(json["error"]),
        createdAt: json["created_at"]?.toDouble(),
        serverName: json["server_name"],
        cache: json["cache"],
        cacheSearchUuid: json["cache_search_uuid"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "good_count": goodCount,
        "bad_count": badCount.toJson(),
        "duration": duration,
        "id": id,
        "gate_label": gateLabel,
        "merged_codeshares": mergedCodeshares,
        "error": error.toJson(),
        "created_at": createdAt,
        "server_name": serverName,
        "cache": cache,
        "cache_search_uuid": cacheSearchUuid,
      };
}

class BadCount {
  final int? datesOutOfExactDates;
  final int? mergedCauseNotUniqueFareCode;
  final int? empty;

  BadCount({
    this.datesOutOfExactDates,
    this.mergedCauseNotUniqueFareCode,
    this.empty,
  });

  factory BadCount.fromJson(Map<String, dynamic> json) => BadCount(
        datesOutOfExactDates: json["dates out of exact dates"],
        mergedCauseNotUniqueFareCode: json["merged cause not unique fare code"],
        empty: json["фильтруем другие классы при запросе эконома"],
      );

  Map<String, dynamic> toJson() => {
        "dates out of exact dates": datesOutOfExactDates,
        "merged cause not unique fare code": mergedCauseNotUniqueFareCode,
        "фильтруем другие классы при запросе эконома": empty,
      };
}

class Error {
  final int code;
  final String tos;

  Error({
    required this.code,
    required this.tos,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        tos: json["tos"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "tos": tos,
      };
}

class Proposal {
  final Map<String, Term> terms;
  final Map<String, Xterm> xterms;
  final List<ProposalSegment> segment;
  final int totalDuration;
  final List<String> stopsAirports;
  final bool isCharter;
  final int maxStops;
  final int maxStopDuration;
  final int? minStopDuration;
  final List<String> carriers;
  final List<int> segmentDurations;
  final List<List<int>> segmentsTime;
  final List<List<String>> segmentsAirports;
  final String sign;
  final bool isDirect;
  final double flightWeight;
  final int popularity;
  final double segmentsRating;
  final List<String>? tags;
  final String validatingCarrier;

  Proposal({
    required this.terms,
    required this.xterms,
    required this.segment,
    required this.totalDuration,
    required this.stopsAirports,
    required this.isCharter,
    required this.maxStops,
    required this.maxStopDuration,
    this.minStopDuration,
    required this.carriers,
    required this.segmentDurations,
    required this.segmentsTime,
    required this.segmentsAirports,
    required this.sign,
    required this.isDirect,
    required this.flightWeight,
    required this.popularity,
    required this.segmentsRating,
    this.tags,
    required this.validatingCarrier,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        terms: Map.from(json["terms"])
            .map((k, v) => MapEntry<String, Term>(k, Term.fromJson(v))),
        xterms: Map.from(json["xterms"])
            .map((k, v) => MapEntry<String, Xterm>(k, Xterm.fromJson(v))),
        segment: List<ProposalSegment>.from(
            json["segment"].map((x) => ProposalSegment.fromJson(x))),
        totalDuration: json["total_duration"],
        stopsAirports: List<String>.from(json["stops_airports"].map((x) => x)),
        isCharter: json["is_charter"],
        maxStops: json["max_stops"],
        maxStopDuration: json["max_stop_duration"],
        minStopDuration: json["min_stop_duration"],
        carriers: List<String>.from(json["carriers"].map((x) => x)),
        segmentDurations:
            List<int>.from(json["segment_durations"].map((x) => x)),
        segmentsTime: List<List<int>>.from(
            json["segments_time"].map((x) => List<int>.from(x.map((x) => x)))),
        segmentsAirports: List<List<String>>.from(json["segments_airports"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        sign: json["sign"],
        isDirect: json["is_direct"],
        flightWeight: json["flight_weight"]?.toDouble(),
        popularity: json["popularity"],
        segmentsRating: json["segments_rating"]?.toDouble(),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        validatingCarrier: json["validating_carrier"],
      );

  Map<String, dynamic> toJson() => {
        "terms": Map.from(terms)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "xterms": Map.from(xterms)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "segment": List<dynamic>.from(segment.map((x) => x.toJson())),
        "total_duration": totalDuration,
        "stops_airports": List<dynamic>.from(stopsAirports.map((x) => x)),
        "is_charter": isCharter,
        "max_stops": maxStops,
        "max_stop_duration": maxStopDuration,
        "min_stop_duration": minStopDuration,
        "carriers": List<dynamic>.from(carriers.map((x) => x)),
        "segment_durations": List<dynamic>.from(segmentDurations.map((x) => x)),
        "segments_time": List<dynamic>.from(
            segmentsTime.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "segments_airports": List<dynamic>.from(
            segmentsAirports.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "sign": sign,
        "is_direct": isDirect,
        "flight_weight": flightWeight,
        "popularity": popularity,
        "segments_rating": segmentsRating,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "validating_carrier": validatingCarrier,
      };
}

class ProposalSegment {
  final List<Flight> flight;
  final Rating rating;
  final List<Transfer>? transfers;

  ProposalSegment({
    required this.flight,
    required this.rating,
    this.transfers,
  });

  factory ProposalSegment.fromJson(Map<String, dynamic> json) =>
      ProposalSegment(
        flight:
            List<Flight>.from(json["flight"].map((x) => Flight.fromJson(x))),
        rating: Rating.fromJson(json["rating"]),
        transfers: json["transfers"] == null
            ? []
            : List<Transfer>.from(
                json["transfers"]!.map((x) => Transfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flight": List<dynamic>.from(flight.map((x) => x.toJson())),
        "rating": rating.toJson(),
        "transfers": transfers == null
            ? []
            : List<dynamic>.from(transfers!.map((x) => x.toJson())),
      };
}

class Flight {
  final String? aircraft;
  final String arrival;
  final DateTime arrivalDate;
  final String arrivalTime;
  final int arrivalTimestamp;
  final int delay;
  final String departure;
  final DateTime departureDate;
  final String departureTime;
  final int departureTimestamp;
  final int duration;
  final String? equipment;
  final int localArrivalTimestamp;
  final int localDepartureTimestamp;
  final String marketingCarrier;
  final String number;
  final String operatingCarrier;
  final String operatedBy;
  final int rating;
  final dynamic technicalStops;
  final String tripClass;
  final int? seats;

  Flight({
    this.aircraft,
    required this.arrival,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.arrivalTimestamp,
    required this.delay,
    required this.departure,
    required this.departureDate,
    required this.departureTime,
    required this.departureTimestamp,
    required this.duration,
    this.equipment,
    required this.localArrivalTimestamp,
    required this.localDepartureTimestamp,
    required this.marketingCarrier,
    required this.number,
    required this.operatingCarrier,
    required this.operatedBy,
    required this.rating,
    required this.technicalStops,
    required this.tripClass,
    this.seats,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        aircraft: json["aircraft"],
        arrival: json["arrival"],
        arrivalDate: DateTime.parse(json["arrival_date"]),
        arrivalTime: json["arrival_time"],
        arrivalTimestamp: json["arrival_timestamp"],
        delay: json["delay"],
        departure: json["departure"],
        departureDate: DateTime.parse(json["departure_date"]),
        departureTime: json["departure_time"],
        departureTimestamp: json["departure_timestamp"],
        duration: json["duration"],
        equipment: json["equipment"],
        localArrivalTimestamp: json["local_arrival_timestamp"],
        localDepartureTimestamp: json["local_departure_timestamp"],
        marketingCarrier: json["marketing_carrier"],
        number: json["number"],
        operatingCarrier: json["operating_carrier"],
        operatedBy: json["operated_by"],
        rating: json["rating"],
        technicalStops: json["technical_stops"],
        tripClass: json["trip_class"],
        seats: json["seats"],
      );

  Map<String, dynamic> toJson() => {
        "aircraft": aircraft,
        "arrival": arrival,
        "arrival_date":
            "${arrivalDate.year.toString().padLeft(4, '0')}-${arrivalDate.month.toString().padLeft(2, '0')}-${arrivalDate.day.toString().padLeft(2, '0')}",
        "arrival_time": arrivalTime,
        "arrival_timestamp": arrivalTimestamp,
        "delay": delay,
        "departure": departure,
        "departure_date":
            "${departureDate.year.toString().padLeft(4, '0')}-${departureDate.month.toString().padLeft(2, '0')}-${departureDate.day.toString().padLeft(2, '0')}",
        "departure_time": departureTime,
        "departure_timestamp": departureTimestamp,
        "duration": duration,
        "equipment": equipment,
        "local_arrival_timestamp": localArrivalTimestamp,
        "local_departure_timestamp": localDepartureTimestamp,
        "marketing_carrier": marketingCarrier,
        "number": number,
        "operating_carrier": operatingCarrier,
        "operated_by": operatedBy,
        "rating": rating,
        "technical_stops": technicalStops,
        "trip_class": tripClass,
        "seats": seats,
      };
}

class Rating {
  final double total;
  final Detailed detailed;

  Rating({
    required this.total,
    required this.detailed,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        total: json["total"]?.toDouble(),
        detailed: Detailed.fromJson(json["detailed"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "detailed": detailed.toJson(),
      };
}

class Detailed {
  final double departureTime;
  final double arrivalTime;
  final double transfer;

  Detailed({
    required this.departureTime,
    required this.arrivalTime,
    required this.transfer,
  });

  factory Detailed.fromJson(Map<String, dynamic> json) => Detailed(
        departureTime: json["departure_time"]?.toDouble(),
        arrivalTime: json["arrival_time"]?.toDouble(),
        transfer: json["transfer"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "departure_time": departureTime,
        "arrival_time": arrivalTime,
        "transfer": transfer,
      };
}

class Transfer {
  final String at;
  final String to;
  final List<String> airports;
  final List<String> airlines;
  final String countryCode;
  final String cityCode;
  final VisaRules visaRules;
  final bool nightTransfer;
  final List<String> tags;
  final int durationSeconds;
  final Duration duration;
  final bool? recheckBaggage;

  Transfer({
    required this.at,
    required this.to,
    required this.airports,
    required this.airlines,
    required this.countryCode,
    required this.cityCode,
    required this.visaRules,
    required this.nightTransfer,
    required this.tags,
    required this.durationSeconds,
    required this.duration,
    this.recheckBaggage,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        at: json["at"],
        to: json["to"],
        airports: List<String>.from(json["airports"].map((x) => x)),
        airlines: List<String>.from(json["airlines"].map((x) => x)),
        countryCode: json["country_code"],
        cityCode: json["city_code"],
        visaRules: VisaRules.fromJson(json["visa_rules"]),
        nightTransfer: json["night_transfer"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        durationSeconds: json["duration_seconds"],
        duration: Duration.fromJson(json["duration"]),
        recheckBaggage: json["recheck_baggage"],
      );

  Map<String, dynamic> toJson() => {
        "at": at,
        "to": to,
        "airports": List<dynamic>.from(airports.map((x) => x)),
        "airlines": List<dynamic>.from(airlines.map((x) => x)),
        "country_code": countryCode,
        "city_code": cityCode,
        "visa_rules": visaRules.toJson(),
        "night_transfer": nightTransfer,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "duration_seconds": durationSeconds,
        "duration": duration.toJson(),
        "recheck_baggage": recheckBaggage,
      };
}

class Duration {
  final int seconds;

  Duration({
    required this.seconds,
  });

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        seconds: json["seconds"],
      );

  Map<String, dynamic> toJson() => {
        "seconds": seconds,
      };
}

class VisaRules {
  final bool required;

  VisaRules({
    required this.required,
  });

  factory VisaRules.fromJson(Map<String, dynamic> json) => VisaRules(
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "required": required,
      };
}

class Term {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<TermFlightAdditionalTariffInfo?>> flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Term({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<TermFlightAdditionalTariffInfo?>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<TermFlightAdditionalTariffInfo?>.from(x.map((x) =>
                        x == null
                            ? null
                            : TermFlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x?.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class TermFlightAdditionalTariffInfo {
  final TentacledFlight? returnBeforeFlight;
  final PurpleFlight? changeBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final PurpleFlight? changeAfterFlight;

  TermFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.changeBeforeFlight,
    this.returnAfterFlight,
    this.changeAfterFlight,
  });

  factory TermFlightAdditionalTariffInfo.fromJson(Map<String, dynamic> json) =>
      TermFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["return_before_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : PurpleFlight.fromJson(json["change_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : PurpleFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class PurpleFlight {
  final bool available;
  final PurplePenalty? penalty;

  PurpleFlight({
    required this.available,
    this.penalty,
  });

  factory PurpleFlight.fromJson(Map<String, dynamic> json) => PurpleFlight(
        available: json["available"],
        penalty: json["penalty"] == null
            ? null
            : PurplePenalty.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "penalty": penalty?.toJson(),
      };
}

class PurplePenalty {
  final String currencyCode;
  final int? value;

  PurplePenalty({
    required this.currencyCode,
    this.value,
  });

  factory PurplePenalty.fromJson(Map<String, dynamic> json) => PurplePenalty(
        currencyCode: json["currency_code"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "value": value,
      };
}

class FluffyFlight {
  final bool available;

  FluffyFlight({
    required this.available,
  });

  factory FluffyFlight.fromJson(Map<String, dynamic> json) => FluffyFlight(
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
      };
}

class TentacledFlight {
  final bool available;
  final FluffyPenalty? penalty;

  TentacledFlight({
    required this.available,
    this.penalty,
  });

  factory TentacledFlight.fromJson(Map<String, dynamic> json) =>
      TentacledFlight(
        available: json["available"],
        penalty: json["penalty"] == null
            ? null
            : FluffyPenalty.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "penalty": penalty?.toJson(),
      };
}

class FluffyPenalty {
  final String currencyCode;

  FluffyPenalty({
    required this.currencyCode,
  });

  factory FluffyPenalty.fromJson(Map<String, dynamic> json) => FluffyPenalty(
        currencyCode: json["currency_code"],
      );

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
      };
}

class Xterm {
  final Yflxtr1Yflxtr1? yflxtr1Yflxtr1;
  final Eowbyd1SEowbyd1S? eowbyd1SEowbyd1S;
  final The412C5F6D0? qltow;
  final The412C5F6D1? qflow;
  final The412C5F6D1? yow;
  final EycloHtlgo? y0PcY1Pc23;
  final Aflxtr2Aflxtr2? y1Pc30Y1Pc30;
  final Y0Pc? y0PcY0Pc;
  final EnorWtbsowWtbsowClass? oallWtbsowWtbsow;
  final The412C5F6D1? oadWtsdowWtsdow;
  final VprowWtbsowWtbsow? vprowWtbsowWtbsow;
  final The412C5F6D1? tadWtsdowWtsdow;
  final EnorWtbsowWtbsowClass? teconallWtbsowWtbsow;
  final OwWtbsowWtbsow? pltowWtbsowWtbsow;
  final OwWtbsowWtbsow? tltcsowWtbsowWtbsow;
  final The412C5F6D1? pstdowWtsdowWtsdow;
  final The412C5F6D1? tstdcsowWtsdowWtsdow;
  final ObsowTbsow? obsowTbsow;
  final Aflxtr2Aflxtr2? osdowTsdow;
  final The412C5F6D0? lltowTbsow;
  final The412C5F6D1? lstdowTsdow;
  final The412C5F6D0? oprowWtbsowWtbsow;
  final EflowY1Pc20? oecowWtsdowWtsdow;
  final The412C5F6D1? eecowTsdow;
  final The412C5F6D0? eprowTbsow;
  final WprowWtbsowWtbsow? wprowWtbsowWtbsow;
  final EflowY1Pc20? wecowWtsdowWtsdow;
  final EnorWtbsowWtbsowClass? gnorWtbsowWtbsow;
  final The412C5F6D1? gcorWtsdowWtsdow;
  final The412C5F6D0? rnoTbsow;
  final The412C5F6D1? rcoTsdow;
  final The412C5F6D0? vstdowTbsow;
  final EnorWtbsowWtbsowClass? rnorWtbsowWtbsow;
  final The412C5F6D1? rcorWtsdowWtsdow;
  final The412C5F6D0? tstdowTbsow;
  final EnorWtbsowWtbsowClass? nnorWtbsowWtbsow;
  final The412C5F6D1? ncorWtsdowWtsdow;
  final EycloHtlgo? vowTbsow;
  final EnorWtbsowWtbsowClass? enorWtbsowWtbsow;
  final The412C5F6D1? ecorWtsdowWtsdow;
  final The412C5F6D1? padEtlgo;
  final The412C5F6D0? promoallEtclo;
  final The412C5F6D0? gpriowEtclo;
  final The412C5F6D1? geciowEtlgo;
  final EnoYflx1? xallPowQaowTwebYr;
  final The412C5F6D0? xallQaowZwebInt;
  final The412C5F6D1? xadZow1SqZow1Sq;
  final EycloHtclo? row2Vow1Tbsow;
  final Aflxtr2Aflxtr2? vow2Vow1Tsdow;
  final The412C5F6D0? xallIaowZwebInt;
  final The412C5F6D0? lltowEwebbyd3Ewebbyd3;
  final The412C5F6D1? lstdowEowbyd1SEowbyd1S;
  final The412C5F6D0? hltowQnoQnoTbsow;
  final The412C5F6D1? hstdowQcoQcoTsdow;
  final The412C5F6D0? nbsowEtclo;
  final The412C5F6D1? nstowEtlgo;
  final The412C5F6D0? eprowEwebbyd3Ewebbyd3;
  final The412C5F6D1? eecowEowbyd1SEowbyd1S;
  final EycloHtlgo? gow1STwebYr;
  final The412C5F6D0? oprowGpriowEtclo;
  final EflowY1Pc20? oecowGeciowEtlgo;
  final The412C5F6D0? rnoEwebbyd3Ewebbyd3;
  final The412C5F6D1? rcoEowbyd1SEowbyd1S;
  final The412C5F6D0? tstdowEwebbyd3Ewebbyd3;
  final The412C5F6D0? gnoEtclo;
  final The412C5F6D1? gcoEtlgo;
  final The412C5F6D0? rnorGpriowEtclo;
  final The412C5F6D1? rcorGeciowEtlgo;
  final The412C5F6D0? oallEtcloEtclo;
  final The412C5F6D1? oadEtlgoEtlgo;
  final EnoYflx1? vprowEnoEtclo;
  final The412C5F6D0? promoallOltowEtclo;
  final The412C5F6D1? padOflowEtlgo;
  final The412C5F6D0? promoallAtclo;
  final The412C5F6D1? padAtlgo;
  final The412C5F6D0? oprowEnoEtclo;
  final EflowY1Pc20? oecowEcoEtlgo;
  final The412C5F6D0? teconallOpriowEtclo;
  final The412C5F6D1? tadOeciowEtlgo;
  final The412C5F6D0? gpriowAtclo;
  final The412C5F6D1? geciowAtlgo;
  final The412C5F6D0? gnorEnoEtclo;
  final The412C5F6D1? gcorEcoEtlgo;
  final The412C5F6D1? rstowOeciowEtlgo;
  final The412C5F6D0? rltowOpriowEtclo;
  final The412C5F6D0? rnorEnoEtclo;
  final The412C5F6D1? rcorEcoEtlgo;
  final The412C5F6D1? ecorOeciowEtlgo;
  final The412C5F6D0? enorOpriowEtclo;
  final The412C5F6D0? gnorNnoEtclo;
  final The412C5F6D1? gcorNcoEtlgo;
  final The412C5F6D0? nbsowAtclo;
  final The412C5F6D1? nstowAtlgo;
  final EycloHtlgo? gow1SEtcloEtclo;
  final The412C5F6D0? rnorNnoEtcloEtclo;
  final The412C5F6D1? rcorNcoEtlgoEtlgo;
  final EycloHtlgo? pow1SEtcloEtclo;
  final Aflxtr2Aflxtr2? tylgoTylgoEtlgo;
  final EycloHtclo? tycloTycloEtclo;
  final The412C5F6D0? gnoAtclo;
  final The412C5F6D1? gcoAtlgo;
  final N2Pxow? qn2PxowQn2Pxow;
  final EycloHtclo? qycloEtclo;
  final Aflxtr2Aflxtr2? qylgoEtlgo;
  final The412C5F6D1? ecoEtlgoEtlgo;
  final The412C5F6D0? enoEtcloEtclo;
  final The412C5F6D1? kcorOflowEtlgo;
  final The412C5F6D0? knorOltowEtclo;
  final N2Pxow? en2PxowEn2Pxow;
  final N2Pxow? sn2PxowSn2Pxow;
  final The412C5F6D1? vstdowTsdow;
  final Aflxtr2Aflxtr2? towTsdow;
  final Vrl1MpRxox? vrl1MpRxox;
  final The412C5F6D0? the412C5F6D0;
  final The412C5F6D1? the412C5F6D1;
  final The412C5F6D1? kstdowTsdow;
  final The412C5F6D1? lstdoxUsdox;
  final The412C5F6D0? kltowTbsow;
  final The412C5F6D0? lltoxUbsox;
  final The412C5F6D1? rflox;
  final The412C5F6D1? aox;
  final The412C5F6D0? rltox;
  final The412C5F6D0? snpUbsox;
  final The412C5F6D1? scpUsdox;
  final EycloHtlgo? ustdoxUbsox;
  final Aflxtr2Aflxtr2? tloyowTsdow;
  final Aflxtr2Aflxtr2? uloyoxUsdox;
  final EnoYflx1? promoallTow1S;
  final EnoYflx1? qromoalmUow1T;
  final The412C5F6D1? padTow1S;
  final The412C5F6D1? qaeUow1T;
  final The412C5F6D0? qltoxWltoxUbsox;
  final The412C5F6D0? pltowVltowTbsow;
  final The412C5F6D1? pstdowVstdowTsdow;
  final The412C5F6D1? qstdoxWstdoxUsdox;
  final The412C5F6D0? qromoalmFtclp;
  final The412C5F6D1? qaeFtlgp;
  final The412C5F6D0? hprioxFtclp;
  final The412C5F6D1? hecioxFtlgp;
  final EycloHtclo? sow3Wow2Ubsox;
  final Aflxtr2Aflxtr2? vow2Qow1Tsdow;
  final Aflxtr2Aflxtr2? wow3Row2Usdox;
  final EnoYflx1? nbsowTow1S;
  final EnoYflx1? obsoxUow1T;
  final The412C5F6D1? nstowTow1S;
  final The412C5F6D1? ostoxUow1T;
  final The412C5F6D0? lltoxObOb;
  final The412C5F6D1? lstdoxFowbyd1TFowbyd1T;
  final EycloHtclo? pbsoxObOb;
  final Aflxtr2Aflxtr2? psdoxFowbyd1TFowbyd1T;
  final The412C5F6D0? obsoxFtclp;
  final The412C5F6D1? ostoxFtlgp;
  final The412C5F6D0? bproxObOb;
  final The412C5F6D1? becoxFowbyd1TFowbyd1T;
  final EycloHtlgo? poxObOb;
  final Aflxtr2Aflxtr2? poxFowbyd1TFowbyd1T;
  final EycloHtlgo? wstdoxObOb;
  final Aflxtr2Aflxtr2? wloyoxFowbyd1TFowbyd1T;
  final EnoYflx1? gnoTow1S;
  final EnoYflx1? hnpUow1T;
  final The412C5F6D1? gcoTow1S;
  final The412C5F6D1? hcpUow1T;
  final The412C5F6D0? snpObOb;
  final The412C5F6D1? scpFowbyd1TFowbyd1T;
  final EycloHtlgo? ustdoxObOb;
  final Aflxtr2Aflxtr2? uloyoxFowbyd1TFowbyd1T;
  final The412C5F6D0? hnpFtclp;
  final The412C5F6D1? hcpFtlgp;
  final The412C5F6D0? qromoalmObObOb;
  final The412C5F6D0? hprioxObObOb;
  final Aflxtr2Aflxtr2? uowtrUowtrTow1S;
  final Aflxtr2Aflxtr2? vowtsVowtsUow1T;
  final EycloHtlgo? how1TFtclp;
  final Aflxtr2Aflxtr2? how1TFtlgp;
  final Aflxtr2Aflxtr2? how1TUow1T;
  final Aflxtr2Aflxtr2? uylgpUow1T;
  final EycloHtlgo? uyclpUow1T;
  final Aflxtr2Aflxtr2? tylgoTow1S;
  final Aflxtr2Aflxtr2? powtsPowtsFtlgp;
  final EycloHtlgo? powtsPowtsFtclp;
  final Aflxtr2Aflxtr2? oowtrOowtrEtlgo;
  final EycloHtclo? uyclpUyclpFtclp;
  final Aflxtr2Aflxtr2? uylgpUylgpFtlgp;
  final EycloHtclo? ryclpFtclp;
  final Aflxtr2Aflxtr2? rn2PxoxRn2Pxox;
  final Aflxtr2Aflxtr2? rylgpFtlgp;
  final Aflxtr2Aflxtr2? in2XoyIn2Xoy;
  final Hn2XoxHn2Xox? hn2XoxHn2Xox;
  final The412C5F6D1? qtsoQtsoTow1S;
  final The412C5F6D1? rtspRtspUow1T;
  final EycloHtclo? fyclpFtclp;
  final Aflxtr2Aflxtr2? eylgoEtlgo;
  final Aflxtr2Aflxtr2? fylgpFtlgp;
  final EycloHtlgo? icsorvIcsorvFtclp;
  final Aflxtr2Aflxtr2? hcsoruHcsoruEtlgo;
  final Aflxtr2Aflxtr2? icsorvIcsorvFtlgp;
  final EnoYflx1? qeconallYflx1;
  final EnoYflx1? reconalmAflx2;
  final The412C5F6D1? scpAflx2;
  final EnoYflx1? rnoYflx1;
  final EnoYflx1? snpAflx2;
  final The412C5F6D1? rcoYflx1;
  final Aflxtr2Aflxtr2? how1SrHow1SrFtlgp;
  final EycloHtlgo? how1SrHow1SrFtclp;
  final EnoYflx1? qlgt1Yflx1;
  final EycloHtlgo? rlgt2Aflx2;
  final Aflxtr2Aflxtr2? aflxtr2Aflxtr2;
  final Aflxtr2Aflxtr2? rsmt2Aflx2;
  final The412C5F6D1? qsmt1Yflx1;
  final Aflxtr2Aflxtr2? xrimspXlriegpUow1T;
  final Aflxtr2Aflxtr2? wrimsoWlriegoTow1S;
  final Aflxtr2Aflxtr2? rpr12MowTe12MowTow1S;
  final Aflxtr2Aflxtr2? spr12MoxUe12MoxUow1T;
  final EycloHtlgo? mowtsMowtsFtclp;
  final Aflxtr2Aflxtr2? lowtrLowtrEtlgo;
  final Aflxtr2Aflxtr2? mowtsMowtsFtlgp;
  final EycloHtlgo? qow1SrQow1SrFtclp;
  final Aflxtr2Aflxtr2? qow1SrQow1SrFtlgp;
  final EnoYflx1? enoYflx1;
  final EnoYflx1? fnpAflx2;
  final The412C5F6D1? ecoYflx1;
  final The412C5F6D1? fcpAflx2;
  final The412C5F6D1? hsmt1Yflx1;
  final Aflxtr2Aflxtr2? ismt2Aflx2;
  final EycloHtlgo? vow1SrVow1SrFtclp;
  final Aflxtr2Aflxtr2? uow1SqUow1SqEtlgo;
  final Aflxtr2Aflxtr2? vow1SrVow1SrFtlgp;
  final Aflxtr2Aflxtr2? fn2PxoxFn2Pxox;
  final EycloHtlgo? fowbyd1TFowbyd1TUbsox;
  final Aflxtr2Aflxtr2? fowbyd1TFowbyd1TUsdox;
  final Aflxtr2Aflxtr2? tn2PxoxTn2Pxox;
  final Ano1RWtbsowWtbsow? oallWFare0WFare0;
  final OadWtbsowWtbsow? oadWtbsowWtbsow;
  final Aco1RWtbsowWtbsowClass? omxWtbsowWtbsow;
  final EforWtbsowWtbsowClass? uflowWtbsowWtbsow;
  final UprowWtbsowWtbsow? uprowWtbsowWtbsow;
  final The412C5F6D0? uFare0WFare0WFare0;
  final EforWtbsowWtbsowClass? uecowWtbsowWtbsow;
  final OadWtbsowWtbsow? vprowWFare0WFare0;
  final Aco1RWtbsowWtbsowClass? vplowWtbsowWtbsow;
  final OadWtbsowWtbsow? tprowWtbsowWtbsow;
  final VpmowWtbsowWtbsow? vpmowWtbsowWtbsow;
  final Aco1RWtbsowWtbsowClass? tplowWtbsowWtbsow;
  final OadWtbsowWtbsow? tadWtbsowWtbsow;
  final Aco1RWtbsowWtbsowClass? tmxWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? teconallWFare0WFare0;
  final StdcsowWtbsowWtbsow? tstdcsowWtbsowWtbsow;
  final The412C5F6D0? pFare0WFare0WFare0;
  final PstdowWtbsowWtbsow? pstdowWtbsowWtbsow;
  final KltcsowWtbsowWtbsow? tltcsowWFare0WFare0;
  final PflexowWtbsowWtbsow? pflexowWtbsowWtbsow;
  final The412C5F6D0? wFare0WFare0WFare0;
  final EforWtbsowWtbsowClass? wecowWtbsowWtbsow;
  final EforWtbsowWtbsowClass? wflowWtbsowWtbsow;
  final Aco1RWtbsowWtbsowClass? aco1RWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? gnorWFare0WFare0;
  final Aco1RWtbsowWtbsowClass? gcorWtbsowWtbsow;
  final EforWtbsowWtbsowClass? gforWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? tnorWFare0WFare0;
  final EforWtbsowWtbsowClass? rforWtbsowWtbsow;
  final Aco1RWtbsowWtbsowClass? tcorWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? rnorWFare0WFare0;
  final Aco1RWtbsowWtbsowClass? rcorWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? tnorWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? ano1RWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? nnorWFare0WFare0;
  final Aco1RWtbsowWtbsowClass? ncorWtbsowWtbsow;
  final EforWtbsowWtbsowClass? nforWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? enorWFare0WFare0;
  final Aco1RWtbsowWtbsowClass? ecorWtbsowWtbsow;
  final EforWtbsowWtbsowClass? eforWtbsowWtbsow;
  final EforWtbsowWtbsowClass? tforWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? qnorWtbsowWtbsow;
  final Ano1RWtbsowWtbsow? qnorWFare0WFare0;
  final Aco1RWtbsowWtbsowClass? qcorWtbsowWtbsow;
  final EforWtbsowWtbsowClass? qforWtbsowWtbsow;
  final KltcsowWtbsowWtbsow? kltcsowWFare0WFare0;
  final StdcsowWtbsowWtbsow? kstdcsowWtbsowWtbsow;
  final KltcsowWtbsowWtbsow? kltcsowWtbsowWtbsow;
  final The412C5F6D1? eFare0EFare0;
  final EnoYflx1? kltowY1Pc20;
  final EnoYflx1? kstdowY0Pc;
  final EnoYflx1? kflexowY0Pc;
  final The412C5F6D1? kflexowY1Pc25;
  final The412C5F6D0? kltowY0Pc;
  final EnoYflx1? kltowY1Pc25;
  final The412C5F6D1? kstdowY1Pc25;
  final The412C5F6D1? kflexowY1Pc20;
  final The412C5F6D1? kstdowY1Pc20;
  final ObsowY1Pc20? oflowY0Pc;
  final OflowY1Pc20? osdowY1Pc25;
  final OflowY1Pc20? oflowY1Pc20;
  final OflowY1Pc20? oflowY1Pc25;
  final Y0Pc? obsowY0Pc;
  final ObsowY1Pc20? obsowY1Pc20;
  final ObsowY1Pc20? osdowY0Pc;
  final OflowY1Pc20? osdowY1Pc20;
  final ObsowY1Pc20? obsowY1Pc25;
  final EycloHtlgo? oowY0Pc;
  final Aflxtr2Aflxtr2? oowY1Pc20;
  final Aflxtr2Aflxtr2? oowY1Pc25;
  final EycloHtlgo? mowY0Pc;
  final Aflxtr2Aflxtr2? mowY1Pc20;
  final Aflxtr2Aflxtr2? mowY1Pc25;
  final EflowY1Pc20? eflowY1Pc25;
  final EnoYflx1? eprowY1Pc20;
  final The412C5F6D1? y1Pc10Y1Pc20;
  final EnoYflx1? eprowY1Pc25;
  final The412C5F6D1? y1Pc10Y1Pc25;
  final EflowY1Pc20? eflowY1Pc20;
  final The412C5F6D0? eprowY0Pc;
  final EnoYflx1? y1Pc10Y0Pc;
  final EflowY0Pc? eflowY0Pc;
  final The412C5F6D1? rcoY1Pc25;
  final NplowHtclo? rfoY0Pc;
  final EfoY1Pc32? rfoY1Pc20;
  final The412C5F6D1? rcoY1Pc20;
  final EnoYflx1? rnoY1Pc20;
  final EnoYflx1? rcoY0Pc;
  final EnoYflx1? rnoY1Pc25;
  final EfoY1Pc32? rfoY1Pc25;
  final The412C5F6D0? rnoY0Pc;
  final The412C5F6D0? vstdowY0Pc;
  final EnoYflx1? vstdowY1Pc20;
  final EnoYflx1? vstdowY1Pc25;
  final The412C5F6D0? tstdowY0Pc;
  final EnoYflx1? tstdowY1Pc20;
  final EnoYflx1? tstdowY1Pc25;
  final EnoYflx1? promoallY1Pc20;
  final The412C5F6D1? padY1Pc20;
  final The412C5F6D1? y1Pc20Y1Pc20;
  final OflowGfliowHtlgo? pmxY1Pc20;
  final EnoYflx1? gpriowY1Pc20;
  final The412C5F6D1? geciowY1Pc20;
  final The412C5F6D1? ufliowY1Pc20;
  final The412C5F6D0? gpriowY0Pc;
  final EnoYflx1? gpriowY1Pc23;
  final EnoYflx1? geciowY0Pc;
  final The412C5F6D1? geciowY1Pc23;
  final EnoYflx1? ufliowY0Pc;
  final The412C5F6D1? ufliowY1Pc23;
  final The412C5F6D0? promoallY0Pc;
  final EnoYflx1? promoallY1Pc23;
  final EnoYflx1? padY0Pc;
  final The412C5F6D1? padY1Pc23;
  final OflowGfliowHtclo? pmxY0Pc;
  final OflowGfliowHtlgo? pmxY1Pc23;
  final EnoYflx1? nbsowY1Pc20;
  final The412C5F6D1? nstowY1Pc20;
  final EfoY1Pc32? nplowY1Pc20;
  final EnoYflx1? gnoY1Pc20;
  final The412C5F6D1? gcoY1Pc20;
  final The412C5F6D1? gfoY1Pc20;
  final EfoY1Pc32? nplowY1Pc23;
  final The412C5F6D0? nbsowY0Pc;
  final EnoYflx1? nbsowY1Pc23;
  final EnoYflx1? nstowY0Pc;
  final The412C5F6D1? nstowY1Pc23;
  final NplowHtclo? nplowY0Pc;
  final OflowGfliowHtlgo? oflowGfliowY1Pc20;
  final EnoYflx1? oprowGpriowY1Pc20;
  final EflowY1Pc20? oecowGeciowY1Pc20;
  final OflowGfliowHtclo? oflowGfliowY0Pc;
  final OflowGfliowHtlgo? oflowGfliowY1Pc23;
  final The412C5F6D0? oprowGpriowY0Pc;
  final EnoYflx1? oprowGpriowY1Pc23;
  final EflowY0Pc? oecowGeciowY0Pc;
  final EflowY1Pc20? oecowGeciowY1Pc23;
  final The412C5F6D1? gcoY1Pc23;
  final EnoYflx1? gfoY0Pc;
  final The412C5F6D1? gfoY1Pc23;
  final The412C5F6D0? gnoY0Pc;
  final EnoYflx1? gnoY1Pc23;
  final EnoYflx1? gcoY0Pc;
  final OflowGfliowHtclo? pmxHtclo;
  final OflowGfliowHtlgo? pmxHtlgo;
  final The412C5F6D0? promoallHtclo;
  final EnoYflx1? promoallHtlgo;
  final EnoYflx1? padHtclo;
  final The412C5F6D1? padHtlgo;
  final EnoYflx1? y1Pc20Y0Pc;
  final The412C5F6D1? y1Pc20Y1Pc23;
  final The412C5F6D1? geciowHtlgo;
  final EnoYflx1? ufliowHtclo;
  final The412C5F6D1? ufliowHtlgo;
  final The412C5F6D0? gpriowHtclo;
  final EnoYflx1? gpriowHtlgo;
  final EnoYflx1? geciowHtclo;
  final Aflxtr2Aflxtr2? uowtrUowtrY1Pc20;
  final EyfloY1Pc20? uowtuUowtuY1Pc20;
  final NplowHtclo? nplowHtclo;
  final EfoY1Pc32? nplowHtlgo;
  final The412C5F6D0? nbsowHtclo;
  final EnoYflx1? nbsowHtlgo;
  final EnoYflx1? nstowHtclo;
  final The412C5F6D1? nstowHtlgo;
  final EflowY0Pc? oecowGeciowHtclo;
  final EflowY1Pc20? oecowGeciowHtlgo;
  final OflowGfliowHtclo? oflowGfliowHtclo;
  final OflowGfliowHtlgo? oflowGfliowHtlgo;
  final The412C5F6D0? oprowGpriowHtclo;
  final EnoYflx1? oprowGpriowHtlgo;
  final EycloHtlgo? tycloY1Pc20;
  final Aflxtr2Aflxtr2? tylgoY1Pc20;
  final EnoYflx1? gnoHtlgo;
  final EnoYflx1? gcoHtclo;
  final The412C5F6D1? gcoHtlgo;
  final EnoYflx1? gfoHtclo;
  final The412C5F6D1? gfoHtlgo;
  final The412C5F6D0? gnoHtclo;
  final EyfloY1Pc20? tyfloY1Pc20;
  final EycloHtlgo? tycloTycloY1Pc20;
  final Aflxtr2Aflxtr2? tylgoTylgoY1Pc20;
  final Aflxtr2Aflxtr2? tylgoTylgoY1Pc23;
  final EycloHtclo? tycloTycloY0Pc;
  final EycloHtlgo? tycloTycloY1Pc23;
  final EycloHtlgo? tylgoTylgoY0Pc;
  final EycloHtlgo? qycloY1Pc20;
  final Aflxtr2Aflxtr2? qylgoY1Pc20;
  final EyfloY1Pc20? qyfloY1Pc20;
  final EycloHtlgo? uowtrUowtrHtclo;
  final Aflxtr2Aflxtr2? uowtrUowtrHtlgo;
  final EyfloY0Pc? uowtuUowtuHtclo;
  final EyfloY1Pc20? uowtuUowtuHtlgo;
  final EycloHtlgo? tylgoHtclo;
  final Aflxtr2Aflxtr2? tylgoHtlgo;
  final EycloHtclo? tycloHtclo;
  final EycloHtlgo? tycloHtlgo;
  final EyfloY1Pc20? eyfloY1Pc23;
  final EycloHtclo? eycloY0Pc;
  final EycloHtlgo? eycloY1Pc23;
  final EycloHtlgo? eylgoY0Pc;
  final Aflxtr2Aflxtr2? eylgoY1Pc23;
  final EyfloY0Pc? eyfloY0Pc;
  final EyfloY0Pc? tyfloHtclo;
  final EyfloY1Pc20? tyfloHtlgo;
  final EycloHtclo? qycloY0Pc;
  final EycloHtlgo? qycloY1Pc23;
  final EycloHtlgo? qylgoY0Pc;
  final EyfloY0Pc? qyfloY0Pc;
  final Aflxtr2Aflxtr2? qylgoY1Pc23;
  final EyfloY1Pc20? qyfloY1Pc23;
  final EnoYflx1? gnoY1Pc32;
  final The412C5F6D1? gcoY1Pc32;
  final The412C5F6D1? gfoY1Pc32;
  final Aflxtr2Aflxtr2? lowtrLowtrY1Pc20;
  final EyfloY1Pc20? lowtuLowtuY1Pc20;
  final EnoYflx1? qeconallY1Pc32;
  final The412C5F6D1? y1Pc10Y1Pc32;
  final The412C5F6D1? y1Pc20Y1Pc32;
  final EycloHtlgo? eycloY1Pc20;
  final Aflxtr2Aflxtr2? eylgoY1Pc20;
  final EyfloY1Pc20? eyfloY1Pc20;
  final EnoYflx1? qlgt1Y1Pc32;
  final The412C5F6D1? qsmt1Y1Pc32;
  final EflowY1Pc20? mflx1Y1Pc32;
  final Aflxtr2Aflxtr2? rpr12MowTe12MowY1Pc20;
  final EnoYflx1? enoY1Pc32;
  final The412C5F6D1? ecoY1Pc32;
  final EfoY1Pc32? efoY1Pc32;
  final The412C5F6D1? hsmt1Y1Pc32;
  final Aflxtr2Aflxtr2? wrimsoWlriegoY1Pc20;
  final Aflxtr2Aflxtr2? kremsoKlreegoY1Pc20;
  final EycloHtclo? tycloTycloHtclo;
  final EycloHtlgo? tycloTycloHtlgo;
  final EycloHtlgo? tylgoTylgoHtclo;
  final Aflxtr2Aflxtr2? tylgoTylgoHtlgo;
  final EfoY1Pc32? tfoY1Pc32;
  final EnoYflx1? tnoY1Pc32;
  final The412C5F6D1? tcoY1Pc32;
  final EyfloY0Pc? qyfloHtclo;
  final EycloHtclo? qycloHtclo;
  final EycloHtlgo? qycloHtlgo;
  final EycloHtlgo? qylgoHtclo;
  final EyfloY0Pc? lowtuLowtuY0Pc;
  final EyfloY1Pc20? lowtuLowtuY1Pc23;
  final EycloHtlgo? lowtrLowtrY0Pc;
  final Aflxtr2Aflxtr2? lowtrLowtrY1Pc23;
  final EycloHtlgo? oycloY1Pc20;
  final Aflxtr2Aflxtr2? oylgoY1Pc20;
  final EyfloY1Pc20? oyfloY1Pc20;
  final Aflxtr2Aflxtr2? oylgoY1Pc23;
  final EyfloY0Pc? oyfloY0Pc;
  final EyfloY1Pc20? oyfloY1Pc23;
  final EycloHtclo? oycloY0Pc;
  final EycloHtlgo? oycloY1Pc23;
  final EycloHtlgo? oylgoY0Pc;
  final EycloHtclo? eycloHtclo;
  final EycloHtlgo? eycloHtlgo;
  final EycloHtlgo? eylgoHtclo;
  final EycloHtlgo? kremsoKlreegoHtclo;
  final Aflxtr2Aflxtr2? kremsoKlreegoHtlgo;
  final EycloHtlgo? wrimsoWlriegoHtclo;
  final Aflxtr2Aflxtr2? wrimsoWlriegoHtlgo;
  final EycloHtlgo? lowtrLowtrHtclo;
  final Aflxtr2Aflxtr2? lowtrLowtrHtlgo;
  final EyfloY0Pc? lowtuLowtuHtclo;
  final EyfloY1Pc20? lowtuLowtuHtlgo;
  final Y0Pc? wWY0Pc;
  final ObsowY1Pc20? wWY1Pc20;
  final OflowY1Pc20? yYY1Pc20;
  final ObsowY1Pc20? wWY1Pc25;
  final OflowY1Pc20? yYY1Pc25;
  final Aflxtr2Aflxtr2? rpr12MowTe12MowHtlgo;
  final EycloHtlgo? rpr12MowTe12MowHtclo;
  final EycloHtlgo? oylgoHtclo;
  final EycloHtclo? oycloHtclo;
  final EycloHtlgo? oycloHtlgo;
  final Aflxtr2Aflxtr2? rpr12MowKtkcsowY1Pc20;
  final Aflxtr2Aflxtr2? oob7Ru1Oob7Ru1Y1Pc20;
  final EyfloY0Pc? hyfloY0Pc;
  final Aflxtr2Aflxtr2? hylgoY1Pc23;
  final EyfloY1Pc20? hyfloY1Pc23;
  final EycloHtclo? hycloY0Pc;
  final EycloHtlgo? hycloY1Pc23;
  final EycloHtlgo? hylgoY0Pc;
  final Aflxtr2Aflxtr2? hylgoOtlgo;
  final EyfloY1Pc20? hyfloOtlgo;
  final EycloHtclo? hycloOtclo;
  final EycloHtlgo? hycloOtlgo;
  final EycloHtlgo? hylgoOtclo;
  final EyfloY0Pc? hyfloOtclo;
  final EycloHtlgo? hycloY1Pc20;
  final Aflxtr2Aflxtr2? hylgoY1Pc20;
  final EyfloY1Pc20? hyfloY1Pc20;
  final EycloHtlgo? oob7Ru1Oob7Ru1Y0Pc;
  final Aflxtr2Aflxtr2? oob7Ru1Oob7Ru1Y1Pc23;
  final EycloHtlgo? rpr12MowKtkcsowHtclo;
  final Aflxtr2Aflxtr2? rpr12MowKtkcsowHtlgo;
  final EycloHtclo? hycloHtclo;
  final EycloHtlgo? hycloHtlgo;
  final EycloHtlgo? hylgoHtclo;
  final EyfloY0Pc? hyfloHtclo;
  final Aflxtr2Aflxtr2? oob7Ru1Oob7Ru1Htlgo;
  final EycloHtlgo? oob7Ru1Oob7Ru1Htclo;

  Xterm({
    this.yflxtr1Yflxtr1,
    this.eowbyd1SEowbyd1S,
    this.qltow,
    this.qflow,
    this.yow,
    this.y0PcY1Pc23,
    this.y1Pc30Y1Pc30,
    this.y0PcY0Pc,
    this.oallWtbsowWtbsow,
    this.oadWtsdowWtsdow,
    this.vprowWtbsowWtbsow,
    this.tadWtsdowWtsdow,
    this.teconallWtbsowWtbsow,
    this.pltowWtbsowWtbsow,
    this.tltcsowWtbsowWtbsow,
    this.pstdowWtsdowWtsdow,
    this.tstdcsowWtsdowWtsdow,
    this.obsowTbsow,
    this.osdowTsdow,
    this.lltowTbsow,
    this.lstdowTsdow,
    this.oprowWtbsowWtbsow,
    this.oecowWtsdowWtsdow,
    this.eecowTsdow,
    this.eprowTbsow,
    this.wprowWtbsowWtbsow,
    this.wecowWtsdowWtsdow,
    this.gnorWtbsowWtbsow,
    this.gcorWtsdowWtsdow,
    this.rnoTbsow,
    this.rcoTsdow,
    this.vstdowTbsow,
    this.rnorWtbsowWtbsow,
    this.rcorWtsdowWtsdow,
    this.tstdowTbsow,
    this.nnorWtbsowWtbsow,
    this.ncorWtsdowWtsdow,
    this.vowTbsow,
    this.enorWtbsowWtbsow,
    this.ecorWtsdowWtsdow,
    this.padEtlgo,
    this.promoallEtclo,
    this.gpriowEtclo,
    this.geciowEtlgo,
    this.xallPowQaowTwebYr,
    this.xallQaowZwebInt,
    this.xadZow1SqZow1Sq,
    this.row2Vow1Tbsow,
    this.vow2Vow1Tsdow,
    this.xallIaowZwebInt,
    this.lltowEwebbyd3Ewebbyd3,
    this.lstdowEowbyd1SEowbyd1S,
    this.hltowQnoQnoTbsow,
    this.hstdowQcoQcoTsdow,
    this.nbsowEtclo,
    this.nstowEtlgo,
    this.eprowEwebbyd3Ewebbyd3,
    this.eecowEowbyd1SEowbyd1S,
    this.gow1STwebYr,
    this.oprowGpriowEtclo,
    this.oecowGeciowEtlgo,
    this.rnoEwebbyd3Ewebbyd3,
    this.rcoEowbyd1SEowbyd1S,
    this.tstdowEwebbyd3Ewebbyd3,
    this.gnoEtclo,
    this.gcoEtlgo,
    this.rnorGpriowEtclo,
    this.rcorGeciowEtlgo,
    this.oallEtcloEtclo,
    this.oadEtlgoEtlgo,
    this.vprowEnoEtclo,
    this.promoallOltowEtclo,
    this.padOflowEtlgo,
    this.promoallAtclo,
    this.padAtlgo,
    this.oprowEnoEtclo,
    this.oecowEcoEtlgo,
    this.teconallOpriowEtclo,
    this.tadOeciowEtlgo,
    this.gpriowAtclo,
    this.geciowAtlgo,
    this.gnorEnoEtclo,
    this.gcorEcoEtlgo,
    this.rstowOeciowEtlgo,
    this.rltowOpriowEtclo,
    this.rnorEnoEtclo,
    this.rcorEcoEtlgo,
    this.ecorOeciowEtlgo,
    this.enorOpriowEtclo,
    this.gnorNnoEtclo,
    this.gcorNcoEtlgo,
    this.nbsowAtclo,
    this.nstowAtlgo,
    this.gow1SEtcloEtclo,
    this.rnorNnoEtcloEtclo,
    this.rcorNcoEtlgoEtlgo,
    this.pow1SEtcloEtclo,
    this.tylgoTylgoEtlgo,
    this.tycloTycloEtclo,
    this.gnoAtclo,
    this.gcoAtlgo,
    this.qn2PxowQn2Pxow,
    this.qycloEtclo,
    this.qylgoEtlgo,
    this.ecoEtlgoEtlgo,
    this.enoEtcloEtclo,
    this.kcorOflowEtlgo,
    this.knorOltowEtclo,
    this.en2PxowEn2Pxow,
    this.sn2PxowSn2Pxow,
    this.vstdowTsdow,
    this.towTsdow,
    this.vrl1MpRxox,
    this.the412C5F6D0,
    this.the412C5F6D1,
    this.kstdowTsdow,
    this.lstdoxUsdox,
    this.kltowTbsow,
    this.lltoxUbsox,
    this.rflox,
    this.aox,
    this.rltox,
    this.snpUbsox,
    this.scpUsdox,
    this.ustdoxUbsox,
    this.tloyowTsdow,
    this.uloyoxUsdox,
    this.promoallTow1S,
    this.qromoalmUow1T,
    this.padTow1S,
    this.qaeUow1T,
    this.qltoxWltoxUbsox,
    this.pltowVltowTbsow,
    this.pstdowVstdowTsdow,
    this.qstdoxWstdoxUsdox,
    this.qromoalmFtclp,
    this.qaeFtlgp,
    this.hprioxFtclp,
    this.hecioxFtlgp,
    this.sow3Wow2Ubsox,
    this.vow2Qow1Tsdow,
    this.wow3Row2Usdox,
    this.nbsowTow1S,
    this.obsoxUow1T,
    this.nstowTow1S,
    this.ostoxUow1T,
    this.lltoxObOb,
    this.lstdoxFowbyd1TFowbyd1T,
    this.pbsoxObOb,
    this.psdoxFowbyd1TFowbyd1T,
    this.obsoxFtclp,
    this.ostoxFtlgp,
    this.bproxObOb,
    this.becoxFowbyd1TFowbyd1T,
    this.poxObOb,
    this.poxFowbyd1TFowbyd1T,
    this.wstdoxObOb,
    this.wloyoxFowbyd1TFowbyd1T,
    this.gnoTow1S,
    this.hnpUow1T,
    this.gcoTow1S,
    this.hcpUow1T,
    this.snpObOb,
    this.scpFowbyd1TFowbyd1T,
    this.ustdoxObOb,
    this.uloyoxFowbyd1TFowbyd1T,
    this.hnpFtclp,
    this.hcpFtlgp,
    this.qromoalmObObOb,
    this.hprioxObObOb,
    this.uowtrUowtrTow1S,
    this.vowtsVowtsUow1T,
    this.how1TFtclp,
    this.how1TFtlgp,
    this.how1TUow1T,
    this.uylgpUow1T,
    this.uyclpUow1T,
    this.tylgoTow1S,
    this.powtsPowtsFtlgp,
    this.powtsPowtsFtclp,
    this.oowtrOowtrEtlgo,
    this.uyclpUyclpFtclp,
    this.uylgpUylgpFtlgp,
    this.ryclpFtclp,
    this.rn2PxoxRn2Pxox,
    this.rylgpFtlgp,
    this.in2XoyIn2Xoy,
    this.hn2XoxHn2Xox,
    this.qtsoQtsoTow1S,
    this.rtspRtspUow1T,
    this.fyclpFtclp,
    this.eylgoEtlgo,
    this.fylgpFtlgp,
    this.icsorvIcsorvFtclp,
    this.hcsoruHcsoruEtlgo,
    this.icsorvIcsorvFtlgp,
    this.qeconallYflx1,
    this.reconalmAflx2,
    this.scpAflx2,
    this.rnoYflx1,
    this.snpAflx2,
    this.rcoYflx1,
    this.how1SrHow1SrFtlgp,
    this.how1SrHow1SrFtclp,
    this.qlgt1Yflx1,
    this.rlgt2Aflx2,
    this.aflxtr2Aflxtr2,
    this.rsmt2Aflx2,
    this.qsmt1Yflx1,
    this.xrimspXlriegpUow1T,
    this.wrimsoWlriegoTow1S,
    this.rpr12MowTe12MowTow1S,
    this.spr12MoxUe12MoxUow1T,
    this.mowtsMowtsFtclp,
    this.lowtrLowtrEtlgo,
    this.mowtsMowtsFtlgp,
    this.qow1SrQow1SrFtclp,
    this.qow1SrQow1SrFtlgp,
    this.enoYflx1,
    this.fnpAflx2,
    this.ecoYflx1,
    this.fcpAflx2,
    this.hsmt1Yflx1,
    this.ismt2Aflx2,
    this.vow1SrVow1SrFtclp,
    this.uow1SqUow1SqEtlgo,
    this.vow1SrVow1SrFtlgp,
    this.fn2PxoxFn2Pxox,
    this.fowbyd1TFowbyd1TUbsox,
    this.fowbyd1TFowbyd1TUsdox,
    this.tn2PxoxTn2Pxox,
    this.oallWFare0WFare0,
    this.oadWtbsowWtbsow,
    this.omxWtbsowWtbsow,
    this.uflowWtbsowWtbsow,
    this.uprowWtbsowWtbsow,
    this.uFare0WFare0WFare0,
    this.uecowWtbsowWtbsow,
    this.vprowWFare0WFare0,
    this.vplowWtbsowWtbsow,
    this.tprowWtbsowWtbsow,
    this.vpmowWtbsowWtbsow,
    this.tplowWtbsowWtbsow,
    this.tadWtbsowWtbsow,
    this.tmxWtbsowWtbsow,
    this.teconallWFare0WFare0,
    this.tstdcsowWtbsowWtbsow,
    this.pFare0WFare0WFare0,
    this.pstdowWtbsowWtbsow,
    this.tltcsowWFare0WFare0,
    this.pflexowWtbsowWtbsow,
    this.wFare0WFare0WFare0,
    this.wecowWtbsowWtbsow,
    this.wflowWtbsowWtbsow,
    this.aco1RWtbsowWtbsow,
    this.gnorWFare0WFare0,
    this.gcorWtbsowWtbsow,
    this.gforWtbsowWtbsow,
    this.tnorWFare0WFare0,
    this.rforWtbsowWtbsow,
    this.tcorWtbsowWtbsow,
    this.rnorWFare0WFare0,
    this.rcorWtbsowWtbsow,
    this.tnorWtbsowWtbsow,
    this.ano1RWtbsowWtbsow,
    this.nnorWFare0WFare0,
    this.ncorWtbsowWtbsow,
    this.nforWtbsowWtbsow,
    this.enorWFare0WFare0,
    this.ecorWtbsowWtbsow,
    this.eforWtbsowWtbsow,
    this.tforWtbsowWtbsow,
    this.qnorWtbsowWtbsow,
    this.qnorWFare0WFare0,
    this.qcorWtbsowWtbsow,
    this.qforWtbsowWtbsow,
    this.kltcsowWFare0WFare0,
    this.kstdcsowWtbsowWtbsow,
    this.kltcsowWtbsowWtbsow,
    this.eFare0EFare0,
    this.kltowY1Pc20,
    this.kstdowY0Pc,
    this.kflexowY0Pc,
    this.kflexowY1Pc25,
    this.kltowY0Pc,
    this.kltowY1Pc25,
    this.kstdowY1Pc25,
    this.kflexowY1Pc20,
    this.kstdowY1Pc20,
    this.oflowY0Pc,
    this.osdowY1Pc25,
    this.oflowY1Pc20,
    this.oflowY1Pc25,
    this.obsowY0Pc,
    this.obsowY1Pc20,
    this.osdowY0Pc,
    this.osdowY1Pc20,
    this.obsowY1Pc25,
    this.oowY0Pc,
    this.oowY1Pc20,
    this.oowY1Pc25,
    this.mowY0Pc,
    this.mowY1Pc20,
    this.mowY1Pc25,
    this.eflowY1Pc25,
    this.eprowY1Pc20,
    this.y1Pc10Y1Pc20,
    this.eprowY1Pc25,
    this.y1Pc10Y1Pc25,
    this.eflowY1Pc20,
    this.eprowY0Pc,
    this.y1Pc10Y0Pc,
    this.eflowY0Pc,
    this.rcoY1Pc25,
    this.rfoY0Pc,
    this.rfoY1Pc20,
    this.rcoY1Pc20,
    this.rnoY1Pc20,
    this.rcoY0Pc,
    this.rnoY1Pc25,
    this.rfoY1Pc25,
    this.rnoY0Pc,
    this.vstdowY0Pc,
    this.vstdowY1Pc20,
    this.vstdowY1Pc25,
    this.tstdowY0Pc,
    this.tstdowY1Pc20,
    this.tstdowY1Pc25,
    this.promoallY1Pc20,
    this.padY1Pc20,
    this.y1Pc20Y1Pc20,
    this.pmxY1Pc20,
    this.gpriowY1Pc20,
    this.geciowY1Pc20,
    this.ufliowY1Pc20,
    this.gpriowY0Pc,
    this.gpriowY1Pc23,
    this.geciowY0Pc,
    this.geciowY1Pc23,
    this.ufliowY0Pc,
    this.ufliowY1Pc23,
    this.promoallY0Pc,
    this.promoallY1Pc23,
    this.padY0Pc,
    this.padY1Pc23,
    this.pmxY0Pc,
    this.pmxY1Pc23,
    this.nbsowY1Pc20,
    this.nstowY1Pc20,
    this.nplowY1Pc20,
    this.gnoY1Pc20,
    this.gcoY1Pc20,
    this.gfoY1Pc20,
    this.nplowY1Pc23,
    this.nbsowY0Pc,
    this.nbsowY1Pc23,
    this.nstowY0Pc,
    this.nstowY1Pc23,
    this.nplowY0Pc,
    this.oflowGfliowY1Pc20,
    this.oprowGpriowY1Pc20,
    this.oecowGeciowY1Pc20,
    this.oflowGfliowY0Pc,
    this.oflowGfliowY1Pc23,
    this.oprowGpriowY0Pc,
    this.oprowGpriowY1Pc23,
    this.oecowGeciowY0Pc,
    this.oecowGeciowY1Pc23,
    this.gcoY1Pc23,
    this.gfoY0Pc,
    this.gfoY1Pc23,
    this.gnoY0Pc,
    this.gnoY1Pc23,
    this.gcoY0Pc,
    this.pmxHtclo,
    this.pmxHtlgo,
    this.promoallHtclo,
    this.promoallHtlgo,
    this.padHtclo,
    this.padHtlgo,
    this.y1Pc20Y0Pc,
    this.y1Pc20Y1Pc23,
    this.geciowHtlgo,
    this.ufliowHtclo,
    this.ufliowHtlgo,
    this.gpriowHtclo,
    this.gpriowHtlgo,
    this.geciowHtclo,
    this.uowtrUowtrY1Pc20,
    this.uowtuUowtuY1Pc20,
    this.nplowHtclo,
    this.nplowHtlgo,
    this.nbsowHtclo,
    this.nbsowHtlgo,
    this.nstowHtclo,
    this.nstowHtlgo,
    this.oecowGeciowHtclo,
    this.oecowGeciowHtlgo,
    this.oflowGfliowHtclo,
    this.oflowGfliowHtlgo,
    this.oprowGpriowHtclo,
    this.oprowGpriowHtlgo,
    this.tycloY1Pc20,
    this.tylgoY1Pc20,
    this.gnoHtlgo,
    this.gcoHtclo,
    this.gcoHtlgo,
    this.gfoHtclo,
    this.gfoHtlgo,
    this.gnoHtclo,
    this.tyfloY1Pc20,
    this.tycloTycloY1Pc20,
    this.tylgoTylgoY1Pc20,
    this.tylgoTylgoY1Pc23,
    this.tycloTycloY0Pc,
    this.tycloTycloY1Pc23,
    this.tylgoTylgoY0Pc,
    this.qycloY1Pc20,
    this.qylgoY1Pc20,
    this.qyfloY1Pc20,
    this.uowtrUowtrHtclo,
    this.uowtrUowtrHtlgo,
    this.uowtuUowtuHtclo,
    this.uowtuUowtuHtlgo,
    this.tylgoHtclo,
    this.tylgoHtlgo,
    this.tycloHtclo,
    this.tycloHtlgo,
    this.eyfloY1Pc23,
    this.eycloY0Pc,
    this.eycloY1Pc23,
    this.eylgoY0Pc,
    this.eylgoY1Pc23,
    this.eyfloY0Pc,
    this.tyfloHtclo,
    this.tyfloHtlgo,
    this.qycloY0Pc,
    this.qycloY1Pc23,
    this.qylgoY0Pc,
    this.qyfloY0Pc,
    this.qylgoY1Pc23,
    this.qyfloY1Pc23,
    this.gnoY1Pc32,
    this.gcoY1Pc32,
    this.gfoY1Pc32,
    this.lowtrLowtrY1Pc20,
    this.lowtuLowtuY1Pc20,
    this.qeconallY1Pc32,
    this.y1Pc10Y1Pc32,
    this.y1Pc20Y1Pc32,
    this.eycloY1Pc20,
    this.eylgoY1Pc20,
    this.eyfloY1Pc20,
    this.qlgt1Y1Pc32,
    this.qsmt1Y1Pc32,
    this.mflx1Y1Pc32,
    this.rpr12MowTe12MowY1Pc20,
    this.enoY1Pc32,
    this.ecoY1Pc32,
    this.efoY1Pc32,
    this.hsmt1Y1Pc32,
    this.wrimsoWlriegoY1Pc20,
    this.kremsoKlreegoY1Pc20,
    this.tycloTycloHtclo,
    this.tycloTycloHtlgo,
    this.tylgoTylgoHtclo,
    this.tylgoTylgoHtlgo,
    this.tfoY1Pc32,
    this.tnoY1Pc32,
    this.tcoY1Pc32,
    this.qyfloHtclo,
    this.qycloHtclo,
    this.qycloHtlgo,
    this.qylgoHtclo,
    this.lowtuLowtuY0Pc,
    this.lowtuLowtuY1Pc23,
    this.lowtrLowtrY0Pc,
    this.lowtrLowtrY1Pc23,
    this.oycloY1Pc20,
    this.oylgoY1Pc20,
    this.oyfloY1Pc20,
    this.oylgoY1Pc23,
    this.oyfloY0Pc,
    this.oyfloY1Pc23,
    this.oycloY0Pc,
    this.oycloY1Pc23,
    this.oylgoY0Pc,
    this.eycloHtclo,
    this.eycloHtlgo,
    this.eylgoHtclo,
    this.kremsoKlreegoHtclo,
    this.kremsoKlreegoHtlgo,
    this.wrimsoWlriegoHtclo,
    this.wrimsoWlriegoHtlgo,
    this.lowtrLowtrHtclo,
    this.lowtrLowtrHtlgo,
    this.lowtuLowtuHtclo,
    this.lowtuLowtuHtlgo,
    this.wWY0Pc,
    this.wWY1Pc20,
    this.yYY1Pc20,
    this.wWY1Pc25,
    this.yYY1Pc25,
    this.rpr12MowTe12MowHtlgo,
    this.rpr12MowTe12MowHtclo,
    this.oylgoHtclo,
    this.oycloHtclo,
    this.oycloHtlgo,
    this.rpr12MowKtkcsowY1Pc20,
    this.oob7Ru1Oob7Ru1Y1Pc20,
    this.hyfloY0Pc,
    this.hylgoY1Pc23,
    this.hyfloY1Pc23,
    this.hycloY0Pc,
    this.hycloY1Pc23,
    this.hylgoY0Pc,
    this.hylgoOtlgo,
    this.hyfloOtlgo,
    this.hycloOtclo,
    this.hycloOtlgo,
    this.hylgoOtclo,
    this.hyfloOtclo,
    this.hycloY1Pc20,
    this.hylgoY1Pc20,
    this.hyfloY1Pc20,
    this.oob7Ru1Oob7Ru1Y0Pc,
    this.oob7Ru1Oob7Ru1Y1Pc23,
    this.rpr12MowKtkcsowHtclo,
    this.rpr12MowKtkcsowHtlgo,
    this.hycloHtclo,
    this.hycloHtlgo,
    this.hylgoHtclo,
    this.hyfloHtclo,
    this.oob7Ru1Oob7Ru1Htlgo,
    this.oob7Ru1Oob7Ru1Htclo,
  });

  factory Xterm.fromJson(Map<String, dynamic> json) => Xterm(
        yflxtr1Yflxtr1: json["YFLXTR1,YFLXTR1"] == null
            ? null
            : Yflxtr1Yflxtr1.fromJson(json["YFLXTR1,YFLXTR1"]),
        eowbyd1SEowbyd1S: json["EOWBYD1S,EOWBYD1S"] == null
            ? null
            : Eowbyd1SEowbyd1S.fromJson(json["EOWBYD1S,EOWBYD1S"]),
        qltow:
            json["QLTOW"] == null ? null : The412C5F6D0.fromJson(json["QLTOW"]),
        qflow:
            json["QFLOW"] == null ? null : The412C5F6D1.fromJson(json["QFLOW"]),
        yow: json["YOW"] == null ? null : The412C5F6D1.fromJson(json["YOW"]),
        y0PcY1Pc23: json["Y_0PC,Y_1PC23"] == null
            ? null
            : EycloHtlgo.fromJson(json["Y_0PC,Y_1PC23"]),
        y1Pc30Y1Pc30: json["Y_1PC30,Y_1PC30"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["Y_1PC30,Y_1PC30"]),
        y0PcY0Pc: json["Y_0PC,Y_0PC"] == null
            ? null
            : Y0Pc.fromJson(json["Y_0PC,Y_0PC"]),
        oallWtbsowWtbsow: json["OALL,WTBSOW,WTBSOW"] == null
            ? null
            : EnorWtbsowWtbsowClass.fromJson(json["OALL,WTBSOW,WTBSOW"]),
        oadWtsdowWtsdow: json["OAD,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["OAD,WTSDOW,WTSDOW"]),
        vprowWtbsowWtbsow: json["VPROW,WTBSOW,WTBSOW"] == null
            ? null
            : VprowWtbsowWtbsow.fromJson(json["VPROW,WTBSOW,WTBSOW"]),
        tadWtsdowWtsdow: json["TAD,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["TAD,WTSDOW,WTSDOW"]),
        teconallWtbsowWtbsow: json["TECONALL,WTBSOW,WTBSOW"] == null
            ? null
            : EnorWtbsowWtbsowClass.fromJson(json["TECONALL,WTBSOW,WTBSOW"]),
        pltowWtbsowWtbsow: json["PLTOW,WTBSOW,WTBSOW"] == null
            ? null
            : OwWtbsowWtbsow.fromJson(json["PLTOW,WTBSOW,WTBSOW"]),
        tltcsowWtbsowWtbsow: json["TLTCSOW,WTBSOW,WTBSOW"] == null
            ? null
            : OwWtbsowWtbsow.fromJson(json["TLTCSOW,WTBSOW,WTBSOW"]),
        pstdowWtsdowWtsdow: json["PSTDOW,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["PSTDOW,WTSDOW,WTSDOW"]),
        tstdcsowWtsdowWtsdow: json["TSTDCSOW,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["TSTDCSOW,WTSDOW,WTSDOW"]),
        obsowTbsow: json["OBSOW,TBSOW"] == null
            ? null
            : ObsowTbsow.fromJson(json["OBSOW,TBSOW"]),
        osdowTsdow: json["OSDOW,TSDOW"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OSDOW,TSDOW"]),
        lltowTbsow: json["LLTOW,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["LLTOW,TBSOW"]),
        lstdowTsdow: json["LSTDOW,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["LSTDOW,TSDOW"]),
        oprowWtbsowWtbsow: json["OPROW,WTBSOW,WTBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["OPROW,WTBSOW,WTBSOW"]),
        oecowWtsdowWtsdow: json["OECOW,WTSDOW,WTSDOW"] == null
            ? null
            : EflowY1Pc20.fromJson(json["OECOW,WTSDOW,WTSDOW"]),
        eecowTsdow: json["EECOW,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["EECOW,TSDOW"]),
        eprowTbsow: json["EPROW,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["EPROW,TBSOW"]),
        wprowWtbsowWtbsow: json["WPROW,WTBSOW,WTBSOW"] == null
            ? null
            : WprowWtbsowWtbsow.fromJson(json["WPROW,WTBSOW,WTBSOW"]),
        wecowWtsdowWtsdow: json["WECOW,WTSDOW,WTSDOW"] == null
            ? null
            : EflowY1Pc20.fromJson(json["WECOW,WTSDOW,WTSDOW"]),
        gnorWtbsowWtbsow: json["GNOR,WTBSOW,WTBSOW"] == null
            ? null
            : EnorWtbsowWtbsowClass.fromJson(json["GNOR,WTBSOW,WTBSOW"]),
        gcorWtsdowWtsdow: json["GCOR,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCOR,WTSDOW,WTSDOW"]),
        rnoTbsow: json["RNO,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["RNO,TBSOW"]),
        rcoTsdow: json["RCO,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCO,TSDOW"]),
        vstdowTbsow: json["VSTDOW,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["VSTDOW,TBSOW"]),
        rnorWtbsowWtbsow: json["RNOR,WTBSOW,WTBSOW"] == null
            ? null
            : EnorWtbsowWtbsowClass.fromJson(json["RNOR,WTBSOW,WTBSOW"]),
        rcorWtsdowWtsdow: json["RCOR,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCOR,WTSDOW,WTSDOW"]),
        tstdowTbsow: json["TSTDOW,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["TSTDOW,TBSOW"]),
        nnorWtbsowWtbsow: json["NNOR,WTBSOW,WTBSOW"] == null
            ? null
            : EnorWtbsowWtbsowClass.fromJson(json["NNOR,WTBSOW,WTBSOW"]),
        ncorWtsdowWtsdow: json["NCOR,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["NCOR,WTSDOW,WTSDOW"]),
        vowTbsow: json["VOW,TBSOW"] == null
            ? null
            : EycloHtlgo.fromJson(json["VOW,TBSOW"]),
        enorWtbsowWtbsow: json["ENOR,WTBSOW,WTBSOW"] == null
            ? null
            : EnorWtbsowWtbsowClass.fromJson(json["ENOR,WTBSOW,WTBSOW"]),
        ecorWtsdowWtsdow: json["ECOR,WTSDOW,WTSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["ECOR,WTSDOW,WTSDOW"]),
        padEtlgo: json["PAD,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,ETLGO"]),
        promoallEtclo: json["PROMOALL,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["PROMOALL,ETCLO"]),
        gpriowEtclo: json["GPRIOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GPRIOW,ETCLO"]),
        geciowEtlgo: json["GECIOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GECIOW,ETLGO"]),
        xallPowQaowTwebYr: json["XALL,POW,QAOW,TWEB/YR"] == null
            ? null
            : EnoYflx1.fromJson(json["XALL,POW,QAOW,TWEB/YR"]),
        xallQaowZwebInt: json["XALL,QAOW,ZWEB/INT"] == null
            ? null
            : The412C5F6D0.fromJson(json["XALL,QAOW,ZWEB/INT"]),
        xadZow1SqZow1Sq: json["XAD,ZOW1SQ,ZOW1SQ"] == null
            ? null
            : The412C5F6D1.fromJson(json["XAD,ZOW1SQ,ZOW1SQ"]),
        row2Vow1Tbsow: json["ROW2,VOW1,TBSOW"] == null
            ? null
            : EycloHtclo.fromJson(json["ROW2,VOW1,TBSOW"]),
        vow2Vow1Tsdow: json["VOW2,VOW1,TSDOW"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["VOW2,VOW1,TSDOW"]),
        xallIaowZwebInt: json["XALL,IAOW,ZWEB/INT"] == null
            ? null
            : The412C5F6D0.fromJson(json["XALL,IAOW,ZWEB/INT"]),
        lltowEwebbyd3Ewebbyd3: json["LLTOW,EWEBBYD3,EWEBBYD3"] == null
            ? null
            : The412C5F6D0.fromJson(json["LLTOW,EWEBBYD3,EWEBBYD3"]),
        lstdowEowbyd1SEowbyd1S: json["LSTDOW,EOWBYD1S,EOWBYD1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["LSTDOW,EOWBYD1S,EOWBYD1S"]),
        hltowQnoQnoTbsow: json["HLTOW,QNO,QNO,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["HLTOW,QNO,QNO,TBSOW"]),
        hstdowQcoQcoTsdow: json["HSTDOW,QCO,QCO,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["HSTDOW,QCO,QCO,TSDOW"]),
        nbsowEtclo: json["NBSOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["NBSOW,ETCLO"]),
        nstowEtlgo: json["NSTOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["NSTOW,ETLGO"]),
        eprowEwebbyd3Ewebbyd3: json["EPROW,EWEBBYD3,EWEBBYD3"] == null
            ? null
            : The412C5F6D0.fromJson(json["EPROW,EWEBBYD3,EWEBBYD3"]),
        eecowEowbyd1SEowbyd1S: json["EECOW,EOWBYD1S,EOWBYD1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["EECOW,EOWBYD1S,EOWBYD1S"]),
        gow1STwebYr: json["GOW1S,TWEB/YR"] == null
            ? null
            : EycloHtlgo.fromJson(json["GOW1S,TWEB/YR"]),
        oprowGpriowEtclo: json["OPROW,GPRIOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["OPROW,GPRIOW,ETCLO"]),
        oecowGeciowEtlgo: json["OECOW,GECIOW,ETLGO"] == null
            ? null
            : EflowY1Pc20.fromJson(json["OECOW,GECIOW,ETLGO"]),
        rnoEwebbyd3Ewebbyd3: json["RNO,EWEBBYD3,EWEBBYD3"] == null
            ? null
            : The412C5F6D0.fromJson(json["RNO,EWEBBYD3,EWEBBYD3"]),
        rcoEowbyd1SEowbyd1S: json["RCO,EOWBYD1S,EOWBYD1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCO,EOWBYD1S,EOWBYD1S"]),
        tstdowEwebbyd3Ewebbyd3: json["TSTDOW,EWEBBYD3,EWEBBYD3"] == null
            ? null
            : The412C5F6D0.fromJson(json["TSTDOW,EWEBBYD3,EWEBBYD3"]),
        gnoEtclo: json["GNO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GNO,ETCLO"]),
        gcoEtlgo: json["GCO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,ETLGO"]),
        rnorGpriowEtclo: json["RNOR,GPRIOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["RNOR,GPRIOW,ETCLO"]),
        rcorGeciowEtlgo: json["RCOR,GECIOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCOR,GECIOW,ETLGO"]),
        oallEtcloEtclo: json["OALL,ETCLO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["OALL,ETCLO,ETCLO"]),
        oadEtlgoEtlgo: json["OAD,ETLGO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["OAD,ETLGO,ETLGO"]),
        vprowEnoEtclo: json["VPROW,ENO,ETCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["VPROW,ENO,ETCLO"]),
        promoallOltowEtclo: json["PROMOALL,OLTOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["PROMOALL,OLTOW,ETCLO"]),
        padOflowEtlgo: json["PAD,OFLOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,OFLOW,ETLGO"]),
        promoallAtclo: json["PROMOALL,ATCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["PROMOALL,ATCLO"]),
        padAtlgo: json["PAD,ATLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,ATLGO"]),
        oprowEnoEtclo: json["OPROW,ENO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["OPROW,ENO,ETCLO"]),
        oecowEcoEtlgo: json["OECOW,ECO,ETLGO"] == null
            ? null
            : EflowY1Pc20.fromJson(json["OECOW,ECO,ETLGO"]),
        teconallOpriowEtclo: json["TECONALL,OPRIOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["TECONALL,OPRIOW,ETCLO"]),
        tadOeciowEtlgo: json["TAD,OECIOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["TAD,OECIOW,ETLGO"]),
        gpriowAtclo: json["GPRIOW,ATCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GPRIOW,ATCLO"]),
        geciowAtlgo: json["GECIOW,ATLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GECIOW,ATLGO"]),
        gnorEnoEtclo: json["GNOR,ENO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GNOR,ENO,ETCLO"]),
        gcorEcoEtlgo: json["GCOR,ECO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCOR,ECO,ETLGO"]),
        rstowOeciowEtlgo: json["RSTOW,OECIOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["RSTOW,OECIOW,ETLGO"]),
        rltowOpriowEtclo: json["RLTOW,OPRIOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["RLTOW,OPRIOW,ETCLO"]),
        rnorEnoEtclo: json["RNOR,ENO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["RNOR,ENO,ETCLO"]),
        rcorEcoEtlgo: json["RCOR,ECO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCOR,ECO,ETLGO"]),
        ecorOeciowEtlgo: json["ECOR,OECIOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["ECOR,OECIOW,ETLGO"]),
        enorOpriowEtclo: json["ENOR,OPRIOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["ENOR,OPRIOW,ETCLO"]),
        gnorNnoEtclo: json["GNOR,NNO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GNOR,NNO,ETCLO"]),
        gcorNcoEtlgo: json["GCOR,NCO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCOR,NCO,ETLGO"]),
        nbsowAtclo: json["NBSOW,ATCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["NBSOW,ATCLO"]),
        nstowAtlgo: json["NSTOW,ATLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["NSTOW,ATLGO"]),
        gow1SEtcloEtclo: json["GOW1S,ETCLO,ETCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["GOW1S,ETCLO,ETCLO"]),
        rnorNnoEtcloEtclo: json["RNOR,NNO,ETCLO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["RNOR,NNO,ETCLO,ETCLO"]),
        rcorNcoEtlgoEtlgo: json["RCOR,NCO,ETLGO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCOR,NCO,ETLGO,ETLGO"]),
        pow1SEtcloEtclo: json["POW1S,ETCLO,ETCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["POW1S,ETCLO,ETCLO"]),
        tylgoTylgoEtlgo: json["TYLGO,TYLGO,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,TYLGO,ETLGO"]),
        tycloTycloEtclo: json["TYCLO,TYCLO,ETCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["TYCLO,TYCLO,ETCLO"]),
        gnoAtclo: json["GNO,ATCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GNO,ATCLO"]),
        gcoAtlgo: json["GCO,ATLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,ATLGO"]),
        qn2PxowQn2Pxow: json["QN2PXOW,QN2PXOW"] == null
            ? null
            : N2Pxow.fromJson(json["QN2PXOW,QN2PXOW"]),
        qycloEtclo: json["QYCLO,ETCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["QYCLO,ETCLO"]),
        qylgoEtlgo: json["QYLGO,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["QYLGO,ETLGO"]),
        ecoEtlgoEtlgo: json["ECO,ETLGO,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["ECO,ETLGO,ETLGO"]),
        enoEtcloEtclo: json["ENO,ETCLO,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["ENO,ETCLO,ETCLO"]),
        kcorOflowEtlgo: json["KCOR,OFLOW,ETLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["KCOR,OFLOW,ETLGO"]),
        knorOltowEtclo: json["KNOR,OLTOW,ETCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["KNOR,OLTOW,ETCLO"]),
        en2PxowEn2Pxow: json["EN2PXOW,EN2PXOW"] == null
            ? null
            : N2Pxow.fromJson(json["EN2PXOW,EN2PXOW"]),
        sn2PxowSn2Pxow: json["SN2PXOW,SN2PXOW"] == null
            ? null
            : N2Pxow.fromJson(json["SN2PXOW,SN2PXOW"]),
        vstdowTsdow: json["VSTDOW,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["VSTDOW,TSDOW"]),
        towTsdow: json["TOW,TSDOW"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TOW,TSDOW"]),
        vrl1MpRxox: json["VRL1MP,RXOX"] == null
            ? null
            : Vrl1MpRxox.fromJson(json["VRL1MP,RXOX"]),
        the412C5F6D0: json["412c5f6d.0"] == null
            ? null
            : The412C5F6D0.fromJson(json["412c5f6d.0"]),
        the412C5F6D1: json["412c5f6d.1"] == null
            ? null
            : The412C5F6D1.fromJson(json["412c5f6d.1"]),
        kstdowTsdow: json["KSTDOW,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["KSTDOW,TSDOW"]),
        lstdoxUsdox: json["LSTDOX,USDOX"] == null
            ? null
            : The412C5F6D1.fromJson(json["LSTDOX,USDOX"]),
        kltowTbsow: json["KLTOW,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["KLTOW,TBSOW"]),
        lltoxUbsox: json["LLTOX,UBSOX"] == null
            ? null
            : The412C5F6D0.fromJson(json["LLTOX,UBSOX"]),
        rflox:
            json["RFLOX"] == null ? null : The412C5F6D1.fromJson(json["RFLOX"]),
        aox: json["AOX"] == null ? null : The412C5F6D1.fromJson(json["AOX"]),
        rltox:
            json["RLTOX"] == null ? null : The412C5F6D0.fromJson(json["RLTOX"]),
        snpUbsox: json["SNP,UBSOX"] == null
            ? null
            : The412C5F6D0.fromJson(json["SNP,UBSOX"]),
        scpUsdox: json["SCP,USDOX"] == null
            ? null
            : The412C5F6D1.fromJson(json["SCP,USDOX"]),
        ustdoxUbsox: json["USTDOX,UBSOX"] == null
            ? null
            : EycloHtlgo.fromJson(json["USTDOX,UBSOX"]),
        tloyowTsdow: json["TLOYOW,TSDOW"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TLOYOW,TSDOW"]),
        uloyoxUsdox: json["ULOYOX,USDOX"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["ULOYOX,USDOX"]),
        promoallTow1S: json["PROMOALL,TOW1S"] == null
            ? null
            : EnoYflx1.fromJson(json["PROMOALL,TOW1S"]),
        qromoalmUow1T: json["QROMOALM,UOW1T"] == null
            ? null
            : EnoYflx1.fromJson(json["QROMOALM,UOW1T"]),
        padTow1S: json["PAD,TOW1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,TOW1S"]),
        qaeUow1T: json["QAE,UOW1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["QAE,UOW1T"]),
        qltoxWltoxUbsox: json["QLTOX,WLTOX,UBSOX"] == null
            ? null
            : The412C5F6D0.fromJson(json["QLTOX,WLTOX,UBSOX"]),
        pltowVltowTbsow: json["PLTOW,VLTOW,TBSOW"] == null
            ? null
            : The412C5F6D0.fromJson(json["PLTOW,VLTOW,TBSOW"]),
        pstdowVstdowTsdow: json["PSTDOW,VSTDOW,TSDOW"] == null
            ? null
            : The412C5F6D1.fromJson(json["PSTDOW,VSTDOW,TSDOW"]),
        qstdoxWstdoxUsdox: json["QSTDOX,WSTDOX,USDOX"] == null
            ? null
            : The412C5F6D1.fromJson(json["QSTDOX,WSTDOX,USDOX"]),
        qromoalmFtclp: json["QROMOALM,FTCLP"] == null
            ? null
            : The412C5F6D0.fromJson(json["QROMOALM,FTCLP"]),
        qaeFtlgp: json["QAE,FTLGP"] == null
            ? null
            : The412C5F6D1.fromJson(json["QAE,FTLGP"]),
        hprioxFtclp: json["HPRIOX,FTCLP"] == null
            ? null
            : The412C5F6D0.fromJson(json["HPRIOX,FTCLP"]),
        hecioxFtlgp: json["HECIOX,FTLGP"] == null
            ? null
            : The412C5F6D1.fromJson(json["HECIOX,FTLGP"]),
        sow3Wow2Ubsox: json["SOW3,WOW2,UBSOX"] == null
            ? null
            : EycloHtclo.fromJson(json["SOW3,WOW2,UBSOX"]),
        vow2Qow1Tsdow: json["VOW2,QOW1,TSDOW"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["VOW2,QOW1,TSDOW"]),
        wow3Row2Usdox: json["WOW3,ROW2,USDOX"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["WOW3,ROW2,USDOX"]),
        nbsowTow1S: json["NBSOW,TOW1S"] == null
            ? null
            : EnoYflx1.fromJson(json["NBSOW,TOW1S"]),
        obsoxUow1T: json["OBSOX,UOW1T"] == null
            ? null
            : EnoYflx1.fromJson(json["OBSOX,UOW1T"]),
        nstowTow1S: json["NSTOW,TOW1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["NSTOW,TOW1S"]),
        ostoxUow1T: json["OSTOX,UOW1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["OSTOX,UOW1T"]),
        lltoxObOb: json["LLTOX,OB,OB"] == null
            ? null
            : The412C5F6D0.fromJson(json["LLTOX,OB,OB"]),
        lstdoxFowbyd1TFowbyd1T: json["LSTDOX,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["LSTDOX,FOWBYD1T,FOWBYD1T"]),
        pbsoxObOb: json["PBSOX,OB,OB"] == null
            ? null
            : EycloHtclo.fromJson(json["PBSOX,OB,OB"]),
        psdoxFowbyd1TFowbyd1T: json["PSDOX,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["PSDOX,FOWBYD1T,FOWBYD1T"]),
        obsoxFtclp: json["OBSOX,FTCLP"] == null
            ? null
            : The412C5F6D0.fromJson(json["OBSOX,FTCLP"]),
        ostoxFtlgp: json["OSTOX,FTLGP"] == null
            ? null
            : The412C5F6D1.fromJson(json["OSTOX,FTLGP"]),
        bproxObOb: json["BPROX,OB,OB"] == null
            ? null
            : The412C5F6D0.fromJson(json["BPROX,OB,OB"]),
        becoxFowbyd1TFowbyd1T: json["BECOX,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["BECOX,FOWBYD1T,FOWBYD1T"]),
        poxObOb: json["POX,OB,OB"] == null
            ? null
            : EycloHtlgo.fromJson(json["POX,OB,OB"]),
        poxFowbyd1TFowbyd1T: json["POX,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["POX,FOWBYD1T,FOWBYD1T"]),
        wstdoxObOb: json["WSTDOX,OB,OB"] == null
            ? null
            : EycloHtlgo.fromJson(json["WSTDOX,OB,OB"]),
        wloyoxFowbyd1TFowbyd1T: json["WLOYOX,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["WLOYOX,FOWBYD1T,FOWBYD1T"]),
        gnoTow1S: json["GNO,TOW1S"] == null
            ? null
            : EnoYflx1.fromJson(json["GNO,TOW1S"]),
        hnpUow1T: json["HNP,UOW1T"] == null
            ? null
            : EnoYflx1.fromJson(json["HNP,UOW1T"]),
        gcoTow1S: json["GCO,TOW1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,TOW1S"]),
        hcpUow1T: json["HCP,UOW1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["HCP,UOW1T"]),
        snpObOb: json["SNP,OB,OB"] == null
            ? null
            : The412C5F6D0.fromJson(json["SNP,OB,OB"]),
        scpFowbyd1TFowbyd1T: json["SCP,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["SCP,FOWBYD1T,FOWBYD1T"]),
        ustdoxObOb: json["USTDOX,OB,OB"] == null
            ? null
            : EycloHtlgo.fromJson(json["USTDOX,OB,OB"]),
        uloyoxFowbyd1TFowbyd1T: json["ULOYOX,FOWBYD1T,FOWBYD1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["ULOYOX,FOWBYD1T,FOWBYD1T"]),
        hnpFtclp: json["HNP,FTCLP"] == null
            ? null
            : The412C5F6D0.fromJson(json["HNP,FTCLP"]),
        hcpFtlgp: json["HCP,FTLGP"] == null
            ? null
            : The412C5F6D1.fromJson(json["HCP,FTLGP"]),
        qromoalmObObOb: json["QROMOALM,OB,OB,OB"] == null
            ? null
            : The412C5F6D0.fromJson(json["QROMOALM,OB,OB,OB"]),
        hprioxObObOb: json["HPRIOX,OB,OB,OB"] == null
            ? null
            : The412C5F6D0.fromJson(json["HPRIOX,OB,OB,OB"]),
        uowtrUowtrTow1S: json["UOWTR,UOWTR,TOW1S"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["UOWTR,UOWTR,TOW1S"]),
        vowtsVowtsUow1T: json["VOWTS,VOWTS,UOW1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["VOWTS,VOWTS,UOW1T"]),
        how1TFtclp: json["HOW1T,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["HOW1T,FTCLP"]),
        how1TFtlgp: json["HOW1T,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HOW1T,FTLGP"]),
        how1TUow1T: json["HOW1T,UOW1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HOW1T,UOW1T"]),
        uylgpUow1T: json["UYLGP,UOW1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["UYLGP,UOW1T"]),
        uyclpUow1T: json["UYCLP,UOW1T"] == null
            ? null
            : EycloHtlgo.fromJson(json["UYCLP,UOW1T"]),
        tylgoTow1S: json["TYLGO,TOW1S"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,TOW1S"]),
        powtsPowtsFtlgp: json["POWTS,POWTS,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["POWTS,POWTS,FTLGP"]),
        powtsPowtsFtclp: json["POWTS,POWTS,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["POWTS,POWTS,FTCLP"]),
        oowtrOowtrEtlgo: json["OOWTR,OOWTR,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OOWTR,OOWTR,ETLGO"]),
        uyclpUyclpFtclp: json["UYCLP,UYCLP,FTCLP"] == null
            ? null
            : EycloHtclo.fromJson(json["UYCLP,UYCLP,FTCLP"]),
        uylgpUylgpFtlgp: json["UYLGP,UYLGP,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["UYLGP,UYLGP,FTLGP"]),
        ryclpFtclp: json["RYCLP,FTCLP"] == null
            ? null
            : EycloHtclo.fromJson(json["RYCLP,FTCLP"]),
        rn2PxoxRn2Pxox: json["RN2PXOX,RN2PXOX"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RN2PXOX,RN2PXOX"]),
        rylgpFtlgp: json["RYLGP,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RYLGP,FTLGP"]),
        in2XoyIn2Xoy: json["IN2XOY,IN2XOY"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["IN2XOY,IN2XOY"]),
        hn2XoxHn2Xox: json["HN2XOX,HN2XOX"] == null
            ? null
            : Hn2XoxHn2Xox.fromJson(json["HN2XOX,HN2XOX"]),
        qtsoQtsoTow1S: json["QTSO,QTSO,TOW1S"] == null
            ? null
            : The412C5F6D1.fromJson(json["QTSO,QTSO,TOW1S"]),
        rtspRtspUow1T: json["RTSP,RTSP,UOW1T"] == null
            ? null
            : The412C5F6D1.fromJson(json["RTSP,RTSP,UOW1T"]),
        fyclpFtclp: json["FYCLP,FTCLP"] == null
            ? null
            : EycloHtclo.fromJson(json["FYCLP,FTCLP"]),
        eylgoEtlgo: json["EYLGO,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["EYLGO,ETLGO"]),
        fylgpFtlgp: json["FYLGP,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["FYLGP,FTLGP"]),
        icsorvIcsorvFtclp: json["ICSORV,ICSORV,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["ICSORV,ICSORV,FTCLP"]),
        hcsoruHcsoruEtlgo: json["HCSORU,HCSORU,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HCSORU,HCSORU,ETLGO"]),
        icsorvIcsorvFtlgp: json["ICSORV,ICSORV,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["ICSORV,ICSORV,FTLGP"]),
        qeconallYflx1: json["QECONALL,YFLX1"] == null
            ? null
            : EnoYflx1.fromJson(json["QECONALL,YFLX1"]),
        reconalmAflx2: json["RECONALM,AFLX2"] == null
            ? null
            : EnoYflx1.fromJson(json["RECONALM,AFLX2"]),
        scpAflx2: json["SCP,AFLX2"] == null
            ? null
            : The412C5F6D1.fromJson(json["SCP,AFLX2"]),
        rnoYflx1: json["RNO,YFLX1"] == null
            ? null
            : EnoYflx1.fromJson(json["RNO,YFLX1"]),
        snpAflx2: json["SNP,AFLX2"] == null
            ? null
            : EnoYflx1.fromJson(json["SNP,AFLX2"]),
        rcoYflx1: json["RCO,YFLX1"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCO,YFLX1"]),
        how1SrHow1SrFtlgp: json["HOW1SR,HOW1SR,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HOW1SR,HOW1SR,FTLGP"]),
        how1SrHow1SrFtclp: json["HOW1SR,HOW1SR,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["HOW1SR,HOW1SR,FTCLP"]),
        qlgt1Yflx1: json["QLGT1,YFLX1"] == null
            ? null
            : EnoYflx1.fromJson(json["QLGT1,YFLX1"]),
        rlgt2Aflx2: json["RLGT2,AFLX2"] == null
            ? null
            : EycloHtlgo.fromJson(json["RLGT2,AFLX2"]),
        aflxtr2Aflxtr2: json["AFLXTR2,AFLXTR2"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["AFLXTR2,AFLXTR2"]),
        rsmt2Aflx2: json["RSMT2,AFLX2"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RSMT2,AFLX2"]),
        qsmt1Yflx1: json["QSMT1,YFLX1"] == null
            ? null
            : The412C5F6D1.fromJson(json["QSMT1,YFLX1"]),
        xrimspXlriegpUow1T: json["XRIMSP,XLRIEGP,UOW1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["XRIMSP,XLRIEGP,UOW1T"]),
        wrimsoWlriegoTow1S: json["WRIMSO,WLRIEGO,TOW1S"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["WRIMSO,WLRIEGO,TOW1S"]),
        rpr12MowTe12MowTow1S: json["RPR12MOW,TE12MOW,TOW1S"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RPR12MOW,TE12MOW,TOW1S"]),
        spr12MoxUe12MoxUow1T: json["SPR12MOX,UE12MOX,UOW1T"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["SPR12MOX,UE12MOX,UOW1T"]),
        mowtsMowtsFtclp: json["MOWTS,MOWTS,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["MOWTS,MOWTS,FTCLP"]),
        lowtrLowtrEtlgo: json["LOWTR,LOWTR,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["LOWTR,LOWTR,ETLGO"]),
        mowtsMowtsFtlgp: json["MOWTS,MOWTS,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["MOWTS,MOWTS,FTLGP"]),
        qow1SrQow1SrFtclp: json["QOW1SR,QOW1SR,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["QOW1SR,QOW1SR,FTCLP"]),
        qow1SrQow1SrFtlgp: json["QOW1SR,QOW1SR,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["QOW1SR,QOW1SR,FTLGP"]),
        enoYflx1: json["ENO,YFLX1"] == null
            ? null
            : EnoYflx1.fromJson(json["ENO,YFLX1"]),
        fnpAflx2: json["FNP,AFLX2"] == null
            ? null
            : EnoYflx1.fromJson(json["FNP,AFLX2"]),
        ecoYflx1: json["ECO,YFLX1"] == null
            ? null
            : The412C5F6D1.fromJson(json["ECO,YFLX1"]),
        fcpAflx2: json["FCP,AFLX2"] == null
            ? null
            : The412C5F6D1.fromJson(json["FCP,AFLX2"]),
        hsmt1Yflx1: json["HSMT1,YFLX1"] == null
            ? null
            : The412C5F6D1.fromJson(json["HSMT1,YFLX1"]),
        ismt2Aflx2: json["ISMT2,AFLX2"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["ISMT2,AFLX2"]),
        vow1SrVow1SrFtclp: json["VOW1SR,VOW1SR,FTCLP"] == null
            ? null
            : EycloHtlgo.fromJson(json["VOW1SR,VOW1SR,FTCLP"]),
        uow1SqUow1SqEtlgo: json["UOW1SQ,UOW1SQ,ETLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["UOW1SQ,UOW1SQ,ETLGO"]),
        vow1SrVow1SrFtlgp: json["VOW1SR,VOW1SR,FTLGP"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["VOW1SR,VOW1SR,FTLGP"]),
        fn2PxoxFn2Pxox: json["FN2PXOX,FN2PXOX"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["FN2PXOX,FN2PXOX"]),
        fowbyd1TFowbyd1TUbsox: json["FOWBYD1T,FOWBYD1T,UBSOX"] == null
            ? null
            : EycloHtlgo.fromJson(json["FOWBYD1T,FOWBYD1T,UBSOX"]),
        fowbyd1TFowbyd1TUsdox: json["FOWBYD1T,FOWBYD1T,USDOX"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["FOWBYD1T,FOWBYD1T,USDOX"]),
        tn2PxoxTn2Pxox: json["TN2PXOX,TN2PXOX"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TN2PXOX,TN2PXOX"]),
        oallWFare0WFare0: json["OALL,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["OALL,W_FARE0,W_FARE0"]),
        oadWtbsowWtbsow: json["OAD,WTBSOW,WTBSOW"] == null
            ? null
            : OadWtbsowWtbsow.fromJson(json["OAD,WTBSOW,WTBSOW"]),
        omxWtbsowWtbsow: json["OMX,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["OMX,WTBSOW,WTBSOW"]),
        uflowWtbsowWtbsow: json["UFLOW,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["UFLOW,WTBSOW,WTBSOW"]),
        uprowWtbsowWtbsow: json["UPROW,WTBSOW,WTBSOW"] == null
            ? null
            : UprowWtbsowWtbsow.fromJson(json["UPROW,WTBSOW,WTBSOW"]),
        uFare0WFare0WFare0: json["U_FARE0,W_FARE0,W_FARE0"] == null
            ? null
            : The412C5F6D0.fromJson(json["U_FARE0,W_FARE0,W_FARE0"]),
        uecowWtbsowWtbsow: json["UECOW,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["UECOW,WTBSOW,WTBSOW"]),
        vprowWFare0WFare0: json["VPROW,W_FARE0,W_FARE0"] == null
            ? null
            : OadWtbsowWtbsow.fromJson(json["VPROW,W_FARE0,W_FARE0"]),
        vplowWtbsowWtbsow: json["VPLOW,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["VPLOW,WTBSOW,WTBSOW"]),
        tprowWtbsowWtbsow: json["TPROW,WTBSOW,WTBSOW"] == null
            ? null
            : OadWtbsowWtbsow.fromJson(json["TPROW,WTBSOW,WTBSOW"]),
        vpmowWtbsowWtbsow: json["VPMOW,WTBSOW,WTBSOW"] == null
            ? null
            : VpmowWtbsowWtbsow.fromJson(json["VPMOW,WTBSOW,WTBSOW"]),
        tplowWtbsowWtbsow: json["TPLOW,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["TPLOW,WTBSOW,WTBSOW"]),
        tadWtbsowWtbsow: json["TAD,WTBSOW,WTBSOW"] == null
            ? null
            : OadWtbsowWtbsow.fromJson(json["TAD,WTBSOW,WTBSOW"]),
        tmxWtbsowWtbsow: json["TMX,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["TMX,WTBSOW,WTBSOW"]),
        teconallWFare0WFare0: json["TECONALL,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["TECONALL,W_FARE0,W_FARE0"]),
        tstdcsowWtbsowWtbsow: json["TSTDCSOW,WTBSOW,WTBSOW"] == null
            ? null
            : StdcsowWtbsowWtbsow.fromJson(json["TSTDCSOW,WTBSOW,WTBSOW"]),
        pFare0WFare0WFare0: json["P_FARE0,W_FARE0,W_FARE0"] == null
            ? null
            : The412C5F6D0.fromJson(json["P_FARE0,W_FARE0,W_FARE0"]),
        pstdowWtbsowWtbsow: json["PSTDOW,WTBSOW,WTBSOW"] == null
            ? null
            : PstdowWtbsowWtbsow.fromJson(json["PSTDOW,WTBSOW,WTBSOW"]),
        tltcsowWFare0WFare0: json["TLTCSOW,W_FARE0,W_FARE0"] == null
            ? null
            : KltcsowWtbsowWtbsow.fromJson(json["TLTCSOW,W_FARE0,W_FARE0"]),
        pflexowWtbsowWtbsow: json["PFLEXOW,WTBSOW,WTBSOW"] == null
            ? null
            : PflexowWtbsowWtbsow.fromJson(json["PFLEXOW,WTBSOW,WTBSOW"]),
        wFare0WFare0WFare0: json["W_FARE0,W_FARE0,W_FARE0"] == null
            ? null
            : The412C5F6D0.fromJson(json["W_FARE0,W_FARE0,W_FARE0"]),
        wecowWtbsowWtbsow: json["WECOW,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["WECOW,WTBSOW,WTBSOW"]),
        wflowWtbsowWtbsow: json["WFLOW,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["WFLOW,WTBSOW,WTBSOW"]),
        aco1RWtbsowWtbsow: json["ACO1R,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["ACO1R,WTBSOW,WTBSOW"]),
        gnorWFare0WFare0: json["GNOR,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["GNOR,W_FARE0,W_FARE0"]),
        gcorWtbsowWtbsow: json["GCOR,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["GCOR,WTBSOW,WTBSOW"]),
        gforWtbsowWtbsow: json["GFOR,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["GFOR,WTBSOW,WTBSOW"]),
        tnorWFare0WFare0: json["TNOR,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["TNOR,W_FARE0,W_FARE0"]),
        rforWtbsowWtbsow: json["RFOR,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["RFOR,WTBSOW,WTBSOW"]),
        tcorWtbsowWtbsow: json["TCOR,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["TCOR,WTBSOW,WTBSOW"]),
        rnorWFare0WFare0: json["RNOR,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["RNOR,W_FARE0,W_FARE0"]),
        rcorWtbsowWtbsow: json["RCOR,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["RCOR,WTBSOW,WTBSOW"]),
        tnorWtbsowWtbsow: json["TNOR,WTBSOW,WTBSOW"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["TNOR,WTBSOW,WTBSOW"]),
        ano1RWtbsowWtbsow: json["ANO1R,WTBSOW,WTBSOW"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["ANO1R,WTBSOW,WTBSOW"]),
        nnorWFare0WFare0: json["NNOR,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["NNOR,W_FARE0,W_FARE0"]),
        ncorWtbsowWtbsow: json["NCOR,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["NCOR,WTBSOW,WTBSOW"]),
        nforWtbsowWtbsow: json["NFOR,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["NFOR,WTBSOW,WTBSOW"]),
        enorWFare0WFare0: json["ENOR,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["ENOR,W_FARE0,W_FARE0"]),
        ecorWtbsowWtbsow: json["ECOR,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["ECOR,WTBSOW,WTBSOW"]),
        eforWtbsowWtbsow: json["EFOR,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["EFOR,WTBSOW,WTBSOW"]),
        tforWtbsowWtbsow: json["TFOR,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["TFOR,WTBSOW,WTBSOW"]),
        qnorWtbsowWtbsow: json["QNOR,WTBSOW,WTBSOW"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["QNOR,WTBSOW,WTBSOW"]),
        qnorWFare0WFare0: json["QNOR,W_FARE0,W_FARE0"] == null
            ? null
            : Ano1RWtbsowWtbsow.fromJson(json["QNOR,W_FARE0,W_FARE0"]),
        qcorWtbsowWtbsow: json["QCOR,WTBSOW,WTBSOW"] == null
            ? null
            : Aco1RWtbsowWtbsowClass.fromJson(json["QCOR,WTBSOW,WTBSOW"]),
        qforWtbsowWtbsow: json["QFOR,WTBSOW,WTBSOW"] == null
            ? null
            : EforWtbsowWtbsowClass.fromJson(json["QFOR,WTBSOW,WTBSOW"]),
        kltcsowWFare0WFare0: json["KLTCSOW,W_FARE0,W_FARE0"] == null
            ? null
            : KltcsowWtbsowWtbsow.fromJson(json["KLTCSOW,W_FARE0,W_FARE0"]),
        kstdcsowWtbsowWtbsow: json["KSTDCSOW,WTBSOW,WTBSOW"] == null
            ? null
            : StdcsowWtbsowWtbsow.fromJson(json["KSTDCSOW,WTBSOW,WTBSOW"]),
        kltcsowWtbsowWtbsow: json["KLTCSOW,WTBSOW,WTBSOW"] == null
            ? null
            : KltcsowWtbsowWtbsow.fromJson(json["KLTCSOW,WTBSOW,WTBSOW"]),
        eFare0EFare0: json["E_FARE0,E_FARE0"] == null
            ? null
            : The412C5F6D1.fromJson(json["E_FARE0,E_FARE0"]),
        kltowY1Pc20: json["KLTOW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["KLTOW,Y_1PC20"]),
        kstdowY0Pc: json["KSTDOW,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["KSTDOW,Y_0PC"]),
        kflexowY0Pc: json["KFLEXOW,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["KFLEXOW,Y_0PC"]),
        kflexowY1Pc25: json["KFLEXOW,Y_1PC25"] == null
            ? null
            : The412C5F6D1.fromJson(json["KFLEXOW,Y_1PC25"]),
        kltowY0Pc: json["KLTOW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["KLTOW,Y_0PC"]),
        kltowY1Pc25: json["KLTOW,Y_1PC25"] == null
            ? null
            : EnoYflx1.fromJson(json["KLTOW,Y_1PC25"]),
        kstdowY1Pc25: json["KSTDOW,Y_1PC25"] == null
            ? null
            : The412C5F6D1.fromJson(json["KSTDOW,Y_1PC25"]),
        kflexowY1Pc20: json["KFLEXOW,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["KFLEXOW,Y_1PC20"]),
        kstdowY1Pc20: json["KSTDOW,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["KSTDOW,Y_1PC20"]),
        oflowY0Pc: json["OFLOW,Y_0PC"] == null
            ? null
            : ObsowY1Pc20.fromJson(json["OFLOW,Y_0PC"]),
        osdowY1Pc25: json["OSDOW,Y_1PC25"] == null
            ? null
            : OflowY1Pc20.fromJson(json["OSDOW,Y_1PC25"]),
        oflowY1Pc20: json["OFLOW,Y_1PC20"] == null
            ? null
            : OflowY1Pc20.fromJson(json["OFLOW,Y_1PC20"]),
        oflowY1Pc25: json["OFLOW,Y_1PC25"] == null
            ? null
            : OflowY1Pc20.fromJson(json["OFLOW,Y_1PC25"]),
        obsowY0Pc: json["OBSOW,Y_0PC"] == null
            ? null
            : Y0Pc.fromJson(json["OBSOW,Y_0PC"]),
        obsowY1Pc20: json["OBSOW,Y_1PC20"] == null
            ? null
            : ObsowY1Pc20.fromJson(json["OBSOW,Y_1PC20"]),
        osdowY0Pc: json["OSDOW,Y_0PC"] == null
            ? null
            : ObsowY1Pc20.fromJson(json["OSDOW,Y_0PC"]),
        osdowY1Pc20: json["OSDOW,Y_1PC20"] == null
            ? null
            : OflowY1Pc20.fromJson(json["OSDOW,Y_1PC20"]),
        obsowY1Pc25: json["OBSOW,Y_1PC25"] == null
            ? null
            : ObsowY1Pc20.fromJson(json["OBSOW,Y_1PC25"]),
        oowY0Pc: json["OOW,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["OOW,Y_0PC"]),
        oowY1Pc20: json["OOW,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OOW,Y_1PC20"]),
        oowY1Pc25: json["OOW,Y_1PC25"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OOW,Y_1PC25"]),
        mowY0Pc: json["MOW,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["MOW,Y_0PC"]),
        mowY1Pc20: json["MOW,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["MOW,Y_1PC20"]),
        mowY1Pc25: json["MOW,Y_1PC25"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["MOW,Y_1PC25"]),
        eflowY1Pc25: json["EFLOW,Y_1PC25"] == null
            ? null
            : EflowY1Pc20.fromJson(json["EFLOW,Y_1PC25"]),
        eprowY1Pc20: json["EPROW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["EPROW,Y_1PC20"]),
        y1Pc10Y1Pc20: json["Y_1PC10,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["Y_1PC10,Y_1PC20"]),
        eprowY1Pc25: json["EPROW,Y_1PC25"] == null
            ? null
            : EnoYflx1.fromJson(json["EPROW,Y_1PC25"]),
        y1Pc10Y1Pc25: json["Y_1PC10,Y_1PC25"] == null
            ? null
            : The412C5F6D1.fromJson(json["Y_1PC10,Y_1PC25"]),
        eflowY1Pc20: json["EFLOW,Y_1PC20"] == null
            ? null
            : EflowY1Pc20.fromJson(json["EFLOW,Y_1PC20"]),
        eprowY0Pc: json["EPROW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["EPROW,Y_0PC"]),
        y1Pc10Y0Pc: json["Y_1PC10,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["Y_1PC10,Y_0PC"]),
        eflowY0Pc: json["EFLOW,Y_0PC"] == null
            ? null
            : EflowY0Pc.fromJson(json["EFLOW,Y_0PC"]),
        rcoY1Pc25: json["RCO,Y_1PC25"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCO,Y_1PC25"]),
        rfoY0Pc: json["RFO,Y_0PC"] == null
            ? null
            : NplowHtclo.fromJson(json["RFO,Y_0PC"]),
        rfoY1Pc20: json["RFO,Y_1PC20"] == null
            ? null
            : EfoY1Pc32.fromJson(json["RFO,Y_1PC20"]),
        rcoY1Pc20: json["RCO,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["RCO,Y_1PC20"]),
        rnoY1Pc20: json["RNO,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["RNO,Y_1PC20"]),
        rcoY0Pc: json["RCO,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["RCO,Y_0PC"]),
        rnoY1Pc25: json["RNO,Y_1PC25"] == null
            ? null
            : EnoYflx1.fromJson(json["RNO,Y_1PC25"]),
        rfoY1Pc25: json["RFO,Y_1PC25"] == null
            ? null
            : EfoY1Pc32.fromJson(json["RFO,Y_1PC25"]),
        rnoY0Pc: json["RNO,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["RNO,Y_0PC"]),
        vstdowY0Pc: json["VSTDOW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["VSTDOW,Y_0PC"]),
        vstdowY1Pc20: json["VSTDOW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["VSTDOW,Y_1PC20"]),
        vstdowY1Pc25: json["VSTDOW,Y_1PC25"] == null
            ? null
            : EnoYflx1.fromJson(json["VSTDOW,Y_1PC25"]),
        tstdowY0Pc: json["TSTDOW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["TSTDOW,Y_0PC"]),
        tstdowY1Pc20: json["TSTDOW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["TSTDOW,Y_1PC20"]),
        tstdowY1Pc25: json["TSTDOW,Y_1PC25"] == null
            ? null
            : EnoYflx1.fromJson(json["TSTDOW,Y_1PC25"]),
        promoallY1Pc20: json["PROMOALL,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["PROMOALL,Y_1PC20"]),
        padY1Pc20: json["PAD,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,Y_1PC20"]),
        y1Pc20Y1Pc20: json["Y_1PC20,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["Y_1PC20,Y_1PC20"]),
        pmxY1Pc20: json["PMX,Y_1PC20"] == null
            ? null
            : OflowGfliowHtlgo.fromJson(json["PMX,Y_1PC20"]),
        gpriowY1Pc20: json["GPRIOW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["GPRIOW,Y_1PC20"]),
        geciowY1Pc20: json["GECIOW,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["GECIOW,Y_1PC20"]),
        ufliowY1Pc20: json["UFLIOW,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["UFLIOW,Y_1PC20"]),
        gpriowY0Pc: json["GPRIOW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["GPRIOW,Y_0PC"]),
        gpriowY1Pc23: json["GPRIOW,Y_1PC23"] == null
            ? null
            : EnoYflx1.fromJson(json["GPRIOW,Y_1PC23"]),
        geciowY0Pc: json["GECIOW,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["GECIOW,Y_0PC"]),
        geciowY1Pc23: json["GECIOW,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["GECIOW,Y_1PC23"]),
        ufliowY0Pc: json["UFLIOW,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["UFLIOW,Y_0PC"]),
        ufliowY1Pc23: json["UFLIOW,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["UFLIOW,Y_1PC23"]),
        promoallY0Pc: json["PROMOALL,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["PROMOALL,Y_0PC"]),
        promoallY1Pc23: json["PROMOALL,Y_1PC23"] == null
            ? null
            : EnoYflx1.fromJson(json["PROMOALL,Y_1PC23"]),
        padY0Pc: json["PAD,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["PAD,Y_0PC"]),
        padY1Pc23: json["PAD,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,Y_1PC23"]),
        pmxY0Pc: json["PMX,Y_0PC"] == null
            ? null
            : OflowGfliowHtclo.fromJson(json["PMX,Y_0PC"]),
        pmxY1Pc23: json["PMX,Y_1PC23"] == null
            ? null
            : OflowGfliowHtlgo.fromJson(json["PMX,Y_1PC23"]),
        nbsowY1Pc20: json["NBSOW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["NBSOW,Y_1PC20"]),
        nstowY1Pc20: json["NSTOW,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["NSTOW,Y_1PC20"]),
        nplowY1Pc20: json["NPLOW,Y_1PC20"] == null
            ? null
            : EfoY1Pc32.fromJson(json["NPLOW,Y_1PC20"]),
        gnoY1Pc20: json["GNO,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["GNO,Y_1PC20"]),
        gcoY1Pc20: json["GCO,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,Y_1PC20"]),
        gfoY1Pc20: json["GFO,Y_1PC20"] == null
            ? null
            : The412C5F6D1.fromJson(json["GFO,Y_1PC20"]),
        nplowY1Pc23: json["NPLOW,Y_1PC23"] == null
            ? null
            : EfoY1Pc32.fromJson(json["NPLOW,Y_1PC23"]),
        nbsowY0Pc: json["NBSOW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["NBSOW,Y_0PC"]),
        nbsowY1Pc23: json["NBSOW,Y_1PC23"] == null
            ? null
            : EnoYflx1.fromJson(json["NBSOW,Y_1PC23"]),
        nstowY0Pc: json["NSTOW,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["NSTOW,Y_0PC"]),
        nstowY1Pc23: json["NSTOW,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["NSTOW,Y_1PC23"]),
        nplowY0Pc: json["NPLOW,Y_0PC"] == null
            ? null
            : NplowHtclo.fromJson(json["NPLOW,Y_0PC"]),
        oflowGfliowY1Pc20: json["OFLOW,GFLIOW,Y_1PC20"] == null
            ? null
            : OflowGfliowHtlgo.fromJson(json["OFLOW,GFLIOW,Y_1PC20"]),
        oprowGpriowY1Pc20: json["OPROW,GPRIOW,Y_1PC20"] == null
            ? null
            : EnoYflx1.fromJson(json["OPROW,GPRIOW,Y_1PC20"]),
        oecowGeciowY1Pc20: json["OECOW,GECIOW,Y_1PC20"] == null
            ? null
            : EflowY1Pc20.fromJson(json["OECOW,GECIOW,Y_1PC20"]),
        oflowGfliowY0Pc: json["OFLOW,GFLIOW,Y_0PC"] == null
            ? null
            : OflowGfliowHtclo.fromJson(json["OFLOW,GFLIOW,Y_0PC"]),
        oflowGfliowY1Pc23: json["OFLOW,GFLIOW,Y_1PC23"] == null
            ? null
            : OflowGfliowHtlgo.fromJson(json["OFLOW,GFLIOW,Y_1PC23"]),
        oprowGpriowY0Pc: json["OPROW,GPRIOW,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["OPROW,GPRIOW,Y_0PC"]),
        oprowGpriowY1Pc23: json["OPROW,GPRIOW,Y_1PC23"] == null
            ? null
            : EnoYflx1.fromJson(json["OPROW,GPRIOW,Y_1PC23"]),
        oecowGeciowY0Pc: json["OECOW,GECIOW,Y_0PC"] == null
            ? null
            : EflowY0Pc.fromJson(json["OECOW,GECIOW,Y_0PC"]),
        oecowGeciowY1Pc23: json["OECOW,GECIOW,Y_1PC23"] == null
            ? null
            : EflowY1Pc20.fromJson(json["OECOW,GECIOW,Y_1PC23"]),
        gcoY1Pc23: json["GCO,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,Y_1PC23"]),
        gfoY0Pc: json["GFO,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["GFO,Y_0PC"]),
        gfoY1Pc23: json["GFO,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["GFO,Y_1PC23"]),
        gnoY0Pc: json["GNO,Y_0PC"] == null
            ? null
            : The412C5F6D0.fromJson(json["GNO,Y_0PC"]),
        gnoY1Pc23: json["GNO,Y_1PC23"] == null
            ? null
            : EnoYflx1.fromJson(json["GNO,Y_1PC23"]),
        gcoY0Pc: json["GCO,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["GCO,Y_0PC"]),
        pmxHtclo: json["PMX,HTCLO"] == null
            ? null
            : OflowGfliowHtclo.fromJson(json["PMX,HTCLO"]),
        pmxHtlgo: json["PMX,HTLGO"] == null
            ? null
            : OflowGfliowHtlgo.fromJson(json["PMX,HTLGO"]),
        promoallHtclo: json["PROMOALL,HTCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["PROMOALL,HTCLO"]),
        promoallHtlgo: json["PROMOALL,HTLGO"] == null
            ? null
            : EnoYflx1.fromJson(json["PROMOALL,HTLGO"]),
        padHtclo: json["PAD,HTCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["PAD,HTCLO"]),
        padHtlgo: json["PAD,HTLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["PAD,HTLGO"]),
        y1Pc20Y0Pc: json["Y_1PC20,Y_0PC"] == null
            ? null
            : EnoYflx1.fromJson(json["Y_1PC20,Y_0PC"]),
        y1Pc20Y1Pc23: json["Y_1PC20,Y_1PC23"] == null
            ? null
            : The412C5F6D1.fromJson(json["Y_1PC20,Y_1PC23"]),
        geciowHtlgo: json["GECIOW,HTLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GECIOW,HTLGO"]),
        ufliowHtclo: json["UFLIOW,HTCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["UFLIOW,HTCLO"]),
        ufliowHtlgo: json["UFLIOW,HTLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["UFLIOW,HTLGO"]),
        gpriowHtclo: json["GPRIOW,HTCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GPRIOW,HTCLO"]),
        gpriowHtlgo: json["GPRIOW,HTLGO"] == null
            ? null
            : EnoYflx1.fromJson(json["GPRIOW,HTLGO"]),
        geciowHtclo: json["GECIOW,HTCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["GECIOW,HTCLO"]),
        uowtrUowtrY1Pc20: json["UOWTR,UOWTR,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["UOWTR,UOWTR,Y_1PC20"]),
        uowtuUowtuY1Pc20: json["UOWTU,UOWTU,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["UOWTU,UOWTU,Y_1PC20"]),
        nplowHtclo: json["NPLOW,HTCLO"] == null
            ? null
            : NplowHtclo.fromJson(json["NPLOW,HTCLO"]),
        nplowHtlgo: json["NPLOW,HTLGO"] == null
            ? null
            : EfoY1Pc32.fromJson(json["NPLOW,HTLGO"]),
        nbsowHtclo: json["NBSOW,HTCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["NBSOW,HTCLO"]),
        nbsowHtlgo: json["NBSOW,HTLGO"] == null
            ? null
            : EnoYflx1.fromJson(json["NBSOW,HTLGO"]),
        nstowHtclo: json["NSTOW,HTCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["NSTOW,HTCLO"]),
        nstowHtlgo: json["NSTOW,HTLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["NSTOW,HTLGO"]),
        oecowGeciowHtclo: json["OECOW,GECIOW,HTCLO"] == null
            ? null
            : EflowY0Pc.fromJson(json["OECOW,GECIOW,HTCLO"]),
        oecowGeciowHtlgo: json["OECOW,GECIOW,HTLGO"] == null
            ? null
            : EflowY1Pc20.fromJson(json["OECOW,GECIOW,HTLGO"]),
        oflowGfliowHtclo: json["OFLOW,GFLIOW,HTCLO"] == null
            ? null
            : OflowGfliowHtclo.fromJson(json["OFLOW,GFLIOW,HTCLO"]),
        oflowGfliowHtlgo: json["OFLOW,GFLIOW,HTLGO"] == null
            ? null
            : OflowGfliowHtlgo.fromJson(json["OFLOW,GFLIOW,HTLGO"]),
        oprowGpriowHtclo: json["OPROW,GPRIOW,HTCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["OPROW,GPRIOW,HTCLO"]),
        oprowGpriowHtlgo: json["OPROW,GPRIOW,HTLGO"] == null
            ? null
            : EnoYflx1.fromJson(json["OPROW,GPRIOW,HTLGO"]),
        tycloY1Pc20: json["TYCLO,Y_1PC20"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYCLO,Y_1PC20"]),
        tylgoY1Pc20: json["TYLGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,Y_1PC20"]),
        gnoHtlgo: json["GNO,HTLGO"] == null
            ? null
            : EnoYflx1.fromJson(json["GNO,HTLGO"]),
        gcoHtclo: json["GCO,HTCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["GCO,HTCLO"]),
        gcoHtlgo: json["GCO,HTLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,HTLGO"]),
        gfoHtclo: json["GFO,HTCLO"] == null
            ? null
            : EnoYflx1.fromJson(json["GFO,HTCLO"]),
        gfoHtlgo: json["GFO,HTLGO"] == null
            ? null
            : The412C5F6D1.fromJson(json["GFO,HTLGO"]),
        gnoHtclo: json["GNO,HTCLO"] == null
            ? null
            : The412C5F6D0.fromJson(json["GNO,HTCLO"]),
        tyfloY1Pc20: json["TYFLO,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["TYFLO,Y_1PC20"]),
        tycloTycloY1Pc20: json["TYCLO,TYCLO,Y_1PC20"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYCLO,TYCLO,Y_1PC20"]),
        tylgoTylgoY1Pc20: json["TYLGO,TYLGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,TYLGO,Y_1PC20"]),
        tylgoTylgoY1Pc23: json["TYLGO,TYLGO,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,TYLGO,Y_1PC23"]),
        tycloTycloY0Pc: json["TYCLO,TYCLO,Y_0PC"] == null
            ? null
            : EycloHtclo.fromJson(json["TYCLO,TYCLO,Y_0PC"]),
        tycloTycloY1Pc23: json["TYCLO,TYCLO,Y_1PC23"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYCLO,TYCLO,Y_1PC23"]),
        tylgoTylgoY0Pc: json["TYLGO,TYLGO,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYLGO,TYLGO,Y_0PC"]),
        qycloY1Pc20: json["QYCLO,Y_1PC20"] == null
            ? null
            : EycloHtlgo.fromJson(json["QYCLO,Y_1PC20"]),
        qylgoY1Pc20: json["QYLGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["QYLGO,Y_1PC20"]),
        qyfloY1Pc20: json["QYFLO,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["QYFLO,Y_1PC20"]),
        uowtrUowtrHtclo: json["UOWTR,UOWTR,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["UOWTR,UOWTR,HTCLO"]),
        uowtrUowtrHtlgo: json["UOWTR,UOWTR,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["UOWTR,UOWTR,HTLGO"]),
        uowtuUowtuHtclo: json["UOWTU,UOWTU,HTCLO"] == null
            ? null
            : EyfloY0Pc.fromJson(json["UOWTU,UOWTU,HTCLO"]),
        uowtuUowtuHtlgo: json["UOWTU,UOWTU,HTLGO"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["UOWTU,UOWTU,HTLGO"]),
        tylgoHtclo: json["TYLGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYLGO,HTCLO"]),
        tylgoHtlgo: json["TYLGO,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,HTLGO"]),
        tycloHtclo: json["TYCLO,HTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["TYCLO,HTCLO"]),
        tycloHtlgo: json["TYCLO,HTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYCLO,HTLGO"]),
        eyfloY1Pc23: json["EYFLO,Y_1PC23"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["EYFLO,Y_1PC23"]),
        eycloY0Pc: json["EYCLO,Y_0PC"] == null
            ? null
            : EycloHtclo.fromJson(json["EYCLO,Y_0PC"]),
        eycloY1Pc23: json["EYCLO,Y_1PC23"] == null
            ? null
            : EycloHtlgo.fromJson(json["EYCLO,Y_1PC23"]),
        eylgoY0Pc: json["EYLGO,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["EYLGO,Y_0PC"]),
        eylgoY1Pc23: json["EYLGO,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["EYLGO,Y_1PC23"]),
        eyfloY0Pc: json["EYFLO,Y_0PC"] == null
            ? null
            : EyfloY0Pc.fromJson(json["EYFLO,Y_0PC"]),
        tyfloHtclo: json["TYFLO,HTCLO"] == null
            ? null
            : EyfloY0Pc.fromJson(json["TYFLO,HTCLO"]),
        tyfloHtlgo: json["TYFLO,HTLGO"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["TYFLO,HTLGO"]),
        qycloY0Pc: json["QYCLO,Y_0PC"] == null
            ? null
            : EycloHtclo.fromJson(json["QYCLO,Y_0PC"]),
        qycloY1Pc23: json["QYCLO,Y_1PC23"] == null
            ? null
            : EycloHtlgo.fromJson(json["QYCLO,Y_1PC23"]),
        qylgoY0Pc: json["QYLGO,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["QYLGO,Y_0PC"]),
        qyfloY0Pc: json["QYFLO,Y_0PC"] == null
            ? null
            : EyfloY0Pc.fromJson(json["QYFLO,Y_0PC"]),
        qylgoY1Pc23: json["QYLGO,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["QYLGO,Y_1PC23"]),
        qyfloY1Pc23: json["QYFLO,Y_1PC23"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["QYFLO,Y_1PC23"]),
        gnoY1Pc32: json["GNO,Y_1PC32"] == null
            ? null
            : EnoYflx1.fromJson(json["GNO,Y_1PC32"]),
        gcoY1Pc32: json["GCO,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["GCO,Y_1PC32"]),
        gfoY1Pc32: json["GFO,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["GFO,Y_1PC32"]),
        lowtrLowtrY1Pc20: json["LOWTR,LOWTR,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["LOWTR,LOWTR,Y_1PC20"]),
        lowtuLowtuY1Pc20: json["LOWTU,LOWTU,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["LOWTU,LOWTU,Y_1PC20"]),
        qeconallY1Pc32: json["QECONALL,Y_1PC32"] == null
            ? null
            : EnoYflx1.fromJson(json["QECONALL,Y_1PC32"]),
        y1Pc10Y1Pc32: json["Y_1PC10,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["Y_1PC10,Y_1PC32"]),
        y1Pc20Y1Pc32: json["Y_1PC20,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["Y_1PC20,Y_1PC32"]),
        eycloY1Pc20: json["EYCLO,Y_1PC20"] == null
            ? null
            : EycloHtlgo.fromJson(json["EYCLO,Y_1PC20"]),
        eylgoY1Pc20: json["EYLGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["EYLGO,Y_1PC20"]),
        eyfloY1Pc20: json["EYFLO,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["EYFLO,Y_1PC20"]),
        qlgt1Y1Pc32: json["QLGT1,Y_1PC32"] == null
            ? null
            : EnoYflx1.fromJson(json["QLGT1,Y_1PC32"]),
        qsmt1Y1Pc32: json["QSMT1,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["QSMT1,Y_1PC32"]),
        mflx1Y1Pc32: json["MFLX1,Y_1PC32"] == null
            ? null
            : EflowY1Pc20.fromJson(json["MFLX1,Y_1PC32"]),
        rpr12MowTe12MowY1Pc20: json["RPR12MOW,TE12MOW,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RPR12MOW,TE12MOW,Y_1PC20"]),
        enoY1Pc32: json["ENO,Y_1PC32"] == null
            ? null
            : EnoYflx1.fromJson(json["ENO,Y_1PC32"]),
        ecoY1Pc32: json["ECO,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["ECO,Y_1PC32"]),
        efoY1Pc32: json["EFO,Y_1PC32"] == null
            ? null
            : EfoY1Pc32.fromJson(json["EFO,Y_1PC32"]),
        hsmt1Y1Pc32: json["HSMT1,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["HSMT1,Y_1PC32"]),
        wrimsoWlriegoY1Pc20: json["WRIMSO,WLRIEGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["WRIMSO,WLRIEGO,Y_1PC20"]),
        kremsoKlreegoY1Pc20: json["KREMSO,KLREEGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["KREMSO,KLREEGO,Y_1PC20"]),
        tycloTycloHtclo: json["TYCLO,TYCLO,HTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["TYCLO,TYCLO,HTCLO"]),
        tycloTycloHtlgo: json["TYCLO,TYCLO,HTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYCLO,TYCLO,HTLGO"]),
        tylgoTylgoHtclo: json["TYLGO,TYLGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["TYLGO,TYLGO,HTCLO"]),
        tylgoTylgoHtlgo: json["TYLGO,TYLGO,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["TYLGO,TYLGO,HTLGO"]),
        tfoY1Pc32: json["TFO,Y_1PC32"] == null
            ? null
            : EfoY1Pc32.fromJson(json["TFO,Y_1PC32"]),
        tnoY1Pc32: json["TNO,Y_1PC32"] == null
            ? null
            : EnoYflx1.fromJson(json["TNO,Y_1PC32"]),
        tcoY1Pc32: json["TCO,Y_1PC32"] == null
            ? null
            : The412C5F6D1.fromJson(json["TCO,Y_1PC32"]),
        qyfloHtclo: json["QYFLO,HTCLO"] == null
            ? null
            : EyfloY0Pc.fromJson(json["QYFLO,HTCLO"]),
        qycloHtclo: json["QYCLO,HTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["QYCLO,HTCLO"]),
        qycloHtlgo: json["QYCLO,HTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["QYCLO,HTLGO"]),
        qylgoHtclo: json["QYLGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["QYLGO,HTCLO"]),
        lowtuLowtuY0Pc: json["LOWTU,LOWTU,Y_0PC"] == null
            ? null
            : EyfloY0Pc.fromJson(json["LOWTU,LOWTU,Y_0PC"]),
        lowtuLowtuY1Pc23: json["LOWTU,LOWTU,Y_1PC23"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["LOWTU,LOWTU,Y_1PC23"]),
        lowtrLowtrY0Pc: json["LOWTR,LOWTR,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["LOWTR,LOWTR,Y_0PC"]),
        lowtrLowtrY1Pc23: json["LOWTR,LOWTR,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["LOWTR,LOWTR,Y_1PC23"]),
        oycloY1Pc20: json["OYCLO,Y_1PC20"] == null
            ? null
            : EycloHtlgo.fromJson(json["OYCLO,Y_1PC20"]),
        oylgoY1Pc20: json["OYLGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OYLGO,Y_1PC20"]),
        oyfloY1Pc20: json["OYFLO,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["OYFLO,Y_1PC20"]),
        oylgoY1Pc23: json["OYLGO,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OYLGO,Y_1PC23"]),
        oyfloY0Pc: json["OYFLO,Y_0PC"] == null
            ? null
            : EyfloY0Pc.fromJson(json["OYFLO,Y_0PC"]),
        oyfloY1Pc23: json["OYFLO,Y_1PC23"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["OYFLO,Y_1PC23"]),
        oycloY0Pc: json["OYCLO,Y_0PC"] == null
            ? null
            : EycloHtclo.fromJson(json["OYCLO,Y_0PC"]),
        oycloY1Pc23: json["OYCLO,Y_1PC23"] == null
            ? null
            : EycloHtlgo.fromJson(json["OYCLO,Y_1PC23"]),
        oylgoY0Pc: json["OYLGO,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["OYLGO,Y_0PC"]),
        eycloHtclo: json["EYCLO,HTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["EYCLO,HTCLO"]),
        eycloHtlgo: json["EYCLO,HTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["EYCLO,HTLGO"]),
        eylgoHtclo: json["EYLGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["EYLGO,HTCLO"]),
        kremsoKlreegoHtclo: json["KREMSO,KLREEGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["KREMSO,KLREEGO,HTCLO"]),
        kremsoKlreegoHtlgo: json["KREMSO,KLREEGO,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["KREMSO,KLREEGO,HTLGO"]),
        wrimsoWlriegoHtclo: json["WRIMSO,WLRIEGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["WRIMSO,WLRIEGO,HTCLO"]),
        wrimsoWlriegoHtlgo: json["WRIMSO,WLRIEGO,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["WRIMSO,WLRIEGO,HTLGO"]),
        lowtrLowtrHtclo: json["LOWTR,LOWTR,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["LOWTR,LOWTR,HTCLO"]),
        lowtrLowtrHtlgo: json["LOWTR,LOWTR,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["LOWTR,LOWTR,HTLGO"]),
        lowtuLowtuHtclo: json["LOWTU,LOWTU,HTCLO"] == null
            ? null
            : EyfloY0Pc.fromJson(json["LOWTU,LOWTU,HTCLO"]),
        lowtuLowtuHtlgo: json["LOWTU,LOWTU,HTLGO"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["LOWTU,LOWTU,HTLGO"]),
        wWY0Pc:
            json["W,W,Y_0PC"] == null ? null : Y0Pc.fromJson(json["W,W,Y_0PC"]),
        wWY1Pc20: json["W,W,Y_1PC20"] == null
            ? null
            : ObsowY1Pc20.fromJson(json["W,W,Y_1PC20"]),
        yYY1Pc20: json["Y,Y,Y_1PC20"] == null
            ? null
            : OflowY1Pc20.fromJson(json["Y,Y,Y_1PC20"]),
        wWY1Pc25: json["W,W,Y_1PC25"] == null
            ? null
            : ObsowY1Pc20.fromJson(json["W,W,Y_1PC25"]),
        yYY1Pc25: json["Y,Y,Y_1PC25"] == null
            ? null
            : OflowY1Pc20.fromJson(json["Y,Y,Y_1PC25"]),
        rpr12MowTe12MowHtlgo: json["RPR12MOW,TE12MOW,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RPR12MOW,TE12MOW,HTLGO"]),
        rpr12MowTe12MowHtclo: json["RPR12MOW,TE12MOW,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["RPR12MOW,TE12MOW,HTCLO"]),
        oylgoHtclo: json["OYLGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["OYLGO,HTCLO"]),
        oycloHtclo: json["OYCLO,HTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["OYCLO,HTCLO"]),
        oycloHtlgo: json["OYCLO,HTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["OYCLO,HTLGO"]),
        rpr12MowKtkcsowY1Pc20: json["RPR12MOW,KTKCSOW,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RPR12MOW,KTKCSOW,Y_1PC20"]),
        oob7Ru1Oob7Ru1Y1Pc20: json["OOB7RU1,OOB7RU1,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OOB7RU1,OOB7RU1,Y_1PC20"]),
        hyfloY0Pc: json["HYFLO,Y_0PC"] == null
            ? null
            : EyfloY0Pc.fromJson(json["HYFLO,Y_0PC"]),
        hylgoY1Pc23: json["HYLGO,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HYLGO,Y_1PC23"]),
        hyfloY1Pc23: json["HYFLO,Y_1PC23"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["HYFLO,Y_1PC23"]),
        hycloY0Pc: json["HYCLO,Y_0PC"] == null
            ? null
            : EycloHtclo.fromJson(json["HYCLO,Y_0PC"]),
        hycloY1Pc23: json["HYCLO,Y_1PC23"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYCLO,Y_1PC23"]),
        hylgoY0Pc: json["HYLGO,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYLGO,Y_0PC"]),
        hylgoOtlgo: json["HYLGO,OTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HYLGO,OTLGO"]),
        hyfloOtlgo: json["HYFLO,OTLGO"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["HYFLO,OTLGO"]),
        hycloOtclo: json["HYCLO,OTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["HYCLO,OTCLO"]),
        hycloOtlgo: json["HYCLO,OTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYCLO,OTLGO"]),
        hylgoOtclo: json["HYLGO,OTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYLGO,OTCLO"]),
        hyfloOtclo: json["HYFLO,OTCLO"] == null
            ? null
            : EyfloY0Pc.fromJson(json["HYFLO,OTCLO"]),
        hycloY1Pc20: json["HYCLO,Y_1PC20"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYCLO,Y_1PC20"]),
        hylgoY1Pc20: json["HYLGO,Y_1PC20"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["HYLGO,Y_1PC20"]),
        hyfloY1Pc20: json["HYFLO,Y_1PC20"] == null
            ? null
            : EyfloY1Pc20.fromJson(json["HYFLO,Y_1PC20"]),
        oob7Ru1Oob7Ru1Y0Pc: json["OOB7RU1,OOB7RU1,Y_0PC"] == null
            ? null
            : EycloHtlgo.fromJson(json["OOB7RU1,OOB7RU1,Y_0PC"]),
        oob7Ru1Oob7Ru1Y1Pc23: json["OOB7RU1,OOB7RU1,Y_1PC23"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OOB7RU1,OOB7RU1,Y_1PC23"]),
        rpr12MowKtkcsowHtclo: json["RPR12MOW,KTKCSOW,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["RPR12MOW,KTKCSOW,HTCLO"]),
        rpr12MowKtkcsowHtlgo: json["RPR12MOW,KTKCSOW,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["RPR12MOW,KTKCSOW,HTLGO"]),
        hycloHtclo: json["HYCLO,HTCLO"] == null
            ? null
            : EycloHtclo.fromJson(json["HYCLO,HTCLO"]),
        hycloHtlgo: json["HYCLO,HTLGO"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYCLO,HTLGO"]),
        hylgoHtclo: json["HYLGO,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["HYLGO,HTCLO"]),
        hyfloHtclo: json["HYFLO,HTCLO"] == null
            ? null
            : EyfloY0Pc.fromJson(json["HYFLO,HTCLO"]),
        oob7Ru1Oob7Ru1Htlgo: json["OOB7RU1,OOB7RU1,HTLGO"] == null
            ? null
            : Aflxtr2Aflxtr2.fromJson(json["OOB7RU1,OOB7RU1,HTLGO"]),
        oob7Ru1Oob7Ru1Htclo: json["OOB7RU1,OOB7RU1,HTCLO"] == null
            ? null
            : EycloHtlgo.fromJson(json["OOB7RU1,OOB7RU1,HTCLO"]),
      );

  Map<String, dynamic> toJson() => {
        "YFLXTR1,YFLXTR1": yflxtr1Yflxtr1?.toJson(),
        "EOWBYD1S,EOWBYD1S": eowbyd1SEowbyd1S?.toJson(),
        "QLTOW": qltow?.toJson(),
        "QFLOW": qflow?.toJson(),
        "YOW": yow?.toJson(),
        "Y_0PC,Y_1PC23": y0PcY1Pc23?.toJson(),
        "Y_1PC30,Y_1PC30": y1Pc30Y1Pc30?.toJson(),
        "Y_0PC,Y_0PC": y0PcY0Pc?.toJson(),
        "OALL,WTBSOW,WTBSOW": oallWtbsowWtbsow?.toJson(),
        "OAD,WTSDOW,WTSDOW": oadWtsdowWtsdow?.toJson(),
        "VPROW,WTBSOW,WTBSOW": vprowWtbsowWtbsow?.toJson(),
        "TAD,WTSDOW,WTSDOW": tadWtsdowWtsdow?.toJson(),
        "TECONALL,WTBSOW,WTBSOW": teconallWtbsowWtbsow?.toJson(),
        "PLTOW,WTBSOW,WTBSOW": pltowWtbsowWtbsow?.toJson(),
        "TLTCSOW,WTBSOW,WTBSOW": tltcsowWtbsowWtbsow?.toJson(),
        "PSTDOW,WTSDOW,WTSDOW": pstdowWtsdowWtsdow?.toJson(),
        "TSTDCSOW,WTSDOW,WTSDOW": tstdcsowWtsdowWtsdow?.toJson(),
        "OBSOW,TBSOW": obsowTbsow?.toJson(),
        "OSDOW,TSDOW": osdowTsdow?.toJson(),
        "LLTOW,TBSOW": lltowTbsow?.toJson(),
        "LSTDOW,TSDOW": lstdowTsdow?.toJson(),
        "OPROW,WTBSOW,WTBSOW": oprowWtbsowWtbsow?.toJson(),
        "OECOW,WTSDOW,WTSDOW": oecowWtsdowWtsdow?.toJson(),
        "EECOW,TSDOW": eecowTsdow?.toJson(),
        "EPROW,TBSOW": eprowTbsow?.toJson(),
        "WPROW,WTBSOW,WTBSOW": wprowWtbsowWtbsow?.toJson(),
        "WECOW,WTSDOW,WTSDOW": wecowWtsdowWtsdow?.toJson(),
        "GNOR,WTBSOW,WTBSOW": gnorWtbsowWtbsow?.toJson(),
        "GCOR,WTSDOW,WTSDOW": gcorWtsdowWtsdow?.toJson(),
        "RNO,TBSOW": rnoTbsow?.toJson(),
        "RCO,TSDOW": rcoTsdow?.toJson(),
        "VSTDOW,TBSOW": vstdowTbsow?.toJson(),
        "RNOR,WTBSOW,WTBSOW": rnorWtbsowWtbsow?.toJson(),
        "RCOR,WTSDOW,WTSDOW": rcorWtsdowWtsdow?.toJson(),
        "TSTDOW,TBSOW": tstdowTbsow?.toJson(),
        "NNOR,WTBSOW,WTBSOW": nnorWtbsowWtbsow?.toJson(),
        "NCOR,WTSDOW,WTSDOW": ncorWtsdowWtsdow?.toJson(),
        "VOW,TBSOW": vowTbsow?.toJson(),
        "ENOR,WTBSOW,WTBSOW": enorWtbsowWtbsow?.toJson(),
        "ECOR,WTSDOW,WTSDOW": ecorWtsdowWtsdow?.toJson(),
        "PAD,ETLGO": padEtlgo?.toJson(),
        "PROMOALL,ETCLO": promoallEtclo?.toJson(),
        "GPRIOW,ETCLO": gpriowEtclo?.toJson(),
        "GECIOW,ETLGO": geciowEtlgo?.toJson(),
        "XALL,POW,QAOW,TWEB/YR": xallPowQaowTwebYr?.toJson(),
        "XALL,QAOW,ZWEB/INT": xallQaowZwebInt?.toJson(),
        "XAD,ZOW1SQ,ZOW1SQ": xadZow1SqZow1Sq?.toJson(),
        "ROW2,VOW1,TBSOW": row2Vow1Tbsow?.toJson(),
        "VOW2,VOW1,TSDOW": vow2Vow1Tsdow?.toJson(),
        "XALL,IAOW,ZWEB/INT": xallIaowZwebInt?.toJson(),
        "LLTOW,EWEBBYD3,EWEBBYD3": lltowEwebbyd3Ewebbyd3?.toJson(),
        "LSTDOW,EOWBYD1S,EOWBYD1S": lstdowEowbyd1SEowbyd1S?.toJson(),
        "HLTOW,QNO,QNO,TBSOW": hltowQnoQnoTbsow?.toJson(),
        "HSTDOW,QCO,QCO,TSDOW": hstdowQcoQcoTsdow?.toJson(),
        "NBSOW,ETCLO": nbsowEtclo?.toJson(),
        "NSTOW,ETLGO": nstowEtlgo?.toJson(),
        "EPROW,EWEBBYD3,EWEBBYD3": eprowEwebbyd3Ewebbyd3?.toJson(),
        "EECOW,EOWBYD1S,EOWBYD1S": eecowEowbyd1SEowbyd1S?.toJson(),
        "GOW1S,TWEB/YR": gow1STwebYr?.toJson(),
        "OPROW,GPRIOW,ETCLO": oprowGpriowEtclo?.toJson(),
        "OECOW,GECIOW,ETLGO": oecowGeciowEtlgo?.toJson(),
        "RNO,EWEBBYD3,EWEBBYD3": rnoEwebbyd3Ewebbyd3?.toJson(),
        "RCO,EOWBYD1S,EOWBYD1S": rcoEowbyd1SEowbyd1S?.toJson(),
        "TSTDOW,EWEBBYD3,EWEBBYD3": tstdowEwebbyd3Ewebbyd3?.toJson(),
        "GNO,ETCLO": gnoEtclo?.toJson(),
        "GCO,ETLGO": gcoEtlgo?.toJson(),
        "RNOR,GPRIOW,ETCLO": rnorGpriowEtclo?.toJson(),
        "RCOR,GECIOW,ETLGO": rcorGeciowEtlgo?.toJson(),
        "OALL,ETCLO,ETCLO": oallEtcloEtclo?.toJson(),
        "OAD,ETLGO,ETLGO": oadEtlgoEtlgo?.toJson(),
        "VPROW,ENO,ETCLO": vprowEnoEtclo?.toJson(),
        "PROMOALL,OLTOW,ETCLO": promoallOltowEtclo?.toJson(),
        "PAD,OFLOW,ETLGO": padOflowEtlgo?.toJson(),
        "PROMOALL,ATCLO": promoallAtclo?.toJson(),
        "PAD,ATLGO": padAtlgo?.toJson(),
        "OPROW,ENO,ETCLO": oprowEnoEtclo?.toJson(),
        "OECOW,ECO,ETLGO": oecowEcoEtlgo?.toJson(),
        "TECONALL,OPRIOW,ETCLO": teconallOpriowEtclo?.toJson(),
        "TAD,OECIOW,ETLGO": tadOeciowEtlgo?.toJson(),
        "GPRIOW,ATCLO": gpriowAtclo?.toJson(),
        "GECIOW,ATLGO": geciowAtlgo?.toJson(),
        "GNOR,ENO,ETCLO": gnorEnoEtclo?.toJson(),
        "GCOR,ECO,ETLGO": gcorEcoEtlgo?.toJson(),
        "RSTOW,OECIOW,ETLGO": rstowOeciowEtlgo?.toJson(),
        "RLTOW,OPRIOW,ETCLO": rltowOpriowEtclo?.toJson(),
        "RNOR,ENO,ETCLO": rnorEnoEtclo?.toJson(),
        "RCOR,ECO,ETLGO": rcorEcoEtlgo?.toJson(),
        "ECOR,OECIOW,ETLGO": ecorOeciowEtlgo?.toJson(),
        "ENOR,OPRIOW,ETCLO": enorOpriowEtclo?.toJson(),
        "GNOR,NNO,ETCLO": gnorNnoEtclo?.toJson(),
        "GCOR,NCO,ETLGO": gcorNcoEtlgo?.toJson(),
        "NBSOW,ATCLO": nbsowAtclo?.toJson(),
        "NSTOW,ATLGO": nstowAtlgo?.toJson(),
        "GOW1S,ETCLO,ETCLO": gow1SEtcloEtclo?.toJson(),
        "RNOR,NNO,ETCLO,ETCLO": rnorNnoEtcloEtclo?.toJson(),
        "RCOR,NCO,ETLGO,ETLGO": rcorNcoEtlgoEtlgo?.toJson(),
        "POW1S,ETCLO,ETCLO": pow1SEtcloEtclo?.toJson(),
        "TYLGO,TYLGO,ETLGO": tylgoTylgoEtlgo?.toJson(),
        "TYCLO,TYCLO,ETCLO": tycloTycloEtclo?.toJson(),
        "GNO,ATCLO": gnoAtclo?.toJson(),
        "GCO,ATLGO": gcoAtlgo?.toJson(),
        "QN2PXOW,QN2PXOW": qn2PxowQn2Pxow?.toJson(),
        "QYCLO,ETCLO": qycloEtclo?.toJson(),
        "QYLGO,ETLGO": qylgoEtlgo?.toJson(),
        "ECO,ETLGO,ETLGO": ecoEtlgoEtlgo?.toJson(),
        "ENO,ETCLO,ETCLO": enoEtcloEtclo?.toJson(),
        "KCOR,OFLOW,ETLGO": kcorOflowEtlgo?.toJson(),
        "KNOR,OLTOW,ETCLO": knorOltowEtclo?.toJson(),
        "EN2PXOW,EN2PXOW": en2PxowEn2Pxow?.toJson(),
        "SN2PXOW,SN2PXOW": sn2PxowSn2Pxow?.toJson(),
        "VSTDOW,TSDOW": vstdowTsdow?.toJson(),
        "TOW,TSDOW": towTsdow?.toJson(),
        "VRL1MP,RXOX": vrl1MpRxox?.toJson(),
        "412c5f6d.0": the412C5F6D0?.toJson(),
        "412c5f6d.1": the412C5F6D1?.toJson(),
        "KSTDOW,TSDOW": kstdowTsdow?.toJson(),
        "LSTDOX,USDOX": lstdoxUsdox?.toJson(),
        "KLTOW,TBSOW": kltowTbsow?.toJson(),
        "LLTOX,UBSOX": lltoxUbsox?.toJson(),
        "RFLOX": rflox?.toJson(),
        "AOX": aox?.toJson(),
        "RLTOX": rltox?.toJson(),
        "SNP,UBSOX": snpUbsox?.toJson(),
        "SCP,USDOX": scpUsdox?.toJson(),
        "USTDOX,UBSOX": ustdoxUbsox?.toJson(),
        "TLOYOW,TSDOW": tloyowTsdow?.toJson(),
        "ULOYOX,USDOX": uloyoxUsdox?.toJson(),
        "PROMOALL,TOW1S": promoallTow1S?.toJson(),
        "QROMOALM,UOW1T": qromoalmUow1T?.toJson(),
        "PAD,TOW1S": padTow1S?.toJson(),
        "QAE,UOW1T": qaeUow1T?.toJson(),
        "QLTOX,WLTOX,UBSOX": qltoxWltoxUbsox?.toJson(),
        "PLTOW,VLTOW,TBSOW": pltowVltowTbsow?.toJson(),
        "PSTDOW,VSTDOW,TSDOW": pstdowVstdowTsdow?.toJson(),
        "QSTDOX,WSTDOX,USDOX": qstdoxWstdoxUsdox?.toJson(),
        "QROMOALM,FTCLP": qromoalmFtclp?.toJson(),
        "QAE,FTLGP": qaeFtlgp?.toJson(),
        "HPRIOX,FTCLP": hprioxFtclp?.toJson(),
        "HECIOX,FTLGP": hecioxFtlgp?.toJson(),
        "SOW3,WOW2,UBSOX": sow3Wow2Ubsox?.toJson(),
        "VOW2,QOW1,TSDOW": vow2Qow1Tsdow?.toJson(),
        "WOW3,ROW2,USDOX": wow3Row2Usdox?.toJson(),
        "NBSOW,TOW1S": nbsowTow1S?.toJson(),
        "OBSOX,UOW1T": obsoxUow1T?.toJson(),
        "NSTOW,TOW1S": nstowTow1S?.toJson(),
        "OSTOX,UOW1T": ostoxUow1T?.toJson(),
        "LLTOX,OB,OB": lltoxObOb?.toJson(),
        "LSTDOX,FOWBYD1T,FOWBYD1T": lstdoxFowbyd1TFowbyd1T?.toJson(),
        "PBSOX,OB,OB": pbsoxObOb?.toJson(),
        "PSDOX,FOWBYD1T,FOWBYD1T": psdoxFowbyd1TFowbyd1T?.toJson(),
        "OBSOX,FTCLP": obsoxFtclp?.toJson(),
        "OSTOX,FTLGP": ostoxFtlgp?.toJson(),
        "BPROX,OB,OB": bproxObOb?.toJson(),
        "BECOX,FOWBYD1T,FOWBYD1T": becoxFowbyd1TFowbyd1T?.toJson(),
        "POX,OB,OB": poxObOb?.toJson(),
        "POX,FOWBYD1T,FOWBYD1T": poxFowbyd1TFowbyd1T?.toJson(),
        "WSTDOX,OB,OB": wstdoxObOb?.toJson(),
        "WLOYOX,FOWBYD1T,FOWBYD1T": wloyoxFowbyd1TFowbyd1T?.toJson(),
        "GNO,TOW1S": gnoTow1S?.toJson(),
        "HNP,UOW1T": hnpUow1T?.toJson(),
        "GCO,TOW1S": gcoTow1S?.toJson(),
        "HCP,UOW1T": hcpUow1T?.toJson(),
        "SNP,OB,OB": snpObOb?.toJson(),
        "SCP,FOWBYD1T,FOWBYD1T": scpFowbyd1TFowbyd1T?.toJson(),
        "USTDOX,OB,OB": ustdoxObOb?.toJson(),
        "ULOYOX,FOWBYD1T,FOWBYD1T": uloyoxFowbyd1TFowbyd1T?.toJson(),
        "HNP,FTCLP": hnpFtclp?.toJson(),
        "HCP,FTLGP": hcpFtlgp?.toJson(),
        "QROMOALM,OB,OB,OB": qromoalmObObOb?.toJson(),
        "HPRIOX,OB,OB,OB": hprioxObObOb?.toJson(),
        "UOWTR,UOWTR,TOW1S": uowtrUowtrTow1S?.toJson(),
        "VOWTS,VOWTS,UOW1T": vowtsVowtsUow1T?.toJson(),
        "HOW1T,FTCLP": how1TFtclp?.toJson(),
        "HOW1T,FTLGP": how1TFtlgp?.toJson(),
        "HOW1T,UOW1T": how1TUow1T?.toJson(),
        "UYLGP,UOW1T": uylgpUow1T?.toJson(),
        "UYCLP,UOW1T": uyclpUow1T?.toJson(),
        "TYLGO,TOW1S": tylgoTow1S?.toJson(),
        "POWTS,POWTS,FTLGP": powtsPowtsFtlgp?.toJson(),
        "POWTS,POWTS,FTCLP": powtsPowtsFtclp?.toJson(),
        "OOWTR,OOWTR,ETLGO": oowtrOowtrEtlgo?.toJson(),
        "UYCLP,UYCLP,FTCLP": uyclpUyclpFtclp?.toJson(),
        "UYLGP,UYLGP,FTLGP": uylgpUylgpFtlgp?.toJson(),
        "RYCLP,FTCLP": ryclpFtclp?.toJson(),
        "RN2PXOX,RN2PXOX": rn2PxoxRn2Pxox?.toJson(),
        "RYLGP,FTLGP": rylgpFtlgp?.toJson(),
        "IN2XOY,IN2XOY": in2XoyIn2Xoy?.toJson(),
        "HN2XOX,HN2XOX": hn2XoxHn2Xox?.toJson(),
        "QTSO,QTSO,TOW1S": qtsoQtsoTow1S?.toJson(),
        "RTSP,RTSP,UOW1T": rtspRtspUow1T?.toJson(),
        "FYCLP,FTCLP": fyclpFtclp?.toJson(),
        "EYLGO,ETLGO": eylgoEtlgo?.toJson(),
        "FYLGP,FTLGP": fylgpFtlgp?.toJson(),
        "ICSORV,ICSORV,FTCLP": icsorvIcsorvFtclp?.toJson(),
        "HCSORU,HCSORU,ETLGO": hcsoruHcsoruEtlgo?.toJson(),
        "ICSORV,ICSORV,FTLGP": icsorvIcsorvFtlgp?.toJson(),
        "QECONALL,YFLX1": qeconallYflx1?.toJson(),
        "RECONALM,AFLX2": reconalmAflx2?.toJson(),
        "SCP,AFLX2": scpAflx2?.toJson(),
        "RNO,YFLX1": rnoYflx1?.toJson(),
        "SNP,AFLX2": snpAflx2?.toJson(),
        "RCO,YFLX1": rcoYflx1?.toJson(),
        "HOW1SR,HOW1SR,FTLGP": how1SrHow1SrFtlgp?.toJson(),
        "HOW1SR,HOW1SR,FTCLP": how1SrHow1SrFtclp?.toJson(),
        "QLGT1,YFLX1": qlgt1Yflx1?.toJson(),
        "RLGT2,AFLX2": rlgt2Aflx2?.toJson(),
        "AFLXTR2,AFLXTR2": aflxtr2Aflxtr2?.toJson(),
        "RSMT2,AFLX2": rsmt2Aflx2?.toJson(),
        "QSMT1,YFLX1": qsmt1Yflx1?.toJson(),
        "XRIMSP,XLRIEGP,UOW1T": xrimspXlriegpUow1T?.toJson(),
        "WRIMSO,WLRIEGO,TOW1S": wrimsoWlriegoTow1S?.toJson(),
        "RPR12MOW,TE12MOW,TOW1S": rpr12MowTe12MowTow1S?.toJson(),
        "SPR12MOX,UE12MOX,UOW1T": spr12MoxUe12MoxUow1T?.toJson(),
        "MOWTS,MOWTS,FTCLP": mowtsMowtsFtclp?.toJson(),
        "LOWTR,LOWTR,ETLGO": lowtrLowtrEtlgo?.toJson(),
        "MOWTS,MOWTS,FTLGP": mowtsMowtsFtlgp?.toJson(),
        "QOW1SR,QOW1SR,FTCLP": qow1SrQow1SrFtclp?.toJson(),
        "QOW1SR,QOW1SR,FTLGP": qow1SrQow1SrFtlgp?.toJson(),
        "ENO,YFLX1": enoYflx1?.toJson(),
        "FNP,AFLX2": fnpAflx2?.toJson(),
        "ECO,YFLX1": ecoYflx1?.toJson(),
        "FCP,AFLX2": fcpAflx2?.toJson(),
        "HSMT1,YFLX1": hsmt1Yflx1?.toJson(),
        "ISMT2,AFLX2": ismt2Aflx2?.toJson(),
        "VOW1SR,VOW1SR,FTCLP": vow1SrVow1SrFtclp?.toJson(),
        "UOW1SQ,UOW1SQ,ETLGO": uow1SqUow1SqEtlgo?.toJson(),
        "VOW1SR,VOW1SR,FTLGP": vow1SrVow1SrFtlgp?.toJson(),
        "FN2PXOX,FN2PXOX": fn2PxoxFn2Pxox?.toJson(),
        "FOWBYD1T,FOWBYD1T,UBSOX": fowbyd1TFowbyd1TUbsox?.toJson(),
        "FOWBYD1T,FOWBYD1T,USDOX": fowbyd1TFowbyd1TUsdox?.toJson(),
        "TN2PXOX,TN2PXOX": tn2PxoxTn2Pxox?.toJson(),
        "OALL,W_FARE0,W_FARE0": oallWFare0WFare0?.toJson(),
        "OAD,WTBSOW,WTBSOW": oadWtbsowWtbsow?.toJson(),
        "OMX,WTBSOW,WTBSOW": omxWtbsowWtbsow?.toJson(),
        "UFLOW,WTBSOW,WTBSOW": uflowWtbsowWtbsow?.toJson(),
        "UPROW,WTBSOW,WTBSOW": uprowWtbsowWtbsow?.toJson(),
        "U_FARE0,W_FARE0,W_FARE0": uFare0WFare0WFare0?.toJson(),
        "UECOW,WTBSOW,WTBSOW": uecowWtbsowWtbsow?.toJson(),
        "VPROW,W_FARE0,W_FARE0": vprowWFare0WFare0?.toJson(),
        "VPLOW,WTBSOW,WTBSOW": vplowWtbsowWtbsow?.toJson(),
        "TPROW,WTBSOW,WTBSOW": tprowWtbsowWtbsow?.toJson(),
        "VPMOW,WTBSOW,WTBSOW": vpmowWtbsowWtbsow?.toJson(),
        "TPLOW,WTBSOW,WTBSOW": tplowWtbsowWtbsow?.toJson(),
        "TAD,WTBSOW,WTBSOW": tadWtbsowWtbsow?.toJson(),
        "TMX,WTBSOW,WTBSOW": tmxWtbsowWtbsow?.toJson(),
        "TECONALL,W_FARE0,W_FARE0": teconallWFare0WFare0?.toJson(),
        "TSTDCSOW,WTBSOW,WTBSOW": tstdcsowWtbsowWtbsow?.toJson(),
        "P_FARE0,W_FARE0,W_FARE0": pFare0WFare0WFare0?.toJson(),
        "PSTDOW,WTBSOW,WTBSOW": pstdowWtbsowWtbsow?.toJson(),
        "TLTCSOW,W_FARE0,W_FARE0": tltcsowWFare0WFare0?.toJson(),
        "PFLEXOW,WTBSOW,WTBSOW": pflexowWtbsowWtbsow?.toJson(),
        "W_FARE0,W_FARE0,W_FARE0": wFare0WFare0WFare0?.toJson(),
        "WECOW,WTBSOW,WTBSOW": wecowWtbsowWtbsow?.toJson(),
        "WFLOW,WTBSOW,WTBSOW": wflowWtbsowWtbsow?.toJson(),
        "ACO1R,WTBSOW,WTBSOW": aco1RWtbsowWtbsow?.toJson(),
        "GNOR,W_FARE0,W_FARE0": gnorWFare0WFare0?.toJson(),
        "GCOR,WTBSOW,WTBSOW": gcorWtbsowWtbsow?.toJson(),
        "GFOR,WTBSOW,WTBSOW": gforWtbsowWtbsow?.toJson(),
        "TNOR,W_FARE0,W_FARE0": tnorWFare0WFare0?.toJson(),
        "RFOR,WTBSOW,WTBSOW": rforWtbsowWtbsow?.toJson(),
        "TCOR,WTBSOW,WTBSOW": tcorWtbsowWtbsow?.toJson(),
        "RNOR,W_FARE0,W_FARE0": rnorWFare0WFare0?.toJson(),
        "RCOR,WTBSOW,WTBSOW": rcorWtbsowWtbsow?.toJson(),
        "TNOR,WTBSOW,WTBSOW": tnorWtbsowWtbsow?.toJson(),
        "ANO1R,WTBSOW,WTBSOW": ano1RWtbsowWtbsow?.toJson(),
        "NNOR,W_FARE0,W_FARE0": nnorWFare0WFare0?.toJson(),
        "NCOR,WTBSOW,WTBSOW": ncorWtbsowWtbsow?.toJson(),
        "NFOR,WTBSOW,WTBSOW": nforWtbsowWtbsow?.toJson(),
        "ENOR,W_FARE0,W_FARE0": enorWFare0WFare0?.toJson(),
        "ECOR,WTBSOW,WTBSOW": ecorWtbsowWtbsow?.toJson(),
        "EFOR,WTBSOW,WTBSOW": eforWtbsowWtbsow?.toJson(),
        "TFOR,WTBSOW,WTBSOW": tforWtbsowWtbsow?.toJson(),
        "QNOR,WTBSOW,WTBSOW": qnorWtbsowWtbsow?.toJson(),
        "QNOR,W_FARE0,W_FARE0": qnorWFare0WFare0?.toJson(),
        "QCOR,WTBSOW,WTBSOW": qcorWtbsowWtbsow?.toJson(),
        "QFOR,WTBSOW,WTBSOW": qforWtbsowWtbsow?.toJson(),
        "KLTCSOW,W_FARE0,W_FARE0": kltcsowWFare0WFare0?.toJson(),
        "KSTDCSOW,WTBSOW,WTBSOW": kstdcsowWtbsowWtbsow?.toJson(),
        "KLTCSOW,WTBSOW,WTBSOW": kltcsowWtbsowWtbsow?.toJson(),
        "E_FARE0,E_FARE0": eFare0EFare0?.toJson(),
        "KLTOW,Y_1PC20": kltowY1Pc20?.toJson(),
        "KSTDOW,Y_0PC": kstdowY0Pc?.toJson(),
        "KFLEXOW,Y_0PC": kflexowY0Pc?.toJson(),
        "KFLEXOW,Y_1PC25": kflexowY1Pc25?.toJson(),
        "KLTOW,Y_0PC": kltowY0Pc?.toJson(),
        "KLTOW,Y_1PC25": kltowY1Pc25?.toJson(),
        "KSTDOW,Y_1PC25": kstdowY1Pc25?.toJson(),
        "KFLEXOW,Y_1PC20": kflexowY1Pc20?.toJson(),
        "KSTDOW,Y_1PC20": kstdowY1Pc20?.toJson(),
        "OFLOW,Y_0PC": oflowY0Pc?.toJson(),
        "OSDOW,Y_1PC25": osdowY1Pc25?.toJson(),
        "OFLOW,Y_1PC20": oflowY1Pc20?.toJson(),
        "OFLOW,Y_1PC25": oflowY1Pc25?.toJson(),
        "OBSOW,Y_0PC": obsowY0Pc?.toJson(),
        "OBSOW,Y_1PC20": obsowY1Pc20?.toJson(),
        "OSDOW,Y_0PC": osdowY0Pc?.toJson(),
        "OSDOW,Y_1PC20": osdowY1Pc20?.toJson(),
        "OBSOW,Y_1PC25": obsowY1Pc25?.toJson(),
        "OOW,Y_0PC": oowY0Pc?.toJson(),
        "OOW,Y_1PC20": oowY1Pc20?.toJson(),
        "OOW,Y_1PC25": oowY1Pc25?.toJson(),
        "MOW,Y_0PC": mowY0Pc?.toJson(),
        "MOW,Y_1PC20": mowY1Pc20?.toJson(),
        "MOW,Y_1PC25": mowY1Pc25?.toJson(),
        "EFLOW,Y_1PC25": eflowY1Pc25?.toJson(),
        "EPROW,Y_1PC20": eprowY1Pc20?.toJson(),
        "Y_1PC10,Y_1PC20": y1Pc10Y1Pc20?.toJson(),
        "EPROW,Y_1PC25": eprowY1Pc25?.toJson(),
        "Y_1PC10,Y_1PC25": y1Pc10Y1Pc25?.toJson(),
        "EFLOW,Y_1PC20": eflowY1Pc20?.toJson(),
        "EPROW,Y_0PC": eprowY0Pc?.toJson(),
        "Y_1PC10,Y_0PC": y1Pc10Y0Pc?.toJson(),
        "EFLOW,Y_0PC": eflowY0Pc?.toJson(),
        "RCO,Y_1PC25": rcoY1Pc25?.toJson(),
        "RFO,Y_0PC": rfoY0Pc?.toJson(),
        "RFO,Y_1PC20": rfoY1Pc20?.toJson(),
        "RCO,Y_1PC20": rcoY1Pc20?.toJson(),
        "RNO,Y_1PC20": rnoY1Pc20?.toJson(),
        "RCO,Y_0PC": rcoY0Pc?.toJson(),
        "RNO,Y_1PC25": rnoY1Pc25?.toJson(),
        "RFO,Y_1PC25": rfoY1Pc25?.toJson(),
        "RNO,Y_0PC": rnoY0Pc?.toJson(),
        "VSTDOW,Y_0PC": vstdowY0Pc?.toJson(),
        "VSTDOW,Y_1PC20": vstdowY1Pc20?.toJson(),
        "VSTDOW,Y_1PC25": vstdowY1Pc25?.toJson(),
        "TSTDOW,Y_0PC": tstdowY0Pc?.toJson(),
        "TSTDOW,Y_1PC20": tstdowY1Pc20?.toJson(),
        "TSTDOW,Y_1PC25": tstdowY1Pc25?.toJson(),
        "PROMOALL,Y_1PC20": promoallY1Pc20?.toJson(),
        "PAD,Y_1PC20": padY1Pc20?.toJson(),
        "Y_1PC20,Y_1PC20": y1Pc20Y1Pc20?.toJson(),
        "PMX,Y_1PC20": pmxY1Pc20?.toJson(),
        "GPRIOW,Y_1PC20": gpriowY1Pc20?.toJson(),
        "GECIOW,Y_1PC20": geciowY1Pc20?.toJson(),
        "UFLIOW,Y_1PC20": ufliowY1Pc20?.toJson(),
        "GPRIOW,Y_0PC": gpriowY0Pc?.toJson(),
        "GPRIOW,Y_1PC23": gpriowY1Pc23?.toJson(),
        "GECIOW,Y_0PC": geciowY0Pc?.toJson(),
        "GECIOW,Y_1PC23": geciowY1Pc23?.toJson(),
        "UFLIOW,Y_0PC": ufliowY0Pc?.toJson(),
        "UFLIOW,Y_1PC23": ufliowY1Pc23?.toJson(),
        "PROMOALL,Y_0PC": promoallY0Pc?.toJson(),
        "PROMOALL,Y_1PC23": promoallY1Pc23?.toJson(),
        "PAD,Y_0PC": padY0Pc?.toJson(),
        "PAD,Y_1PC23": padY1Pc23?.toJson(),
        "PMX,Y_0PC": pmxY0Pc?.toJson(),
        "PMX,Y_1PC23": pmxY1Pc23?.toJson(),
        "NBSOW,Y_1PC20": nbsowY1Pc20?.toJson(),
        "NSTOW,Y_1PC20": nstowY1Pc20?.toJson(),
        "NPLOW,Y_1PC20": nplowY1Pc20?.toJson(),
        "GNO,Y_1PC20": gnoY1Pc20?.toJson(),
        "GCO,Y_1PC20": gcoY1Pc20?.toJson(),
        "GFO,Y_1PC20": gfoY1Pc20?.toJson(),
        "NPLOW,Y_1PC23": nplowY1Pc23?.toJson(),
        "NBSOW,Y_0PC": nbsowY0Pc?.toJson(),
        "NBSOW,Y_1PC23": nbsowY1Pc23?.toJson(),
        "NSTOW,Y_0PC": nstowY0Pc?.toJson(),
        "NSTOW,Y_1PC23": nstowY1Pc23?.toJson(),
        "NPLOW,Y_0PC": nplowY0Pc?.toJson(),
        "OFLOW,GFLIOW,Y_1PC20": oflowGfliowY1Pc20?.toJson(),
        "OPROW,GPRIOW,Y_1PC20": oprowGpriowY1Pc20?.toJson(),
        "OECOW,GECIOW,Y_1PC20": oecowGeciowY1Pc20?.toJson(),
        "OFLOW,GFLIOW,Y_0PC": oflowGfliowY0Pc?.toJson(),
        "OFLOW,GFLIOW,Y_1PC23": oflowGfliowY1Pc23?.toJson(),
        "OPROW,GPRIOW,Y_0PC": oprowGpriowY0Pc?.toJson(),
        "OPROW,GPRIOW,Y_1PC23": oprowGpriowY1Pc23?.toJson(),
        "OECOW,GECIOW,Y_0PC": oecowGeciowY0Pc?.toJson(),
        "OECOW,GECIOW,Y_1PC23": oecowGeciowY1Pc23?.toJson(),
        "GCO,Y_1PC23": gcoY1Pc23?.toJson(),
        "GFO,Y_0PC": gfoY0Pc?.toJson(),
        "GFO,Y_1PC23": gfoY1Pc23?.toJson(),
        "GNO,Y_0PC": gnoY0Pc?.toJson(),
        "GNO,Y_1PC23": gnoY1Pc23?.toJson(),
        "GCO,Y_0PC": gcoY0Pc?.toJson(),
        "PMX,HTCLO": pmxHtclo?.toJson(),
        "PMX,HTLGO": pmxHtlgo?.toJson(),
        "PROMOALL,HTCLO": promoallHtclo?.toJson(),
        "PROMOALL,HTLGO": promoallHtlgo?.toJson(),
        "PAD,HTCLO": padHtclo?.toJson(),
        "PAD,HTLGO": padHtlgo?.toJson(),
        "Y_1PC20,Y_0PC": y1Pc20Y0Pc?.toJson(),
        "Y_1PC20,Y_1PC23": y1Pc20Y1Pc23?.toJson(),
        "GECIOW,HTLGO": geciowHtlgo?.toJson(),
        "UFLIOW,HTCLO": ufliowHtclo?.toJson(),
        "UFLIOW,HTLGO": ufliowHtlgo?.toJson(),
        "GPRIOW,HTCLO": gpriowHtclo?.toJson(),
        "GPRIOW,HTLGO": gpriowHtlgo?.toJson(),
        "GECIOW,HTCLO": geciowHtclo?.toJson(),
        "UOWTR,UOWTR,Y_1PC20": uowtrUowtrY1Pc20?.toJson(),
        "UOWTU,UOWTU,Y_1PC20": uowtuUowtuY1Pc20?.toJson(),
        "NPLOW,HTCLO": nplowHtclo?.toJson(),
        "NPLOW,HTLGO": nplowHtlgo?.toJson(),
        "NBSOW,HTCLO": nbsowHtclo?.toJson(),
        "NBSOW,HTLGO": nbsowHtlgo?.toJson(),
        "NSTOW,HTCLO": nstowHtclo?.toJson(),
        "NSTOW,HTLGO": nstowHtlgo?.toJson(),
        "OECOW,GECIOW,HTCLO": oecowGeciowHtclo?.toJson(),
        "OECOW,GECIOW,HTLGO": oecowGeciowHtlgo?.toJson(),
        "OFLOW,GFLIOW,HTCLO": oflowGfliowHtclo?.toJson(),
        "OFLOW,GFLIOW,HTLGO": oflowGfliowHtlgo?.toJson(),
        "OPROW,GPRIOW,HTCLO": oprowGpriowHtclo?.toJson(),
        "OPROW,GPRIOW,HTLGO": oprowGpriowHtlgo?.toJson(),
        "TYCLO,Y_1PC20": tycloY1Pc20?.toJson(),
        "TYLGO,Y_1PC20": tylgoY1Pc20?.toJson(),
        "GNO,HTLGO": gnoHtlgo?.toJson(),
        "GCO,HTCLO": gcoHtclo?.toJson(),
        "GCO,HTLGO": gcoHtlgo?.toJson(),
        "GFO,HTCLO": gfoHtclo?.toJson(),
        "GFO,HTLGO": gfoHtlgo?.toJson(),
        "GNO,HTCLO": gnoHtclo?.toJson(),
        "TYFLO,Y_1PC20": tyfloY1Pc20?.toJson(),
        "TYCLO,TYCLO,Y_1PC20": tycloTycloY1Pc20?.toJson(),
        "TYLGO,TYLGO,Y_1PC20": tylgoTylgoY1Pc20?.toJson(),
        "TYLGO,TYLGO,Y_1PC23": tylgoTylgoY1Pc23?.toJson(),
        "TYCLO,TYCLO,Y_0PC": tycloTycloY0Pc?.toJson(),
        "TYCLO,TYCLO,Y_1PC23": tycloTycloY1Pc23?.toJson(),
        "TYLGO,TYLGO,Y_0PC": tylgoTylgoY0Pc?.toJson(),
        "QYCLO,Y_1PC20": qycloY1Pc20?.toJson(),
        "QYLGO,Y_1PC20": qylgoY1Pc20?.toJson(),
        "QYFLO,Y_1PC20": qyfloY1Pc20?.toJson(),
        "UOWTR,UOWTR,HTCLO": uowtrUowtrHtclo?.toJson(),
        "UOWTR,UOWTR,HTLGO": uowtrUowtrHtlgo?.toJson(),
        "UOWTU,UOWTU,HTCLO": uowtuUowtuHtclo?.toJson(),
        "UOWTU,UOWTU,HTLGO": uowtuUowtuHtlgo?.toJson(),
        "TYLGO,HTCLO": tylgoHtclo?.toJson(),
        "TYLGO,HTLGO": tylgoHtlgo?.toJson(),
        "TYCLO,HTCLO": tycloHtclo?.toJson(),
        "TYCLO,HTLGO": tycloHtlgo?.toJson(),
        "EYFLO,Y_1PC23": eyfloY1Pc23?.toJson(),
        "EYCLO,Y_0PC": eycloY0Pc?.toJson(),
        "EYCLO,Y_1PC23": eycloY1Pc23?.toJson(),
        "EYLGO,Y_0PC": eylgoY0Pc?.toJson(),
        "EYLGO,Y_1PC23": eylgoY1Pc23?.toJson(),
        "EYFLO,Y_0PC": eyfloY0Pc?.toJson(),
        "TYFLO,HTCLO": tyfloHtclo?.toJson(),
        "TYFLO,HTLGO": tyfloHtlgo?.toJson(),
        "QYCLO,Y_0PC": qycloY0Pc?.toJson(),
        "QYCLO,Y_1PC23": qycloY1Pc23?.toJson(),
        "QYLGO,Y_0PC": qylgoY0Pc?.toJson(),
        "QYFLO,Y_0PC": qyfloY0Pc?.toJson(),
        "QYLGO,Y_1PC23": qylgoY1Pc23?.toJson(),
        "QYFLO,Y_1PC23": qyfloY1Pc23?.toJson(),
        "GNO,Y_1PC32": gnoY1Pc32?.toJson(),
        "GCO,Y_1PC32": gcoY1Pc32?.toJson(),
        "GFO,Y_1PC32": gfoY1Pc32?.toJson(),
        "LOWTR,LOWTR,Y_1PC20": lowtrLowtrY1Pc20?.toJson(),
        "LOWTU,LOWTU,Y_1PC20": lowtuLowtuY1Pc20?.toJson(),
        "QECONALL,Y_1PC32": qeconallY1Pc32?.toJson(),
        "Y_1PC10,Y_1PC32": y1Pc10Y1Pc32?.toJson(),
        "Y_1PC20,Y_1PC32": y1Pc20Y1Pc32?.toJson(),
        "EYCLO,Y_1PC20": eycloY1Pc20?.toJson(),
        "EYLGO,Y_1PC20": eylgoY1Pc20?.toJson(),
        "EYFLO,Y_1PC20": eyfloY1Pc20?.toJson(),
        "QLGT1,Y_1PC32": qlgt1Y1Pc32?.toJson(),
        "QSMT1,Y_1PC32": qsmt1Y1Pc32?.toJson(),
        "MFLX1,Y_1PC32": mflx1Y1Pc32?.toJson(),
        "RPR12MOW,TE12MOW,Y_1PC20": rpr12MowTe12MowY1Pc20?.toJson(),
        "ENO,Y_1PC32": enoY1Pc32?.toJson(),
        "ECO,Y_1PC32": ecoY1Pc32?.toJson(),
        "EFO,Y_1PC32": efoY1Pc32?.toJson(),
        "HSMT1,Y_1PC32": hsmt1Y1Pc32?.toJson(),
        "WRIMSO,WLRIEGO,Y_1PC20": wrimsoWlriegoY1Pc20?.toJson(),
        "KREMSO,KLREEGO,Y_1PC20": kremsoKlreegoY1Pc20?.toJson(),
        "TYCLO,TYCLO,HTCLO": tycloTycloHtclo?.toJson(),
        "TYCLO,TYCLO,HTLGO": tycloTycloHtlgo?.toJson(),
        "TYLGO,TYLGO,HTCLO": tylgoTylgoHtclo?.toJson(),
        "TYLGO,TYLGO,HTLGO": tylgoTylgoHtlgo?.toJson(),
        "TFO,Y_1PC32": tfoY1Pc32?.toJson(),
        "TNO,Y_1PC32": tnoY1Pc32?.toJson(),
        "TCO,Y_1PC32": tcoY1Pc32?.toJson(),
        "QYFLO,HTCLO": qyfloHtclo?.toJson(),
        "QYCLO,HTCLO": qycloHtclo?.toJson(),
        "QYCLO,HTLGO": qycloHtlgo?.toJson(),
        "QYLGO,HTCLO": qylgoHtclo?.toJson(),
        "LOWTU,LOWTU,Y_0PC": lowtuLowtuY0Pc?.toJson(),
        "LOWTU,LOWTU,Y_1PC23": lowtuLowtuY1Pc23?.toJson(),
        "LOWTR,LOWTR,Y_0PC": lowtrLowtrY0Pc?.toJson(),
        "LOWTR,LOWTR,Y_1PC23": lowtrLowtrY1Pc23?.toJson(),
        "OYCLO,Y_1PC20": oycloY1Pc20?.toJson(),
        "OYLGO,Y_1PC20": oylgoY1Pc20?.toJson(),
        "OYFLO,Y_1PC20": oyfloY1Pc20?.toJson(),
        "OYLGO,Y_1PC23": oylgoY1Pc23?.toJson(),
        "OYFLO,Y_0PC": oyfloY0Pc?.toJson(),
        "OYFLO,Y_1PC23": oyfloY1Pc23?.toJson(),
        "OYCLO,Y_0PC": oycloY0Pc?.toJson(),
        "OYCLO,Y_1PC23": oycloY1Pc23?.toJson(),
        "OYLGO,Y_0PC": oylgoY0Pc?.toJson(),
        "EYCLO,HTCLO": eycloHtclo?.toJson(),
        "EYCLO,HTLGO": eycloHtlgo?.toJson(),
        "EYLGO,HTCLO": eylgoHtclo?.toJson(),
        "KREMSO,KLREEGO,HTCLO": kremsoKlreegoHtclo?.toJson(),
        "KREMSO,KLREEGO,HTLGO": kremsoKlreegoHtlgo?.toJson(),
        "WRIMSO,WLRIEGO,HTCLO": wrimsoWlriegoHtclo?.toJson(),
        "WRIMSO,WLRIEGO,HTLGO": wrimsoWlriegoHtlgo?.toJson(),
        "LOWTR,LOWTR,HTCLO": lowtrLowtrHtclo?.toJson(),
        "LOWTR,LOWTR,HTLGO": lowtrLowtrHtlgo?.toJson(),
        "LOWTU,LOWTU,HTCLO": lowtuLowtuHtclo?.toJson(),
        "LOWTU,LOWTU,HTLGO": lowtuLowtuHtlgo?.toJson(),
        "W,W,Y_0PC": wWY0Pc?.toJson(),
        "W,W,Y_1PC20": wWY1Pc20?.toJson(),
        "Y,Y,Y_1PC20": yYY1Pc20?.toJson(),
        "W,W,Y_1PC25": wWY1Pc25?.toJson(),
        "Y,Y,Y_1PC25": yYY1Pc25?.toJson(),
        "RPR12MOW,TE12MOW,HTLGO": rpr12MowTe12MowHtlgo?.toJson(),
        "RPR12MOW,TE12MOW,HTCLO": rpr12MowTe12MowHtclo?.toJson(),
        "OYLGO,HTCLO": oylgoHtclo?.toJson(),
        "OYCLO,HTCLO": oycloHtclo?.toJson(),
        "OYCLO,HTLGO": oycloHtlgo?.toJson(),
        "RPR12MOW,KTKCSOW,Y_1PC20": rpr12MowKtkcsowY1Pc20?.toJson(),
        "OOB7RU1,OOB7RU1,Y_1PC20": oob7Ru1Oob7Ru1Y1Pc20?.toJson(),
        "HYFLO,Y_0PC": hyfloY0Pc?.toJson(),
        "HYLGO,Y_1PC23": hylgoY1Pc23?.toJson(),
        "HYFLO,Y_1PC23": hyfloY1Pc23?.toJson(),
        "HYCLO,Y_0PC": hycloY0Pc?.toJson(),
        "HYCLO,Y_1PC23": hycloY1Pc23?.toJson(),
        "HYLGO,Y_0PC": hylgoY0Pc?.toJson(),
        "HYLGO,OTLGO": hylgoOtlgo?.toJson(),
        "HYFLO,OTLGO": hyfloOtlgo?.toJson(),
        "HYCLO,OTCLO": hycloOtclo?.toJson(),
        "HYCLO,OTLGO": hycloOtlgo?.toJson(),
        "HYLGO,OTCLO": hylgoOtclo?.toJson(),
        "HYFLO,OTCLO": hyfloOtclo?.toJson(),
        "HYCLO,Y_1PC20": hycloY1Pc20?.toJson(),
        "HYLGO,Y_1PC20": hylgoY1Pc20?.toJson(),
        "HYFLO,Y_1PC20": hyfloY1Pc20?.toJson(),
        "OOB7RU1,OOB7RU1,Y_0PC": oob7Ru1Oob7Ru1Y0Pc?.toJson(),
        "OOB7RU1,OOB7RU1,Y_1PC23": oob7Ru1Oob7Ru1Y1Pc23?.toJson(),
        "RPR12MOW,KTKCSOW,HTCLO": rpr12MowKtkcsowHtclo?.toJson(),
        "RPR12MOW,KTKCSOW,HTLGO": rpr12MowKtkcsowHtlgo?.toJson(),
        "HYCLO,HTCLO": hycloHtclo?.toJson(),
        "HYCLO,HTLGO": hycloHtlgo?.toJson(),
        "HYLGO,HTCLO": hylgoHtclo?.toJson(),
        "HYFLO,HTCLO": hyfloHtclo?.toJson(),
        "OOB7RU1,OOB7RU1,HTLGO": oob7Ru1Oob7Ru1Htlgo?.toJson(),
        "OOB7RU1,OOB7RU1,HTCLO": oob7Ru1Oob7Ru1Htclo?.toJson(),
      };
}

class Aco1RWtbsowWtbsowClass {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Aco1RWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Aco1RWtbsowWtbsowClass({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Aco1RWtbsowWtbsowClass.fromJson(Map<String, dynamic> json) =>
      Aco1RWtbsowWtbsowClass(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Aco1RWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Aco1RWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) => Aco1RWtbsowWtbsowFlightAdditionalTariffInfo
                            .fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Aco1RWtbsowWtbsowFlightAdditionalTariffInfo {
  final PurpleFlight returnBeforeFlight;
  final FluffyFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final FluffyFlight changeAfterFlight;

  Aco1RWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory Aco1RWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      Aco1RWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: PurpleFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class Aflxtr2Aflxtr2 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Aflxtr2Aflxtr2({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Aflxtr2Aflxtr2.fromJson(Map<String, dynamic> json) => Aflxtr2Aflxtr2(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            Aflxtr2Aflxtr2FlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Aflxtr2Aflxtr2FlightAdditionalTariffInfo {
  final FluffyFlight? returnBeforeFlight;
  final FluffyFlight? changeBeforeFlight;

  Aflxtr2Aflxtr2FlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.changeBeforeFlight,
  });

  factory Aflxtr2Aflxtr2FlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      Aflxtr2Aflxtr2FlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_before_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_before_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
      };
}

class Ano1RWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Ano1RWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Ano1RWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Ano1RWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      Ano1RWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Ano1RWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Ano1RWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) => Ano1RWtbsowWtbsowFlightAdditionalTariffInfo
                            .fromJson(x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Ano1RWtbsowWtbsowFlightAdditionalTariffInfo {
  final FluffyFlight returnBeforeFlight;
  final FluffyFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final FluffyFlight changeAfterFlight;

  Ano1RWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory Ano1RWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      Ano1RWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: FluffyFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class The412C5F6D1 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<The412C5F6D0FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  The412C5F6D1({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory The412C5F6D1.fromJson(Map<String, dynamic> json) => The412C5F6D1(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<The412C5F6D0FlightAdditionalTariffInfo>>.from(json[
                    "flight_additional_tariff_infos"]
                .map((x) => List<The412C5F6D0FlightAdditionalTariffInfo>.from(
                    x.map((x) =>
                        The412C5F6D0FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class The412C5F6D0FlightAdditionalTariffInfo {
  final FluffyFlight? returnBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final FluffyFlight? changeBeforeFlight;
  final FluffyFlight? changeAfterFlight;

  The412C5F6D0FlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory The412C5F6D0FlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      The412C5F6D0FlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class The412C5F6D0 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<The412C5F6D0FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  The412C5F6D0({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory The412C5F6D0.fromJson(Map<String, dynamic> json) => The412C5F6D0(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<The412C5F6D0FlightAdditionalTariffInfo>>.from(json[
                    "flight_additional_tariff_infos"]
                .map((x) => List<The412C5F6D0FlightAdditionalTariffInfo>.from(
                    x.map((x) =>
                        The412C5F6D0FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EflowY0Pc {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EflowY0PcFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EflowY0Pc({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EflowY0Pc.fromJson(Map<String, dynamic> json) => EflowY0Pc(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EflowY0PcFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EflowY0PcFlightAdditionalTariffInfo>.from(x.map((x) =>
                        EflowY0PcFlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EflowY0PcFlightAdditionalTariffInfo {
  final TentacledFlight? returnBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final TentacledFlight? changeBeforeFlight;
  final FluffyFlight? changeAfterFlight;

  EflowY0PcFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory EflowY0PcFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      EflowY0PcFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class EflowY1Pc20 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EflowY0PcFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EflowY1Pc20({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EflowY1Pc20.fromJson(Map<String, dynamic> json) => EflowY1Pc20(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EflowY0PcFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EflowY0PcFlightAdditionalTariffInfo>.from(x.map((x) =>
                        EflowY0PcFlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EfoY1Pc32 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EfoY1Pc32FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EfoY1Pc32({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EfoY1Pc32.fromJson(Map<String, dynamic> json) => EfoY1Pc32(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EfoY1Pc32FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EfoY1Pc32FlightAdditionalTariffInfo>.from(x.map((x) =>
                        EfoY1Pc32FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EfoY1Pc32FlightAdditionalTariffInfo {
  final TentacledFlight? returnBeforeFlight;
  final TentacledFlight? returnAfterFlight;
  final TentacledFlight? changeBeforeFlight;
  final TentacledFlight? changeAfterFlight;

  EfoY1Pc32FlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory EfoY1Pc32FlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      EfoY1Pc32FlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class EforWtbsowWtbsowClass {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EforWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EforWtbsowWtbsowClass({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EforWtbsowWtbsowClass.fromJson(Map<String, dynamic> json) =>
      EforWtbsowWtbsowClass(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EforWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EforWtbsowWtbsowFlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            EforWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EforWtbsowWtbsowFlightAdditionalTariffInfo {
  final TentacledFlight returnBeforeFlight;
  final FluffyFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final FluffyFlight changeAfterFlight;

  EforWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory EforWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      EforWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight:
            TentacledFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class N2Pxow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<The412C5F6D0FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  N2Pxow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory N2Pxow.fromJson(Map<String, dynamic> json) => N2Pxow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<The412C5F6D0FlightAdditionalTariffInfo>>.from(json[
                    "flight_additional_tariff_infos"]
                .map((x) => List<The412C5F6D0FlightAdditionalTariffInfo>.from(
                    x.map((x) =>
                        The412C5F6D0FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EnoYflx1 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<The412C5F6D0FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EnoYflx1({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EnoYflx1.fromJson(Map<String, dynamic> json) => EnoYflx1(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<The412C5F6D0FlightAdditionalTariffInfo>>.from(json[
                    "flight_additional_tariff_infos"]
                .map((x) => List<The412C5F6D0FlightAdditionalTariffInfo>.from(
                    x.map((x) =>
                        The412C5F6D0FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EnorWtbsowWtbsowClass {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EnorWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EnorWtbsowWtbsowClass({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EnorWtbsowWtbsowClass.fromJson(Map<String, dynamic> json) =>
      EnorWtbsowWtbsowClass(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EnorWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EnorWtbsowWtbsowFlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            EnorWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EnorWtbsowWtbsowFlightAdditionalTariffInfo {
  final FluffyFlight? returnBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final PurpleFlight? changeBeforeFlight;
  final FluffyFlight? changeAfterFlight;

  EnorWtbsowWtbsowFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory EnorWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      EnorWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class Eowbyd1SEowbyd1S {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<The412C5F6D0FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Eowbyd1SEowbyd1S({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Eowbyd1SEowbyd1S.fromJson(Map<String, dynamic> json) =>
      Eowbyd1SEowbyd1S(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<The412C5F6D0FlightAdditionalTariffInfo>>.from(json[
                    "flight_additional_tariff_infos"]
                .map((x) => List<The412C5F6D0FlightAdditionalTariffInfo>.from(
                    x.map((x) =>
                        The412C5F6D0FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EycloHtclo {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EycloHtclo({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EycloHtclo.fromJson(Map<String, dynamic> json) => EycloHtclo(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            Aflxtr2Aflxtr2FlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EycloHtlgo {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EycloHtlgo({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EycloHtlgo.fromJson(Map<String, dynamic> json) => EycloHtlgo(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            Aflxtr2Aflxtr2FlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EyfloY0Pc {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EyfloY0PcFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EyfloY0Pc({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EyfloY0Pc.fromJson(Map<String, dynamic> json) => EyfloY0Pc(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EyfloY0PcFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EyfloY0PcFlightAdditionalTariffInfo>.from(x.map((x) =>
                        EyfloY0PcFlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class EyfloY0PcFlightAdditionalTariffInfo {
  final FluffyFlight? returnBeforeFlight;
  final TentacledFlight? changeBeforeFlight;

  EyfloY0PcFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.changeBeforeFlight,
  });

  factory EyfloY0PcFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      EyfloY0PcFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_before_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["change_before_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
      };
}

class EyfloY1Pc20 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EyfloY0PcFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  EyfloY1Pc20({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory EyfloY1Pc20.fromJson(Map<String, dynamic> json) => EyfloY1Pc20(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EyfloY0PcFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EyfloY0PcFlightAdditionalTariffInfo>.from(x.map((x) =>
                        EyfloY0PcFlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Hn2XoxHn2Xox {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Hn2XoxHn2Xox({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Hn2XoxHn2Xox.fromJson(Map<String, dynamic> json) => Hn2XoxHn2Xox(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            Aflxtr2Aflxtr2FlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class KltcsowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<KltcsowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  KltcsowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory KltcsowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      KltcsowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<KltcsowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<KltcsowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) =>
                            KltcsowWtbsowWtbsowFlightAdditionalTariffInfo
                                .fromJson(x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class KltcsowWtbsowWtbsowFlightAdditionalTariffInfo {
  final FluffyFlight returnBeforeFlight;
  final FluffyFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final PurpleFlight changeAfterFlight;

  KltcsowWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory KltcsowWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      KltcsowWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: FluffyFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: PurpleFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class StdcsowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  StdcsowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory StdcsowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      StdcsowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) =>
                            KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo
                                .fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo {
  final PurpleFlight returnBeforeFlight;
  final PurpleFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final PurpleFlight changeAfterFlight;

  KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      KstdcsowWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: PurpleFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: PurpleFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: PurpleFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class NplowHtclo {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EfoY1Pc32FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  NplowHtclo({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory NplowHtclo.fromJson(Map<String, dynamic> json) => NplowHtclo(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EfoY1Pc32FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EfoY1Pc32FlightAdditionalTariffInfo>.from(x.map((x) =>
                        EfoY1Pc32FlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class OadWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Ano1RWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  OadWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory OadWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      OadWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Ano1RWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Ano1RWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) => Ano1RWtbsowWtbsowFlightAdditionalTariffInfo
                            .fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class ObsowTbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  ObsowTbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory ObsowTbsow.fromJson(Map<String, dynamic> json) => ObsowTbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<Aflxtr2Aflxtr2FlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            Aflxtr2Aflxtr2FlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Y0Pc {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<FlightInfo>> flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Y0Pc({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Y0Pc.fromJson(Map<String, dynamic> json) => Y0Pc(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos: List<List<FlightInfo>>.from(
            json["flight_additional_tariff_infos"].map((x) =>
                List<FlightInfo>.from(x.map((x) => FlightInfo.fromJson(x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class ObsowY1Pc20 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<FlightInfo>> flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  ObsowY1Pc20({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory ObsowY1Pc20.fromJson(Map<String, dynamic> json) => ObsowY1Pc20(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos: List<List<FlightInfo>>.from(
            json["flight_additional_tariff_infos"].map((x) =>
                List<FlightInfo>.from(x.map((x) => FlightInfo.fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class OflowGfliowHtclo {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<OflowGfliowHtcloFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  OflowGfliowHtclo({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory OflowGfliowHtclo.fromJson(Map<String, dynamic> json) =>
      OflowGfliowHtclo(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<OflowGfliowHtcloFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<OflowGfliowHtcloFlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            OflowGfliowHtcloFlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class OflowGfliowHtcloFlightAdditionalTariffInfo {
  final FluffyFlight? returnBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final TentacledFlight? changeBeforeFlight;
  final FluffyFlight? changeAfterFlight;

  OflowGfliowHtcloFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory OflowGfliowHtcloFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      OflowGfliowHtcloFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class OflowGfliowHtlgo {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<OflowGfliowHtcloFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  OflowGfliowHtlgo({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory OflowGfliowHtlgo.fromJson(Map<String, dynamic> json) =>
      OflowGfliowHtlgo(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<OflowGfliowHtcloFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<OflowGfliowHtcloFlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            OflowGfliowHtcloFlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class OflowY1Pc20 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<FlightInfo>> flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  OflowY1Pc20({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory OflowY1Pc20.fromJson(Map<String, dynamic> json) => OflowY1Pc20(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos: List<List<FlightInfo>>.from(
            json["flight_additional_tariff_infos"].map((x) =>
                List<FlightInfo>.from(x.map((x) => FlightInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class PflexowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<PflexowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  PflexowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory PflexowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      PflexowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<PflexowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<PflexowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) =>
                            PflexowWtbsowWtbsowFlightAdditionalTariffInfo
                                .fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class PflexowWtbsowWtbsowFlightAdditionalTariffInfo {
  final PurpleFlight returnBeforeFlight;
  final FluffyFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final PurpleFlight changeAfterFlight;

  PflexowWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory PflexowWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      PflexowWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: PurpleFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: PurpleFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class OwWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<PltowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  OwWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory OwWtbsowWtbsow.fromJson(Map<String, dynamic> json) => OwWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<PltowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<PltowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) => PltowWtbsowWtbsowFlightAdditionalTariffInfo
                            .fromJson(x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class PltowWtbsowWtbsowFlightAdditionalTariffInfo {
  final FluffyFlight? returnBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final PurpleFlight? changeBeforeFlight;
  final PurpleFlight? changeAfterFlight;

  PltowWtbsowWtbsowFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory PltowWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      PltowWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : PurpleFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class PstdowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<KltcsowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  PstdowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory PstdowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      PstdowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<KltcsowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<KltcsowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) =>
                            KltcsowWtbsowWtbsowFlightAdditionalTariffInfo
                                .fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class UprowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EforWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  UprowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory UprowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      UprowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EforWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EforWtbsowWtbsowFlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            EforWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class VpmowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<VpmowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  VpmowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory VpmowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      VpmowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<VpmowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<VpmowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) => VpmowWtbsowWtbsowFlightAdditionalTariffInfo
                            .fromJson(x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class VpmowWtbsowWtbsowFlightAdditionalTariffInfo {
  final TentacledFlight returnBeforeFlight;
  final PurpleFlight returnAfterFlight;
  final PurpleFlight changeBeforeFlight;
  final PurpleFlight changeAfterFlight;

  VpmowWtbsowWtbsowFlightAdditionalTariffInfo({
    required this.returnBeforeFlight,
    required this.returnAfterFlight,
    required this.changeBeforeFlight,
    required this.changeAfterFlight,
  });

  factory VpmowWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      VpmowWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight:
            TentacledFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: PurpleFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: PurpleFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight.toJson(),
        "return_after_flight": returnAfterFlight.toJson(),
        "change_before_flight": changeBeforeFlight.toJson(),
        "change_after_flight": changeAfterFlight.toJson(),
      };
}

class VprowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EnorWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<dynamic>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  VprowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory VprowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      VprowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EnorWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EnorWtbsowWtbsowFlightAdditionalTariffInfo>.from(x.map(
                        (x) =>
                            EnorWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
                                x))))),
        flightsBaggage: List<List<dynamic>>.from(json["flights_baggage"]
            .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Vrl1MpRxox {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<dynamic>> flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Vrl1MpRxox({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Vrl1MpRxox.fromJson(Map<String, dynamic> json) => Vrl1MpRxox(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos: List<List<dynamic>>.from(
            json["flight_additional_tariff_infos"]
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class WprowWtbsowWtbsow {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<WprowWtbsowWtbsowFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<bool>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  WprowWtbsowWtbsow({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory WprowWtbsowWtbsow.fromJson(Map<String, dynamic> json) =>
      WprowWtbsowWtbsow(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<WprowWtbsowWtbsowFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<WprowWtbsowWtbsowFlightAdditionalTariffInfo>.from(
                        x.map((x) => WprowWtbsowWtbsowFlightAdditionalTariffInfo
                            .fromJson(x))))),
        flightsBaggage: List<List<bool>>.from(json["flights_baggage"]
            .map((x) => List<bool>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class WprowWtbsowWtbsowFlightAdditionalTariffInfo {
  final TentacledFlight? returnBeforeFlight;
  final FluffyFlight? returnAfterFlight;
  final PurpleFlight? changeBeforeFlight;
  final FluffyFlight? changeAfterFlight;

  WprowWtbsowWtbsowFlightAdditionalTariffInfo({
    this.returnBeforeFlight,
    this.returnAfterFlight,
    this.changeBeforeFlight,
    this.changeAfterFlight,
  });

  factory WprowWtbsowWtbsowFlightAdditionalTariffInfo.fromJson(
          Map<String, dynamic> json) =>
      WprowWtbsowWtbsowFlightAdditionalTariffInfo(
        returnBeforeFlight: json["return_before_flight"] == null
            ? null
            : TentacledFlight.fromJson(json["return_before_flight"]),
        returnAfterFlight: json["return_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["return_after_flight"]),
        changeBeforeFlight: json["change_before_flight"] == null
            ? null
            : PurpleFlight.fromJson(json["change_before_flight"]),
        changeAfterFlight: json["change_after_flight"] == null
            ? null
            : FluffyFlight.fromJson(json["change_after_flight"]),
      );

  Map<String, dynamic> toJson() => {
        "return_before_flight": returnBeforeFlight?.toJson(),
        "return_after_flight": returnAfterFlight?.toJson(),
        "change_before_flight": changeBeforeFlight?.toJson(),
        "change_after_flight": changeAfterFlight?.toJson(),
      };
}

class Yflxtr1Yflxtr1 {
  final String currency;
  final int price;
  final int unifiedPrice;
  final int url;
  final List<List<EflowY0PcFlightAdditionalTariffInfo>>
      flightAdditionalTariffInfos;
  final List<List<String>> flightsBaggage;
  final List<List<String>> flightsHandbags;
  final List<List<int>> baggageSource;
  final List<List<int>> handbagsSource;

  Yflxtr1Yflxtr1({
    required this.currency,
    required this.price,
    required this.unifiedPrice,
    required this.url,
    required this.flightAdditionalTariffInfos,
    required this.flightsBaggage,
    required this.flightsHandbags,
    required this.baggageSource,
    required this.handbagsSource,
  });

  factory Yflxtr1Yflxtr1.fromJson(Map<String, dynamic> json) => Yflxtr1Yflxtr1(
        currency: json["currency"],
        price: json["price"],
        unifiedPrice: json["unified_price"],
        url: json["url"],
        flightAdditionalTariffInfos:
            List<List<EflowY0PcFlightAdditionalTariffInfo>>.from(
                json["flight_additional_tariff_infos"].map((x) =>
                    List<EflowY0PcFlightAdditionalTariffInfo>.from(x.map((x) =>
                        EflowY0PcFlightAdditionalTariffInfo.fromJson(x))))),
        flightsBaggage: List<List<String>>.from(json["flights_baggage"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        flightsHandbags: List<List<String>>.from(json["flights_handbags"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        baggageSource: List<List<int>>.from(
            json["baggage_source"].map((x) => List<int>.from(x.map((x) => x)))),
        handbagsSource: List<List<int>>.from(json["handbags_source"]
            .map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "price": price,
        "unified_price": unifiedPrice,
        "url": url,
        "flight_additional_tariff_infos": List<dynamic>.from(
            flightAdditionalTariffInfos
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "flights_baggage": List<dynamic>.from(
            flightsBaggage.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "flights_handbags": List<dynamic>.from(
            flightsHandbags.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baggage_source": List<dynamic>.from(
            baggageSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "handbags_source": List<dynamic>.from(
            handbagsSource.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class TicketsSearchResultBySearchIdSegment {
  final String origin;
  final String originCountry;
  final String originalOrigin;
  final String destination;
  final String destinationCountry;
  final String originalDestination;
  final DateTime date;
  final DateTime departDate;

  TicketsSearchResultBySearchIdSegment({
    required this.origin,
    required this.originCountry,
    required this.originalOrigin,
    required this.destination,
    required this.destinationCountry,
    required this.originalDestination,
    required this.date,
    required this.departDate,
  });

  factory TicketsSearchResultBySearchIdSegment.fromJson(
          Map<String, dynamic> json) =>
      TicketsSearchResultBySearchIdSegment(
        origin: json["origin"],
        originCountry: json["origin_country"],
        originalOrigin: json["original_origin"],
        destination: json["destination"],
        destinationCountry: json["destination_country"],
        originalDestination: json["original_destination"],
        date: DateTime.parse(json["date"]),
        departDate: DateTime.parse(json["depart_date"]),
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "origin_country": originCountry,
        "original_origin": originalOrigin,
        "destination": destination,
        "destination_country": destinationCountry,
        "original_destination": originalDestination,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "depart_date":
            "${departDate.year.toString().padLeft(4, '0')}-${departDate.month.toString().padLeft(2, '0')}-${departDate.day.toString().padLeft(2, '0')}",
      };
}
