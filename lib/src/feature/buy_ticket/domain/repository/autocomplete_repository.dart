import 'package:frifri/src/feature/buy_ticket/domain/dto/input_dto.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/country_search_entity.dart';

abstract interface class IAutocompleteRepository {
  Future<List<AutocompleteEntity>> getAutocomplete(
      {required AutocompleteInputDTO autocompleteInputDTO});
}
