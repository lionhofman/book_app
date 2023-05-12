import 'dart:ffi';

import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:book_app/app/domain/usecases/search/get_autocomplete_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
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

  Future<List<BookItem>> getAutocompleteList(String text) async {
    _searchText.value = text;
    await Future.delayed(const Duration(seconds: 1));
    final result = await _getAutocompleteListUseCase.call(keyword: text);
    result.fold(
      (l) => null,
      (r) {
        _book.value = r;
        _autocompleteList.value = _book.value.items!;
      },
    );

    return _autocompleteList;
  }

  void validateLaunchURL({required String? url}) async {
    if (url != null) {
      Uri myUri = Uri.parse(url);
      await launchUrl(
        myUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  String formatPrice({required String? price}) {
    String priceString = "";
    if (price != null) {
      final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');
      priceString = formatCurrency.format(double.parse(price));
    }
    return priceString;
  }
}
