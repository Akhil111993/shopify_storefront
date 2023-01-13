/// Network Exception. Called when internet is not working
class NetworkException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  NetworkException([this.message, this.url, this.prefix]);
}

/// Bad Request Exception. Called when server responds with bad request error. Check your query is correct
class BadRequestException extends NetworkException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

/// Fetch Data Exception. Called when data fetching is failed
class FetchDataException extends NetworkException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process the request', url);
}

/// Api Not Responding Exception. Called when Api is not responding
class ApiNotRespondingException extends NetworkException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

/// Unauthorized Exception. Called when authorization fails. Check Shopify api key
class UnauthorizedException extends NetworkException {
  UnauthorizedException([String? message, String? url])
      : super(message, 'Bad Request', url);
}
