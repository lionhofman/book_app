import 'package:book_app/app/core/network/network_properties.dart';
import 'package:book_app/app/data/models/book_response.dart';
import 'package:book_app/app/domain/entities/book.dart';
import 'package:book_app/app/foundation/errors/failure.dart';
import 'package:dio/dio.dart';

abstract class BookRemoteDataSource {
  Future<Book> getAutoCompleteList({
    required String keyword,
  });
}

class BookRemoteDataSourceImpl extends BookRemoteDataSource {
  final Dio _dio = Dio();

  BookRemoteDataSourceImpl();

  @override
  Future<Book> getAutoCompleteList({required String keyword}) async {
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

  Book handleAutocompleteRequest(Response response) {
    if (response.statusCode == 200) {
      Book autocompleteList = BookResponse.fromJson(response.data);

      return autocompleteList;
    } else {
      throw UnimplementedError();
    }
  }
}
