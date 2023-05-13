import 'package:flutter/material.dart';

abstract class Messages {
  String get myPage;
  String get bookApp;
  String get search;
  String get buyNow;
  String get buyThisBook;
  String get by;
  String get publisher;
  String get publishedDate;
  String get pageCount;
  String get favoriteBooks;
  String get noBooksSaved;
  String get price;

  static Messages of(BuildContext context) {
    return Localizations.of<Messages>(context, Messages)!;
  }
}
