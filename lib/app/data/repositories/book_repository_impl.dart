// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:book_app/app/data/datasources/book_remote_data_source.dart';
import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/domain/repositories/book_repository.dart';
import 'package:book_app/app/foundation/errors/failure.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource _bookRemoteDataSource;
  BookRepositoryImpl(
    this._bookRemoteDataSource,
  );

  @override
  Future<Either<Failure, Book>> getAutoCompleteList(
      {required String keyword}) async {
    try {
      Book autocompleteList =
          await _bookRemoteDataSource.getAutoCompleteList(keyword: keyword);
      return Right(autocompleteList);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(UnknownFailure());
      }
    }
  }
}
