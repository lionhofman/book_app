import 'package:book_app/app/foundation/constants/errors_messages.dart';
import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  final String? message;
  Failure({required this.message}) {
    if (this.message != null && this.message!.isNotEmpty) {
      print('>>Failure: $message');
    }
  }
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(
    String? message,
    int? status,
  ) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}

class NoInternetConnectionFailure implements Failure {
  @override
  String message = ErrorMessages.NO_INTERNET_CONNECTION_FAILURE;
}

class UnknownFailure extends Failure {
  @override
  UnknownFailure({String? message: ErrorMessages.UNKNOWN_FAILURE})
      : super(message: message);
}

class Failure404 extends Failure {
  String? message;
  Failure404({this.message}) : super(message: message) {
    message = message ?? ErrorMessages.FAILURE_404;
  }
}

class ServerError500 extends Failure {
  String? exceptionTypeName;
  ServerError500(
      {String? message: ErrorMessages.SERVER_ERROR_500, this.exceptionTypeName})
      : super(message: message);
}

class ConnectTimeoutFailure extends Failure {
  ConnectTimeoutFailure({String message: 'Timeout Connect'})
      : super(message: message);
}

Failure getFailureFromServerError(
    {int? statusCode = 0,
    String? message,
    String? exceptionTypeName,
    DioError? exception}) {
  switch (statusCode) {
    case 404:
      return Failure404(message: message);
    case 500:
      return ServerError500(
          message: message, exceptionTypeName: exceptionTypeName);
    default:
      return UnknownFailure(
        message: message,
      );
  }
}
