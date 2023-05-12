import 'package:book_app/app/core/network/network_properties.dart';
import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/foundation/errors/failure.dart';
import 'package:dio/dio.dart';

abstract class BookRemoteDataSource {
  Future<List<Book>> getAutoCompleteList({
    required String keyword,
  });
}

class BookRemoteDataSourceImpl extends BookRemoteDataSource {
  final Dio _dio;

  BookRemoteDataSourceImpl(this._dio);

  @override
  Future<List<Book>> getAutoCompleteList({required String keyword}) async {
    try {
      Response response = await _dio.get(
        NetworkProperties.BASE_URL,
        queryParameters: {
          'q': keyword,
        },
      );
      return handleAutocompleteRequest(response);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw ConnectTimeoutFailure(message: "Connection Timeout Exception");
      }
      throw getFailureFromServerError(
        statusCode: ex.response?.statusCode,
        message: ex.response?.data['message'],
        exceptionTypeName: ex.response?.data['exceptionTypeName'],
      );
    }
  }

  List<Book> handleAutocompleteRequest(Response response) {
    if (response.statusCode == 200) {
      List<Book> _autocompleteList = <Book>[];

      return _autocompleteList;
    } else {
      throw UnimplementedError();
    }
  }
}
