import 'package:dartz/dartz.dart';
import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/foundation/errors/failure.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getAutoCompleteList({
    required String keyword,
  });
}
