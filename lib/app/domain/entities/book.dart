import 'package:book_app/app/domain/entities/book_item.dart';

class Book {
  String? kind;
  int? totalItems;
  List<BookItem>? items;

  Book({
    this.kind,
    this.totalItems,
    this.items,
  });
}
