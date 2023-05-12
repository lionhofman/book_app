import 'package:book_app/app/data/models/book_item_response.dart';
import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/domain/entities/book_item.dart';

class BookResponse extends Book {
  BookResponse({
    String? kind,
    int? totalItems,
    List<BookItem>? items,
  }) : super(
          kind: kind,
          totalItems: totalItems,
          items: items,
        );

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    return BookResponse(
      kind: json['kind'],
      totalItems: json['totalItems'],
      items: json['items'] != null
          ? List<BookItem>.from(
              json['items'].map((item) => BookItemResponse.fromJson(item)),
            )
          : null,
    );
  }
}
