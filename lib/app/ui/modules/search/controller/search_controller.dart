import 'package:book_app/app/domain/usecases/search/get_autocomplete_list_use_case.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final GetAutocompleteListUseCase _getAutocompleteListUseCase;
  SearchController(
    this._getAutocompleteListUseCase,
  );
}
