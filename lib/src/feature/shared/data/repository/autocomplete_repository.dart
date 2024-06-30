import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/shared/data/data_sources/autocomplete.dart';
import 'package:frifri/src/feature/shared/data/dto/autocomplete.dart';
import 'package:frifri/src/feature/shared/domain/dto/input_dto.dart';
import 'package:frifri/src/feature/shared/domain/entities/country_search_entity.dart';
import 'package:frifri/src/feature/shared/domain/repository/autocomplete_repository.dart';

class AutocompleteRepositoryImpl implements IAutocompleteRepository {
  final IAutocompleteDataSource dataSource;
  AutocompleteRepositoryImpl({required this.dataSource});

  @override
  Future<List<AutocompleteEntity>> getAutocomplete(
      {required AutocompleteInputDTO autocompleteInputDTO}) async {
    logger.e('--------------');
    logger.e('--------------');
    logger.e('--------------');
    logger.e('--------------');
    logger.e('locale: ${autocompleteInputDTO.locale}');
    logger.e('term: ${autocompleteInputDTO.term}');

    return await dataSource.getAutocomplete(
      options: AutocompleteQuery(
        term: autocompleteInputDTO.term,
        locale: autocompleteInputDTO.locale,
        types: ['airport', 'city'],
      ),
    );
  }
}
