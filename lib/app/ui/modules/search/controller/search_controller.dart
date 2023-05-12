import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:book_app/app/domain/usecases/search/get_autocomplete_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final TextEditingController typeAheadController = TextEditingController();
  Rx<Book> _book = Book().obs;
  RxList<BookItem> _autocompleteList = RxList<BookItem>();
  RxString _searchText = ''.obs;
  List<BookItem> get autocompleteList => _autocompleteList;
  String get searchText => _searchText.value;
  Rx<Book> get book => _book;

  final GetAutocompleteListUseCase _getAutocompleteListUseCase;
  SearchController(
    this._getAutocompleteListUseCase,
  );

  setText(String value) async {
    _searchText.value = value;
    if (_searchText.value.length > 3) {
      getAutocompleteList(_searchText.value);
    }
  }

  Future<void> getAutocompleteList(String text) async {
    final result = await _getAutocompleteListUseCase.call(keyword: text);
    result.fold(
      (l) => null,
      (r) {
        _book.value = r;
        _autocompleteList.value = _book.value.items!;
      },
    );
  }
}
