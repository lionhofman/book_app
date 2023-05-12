class ServerException implements Exception {
  final String? statusMessage;
  final int? statusCode;

  ServerException(this.statusMessage, this.statusCode);
}

class RequestException implements Exception {
  final String? message;

  RequestException(this.message);
}

class CacheException implements Exception {}
