class NetworkException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  NetworkException([this.message, this.url, this.prefix]);
}

class BadRequestException extends NetworkException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process the request', url);
}

class ApiNotRespondingException extends NetworkException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException([String? message, String? url])
      : super(message, 'Bad Request', url);
}
