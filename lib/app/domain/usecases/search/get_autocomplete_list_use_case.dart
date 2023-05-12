import 'package:book_app/app/domain/entities/book.dart';
import 'package:dartz/dartz.dart';
import 'package:book_app/app/domain/repositories/book_repository.dart';
import 'package:book_app/app/foundation/errors/failure.dart';

class GetAutocompleteListUseCase {
  final BookRepository _bookRepository;

  GetAutocompleteListUseCase(this._bookRepository);

  Future<Either<Failure, Book>> call({required String keyword}) async {
    return await _bookRepository.getAutoCompleteList(keyword: keyword);
  }
}
