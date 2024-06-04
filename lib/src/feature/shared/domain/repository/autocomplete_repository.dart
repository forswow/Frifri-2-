import 'package:frifri/src/feature/shared/domain/dto/input_dto.dart';
import 'package:frifri/src/feature/shared/domain/entities/country_search_entity.dart';

abstract interface class IAutocompleteRepository {
  Future<List<AutocompleteEntity>> getAutocomplete(
      {required AutocompleteInputDTO autocompleteInputDTO});
}
