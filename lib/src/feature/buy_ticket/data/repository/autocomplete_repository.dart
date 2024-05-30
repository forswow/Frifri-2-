import 'package:frifri/src/feature/buy_ticket/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/data/dto/autocomplete.dart';
import 'package:frifri/src/feature/buy_ticket/domain/dto/input_dto.dart';
import 'package:frifri/src/feature/buy_ticket/domain/entities/country_search_entity.dart';
import 'package:frifri/src/feature/buy_ticket/domain/repository/autocomplete_repository.dart';

class AutocompleteRepositoryImpl implements IAutocompleteRepository {
  final IAutocompleteDataSource dataSource;
  AutocompleteRepositoryImpl({required this.dataSource});

  @override
  Future<List<AutocompleteEntity>> getAutocomplete(
      {required AutocompleteInputDTO autocompleteInputDTO}) async {
    return await dataSource.getAutocomplete(
      options: AutocompleteQuery(
        term: autocompleteInputDTO.term,
        locale: autocompleteInputDTO.locale,
        types: ['airport', 'city'],
      ),
    );
  }
}
