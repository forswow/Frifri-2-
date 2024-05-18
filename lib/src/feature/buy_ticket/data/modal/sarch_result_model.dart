import 'dart:convert';

import 'package:frifri/src/feature/buy_ticket/data/dto/ticket_search_query.dart';
import 'package:frifri/src/feature/buy_ticket/data/modal/segment_model.dart';
import 'package:frifri/src/feature/buy_ticket/data/modal/terms_model.dart';

import 'airlines_model.dart';

final class SearchResult {
  SearchResult({
    required this.searchId,
    required this.airlines,
    // required this.segmentModel,
    // required this.termsModel,
  });

  final String searchId; //search_id
  final Map<String, AirlinesModel> airlines; // airlines
  // final FlightModel segmentModel;
  // late TermsModel termsModel;

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final searchId = json['search_id'] as String;
    final airlinesMap = json['airports'] as Map<String, dynamic>;
    final airlines = airlinesMap
        .map((key, value) => MapEntry(key, AirlinesModel.fromJson(value)));
    // final segmentModel = FlightModel.fromJson(json['segment'][0]);
    // final termsModel = TermsModel.fromJson(json['proposals']['']);

    return SearchResult(
      searchId: searchId,
      airlines: airlines,
      // segmentModel: segmentModel,
      // termsModel: termsModel,
    );
  }

  @override
  String toString() {
    return 'SearchResult{searchId: $searchId}, airlines: ${airlines.toString()}, ';
  }

  ///segmentModel: ${segmentModel.toString()}
  ///, termsModel: ${termsModel.toString()}
}

/// search_id
///[airlines] airlines_name. CompanyName
/// [proposals] segment transfers info transfer
/// proposals.segment.terms.url for generate link.

/// OPTIONAL !!!
/// proposals.segment.terms price. Field currency
