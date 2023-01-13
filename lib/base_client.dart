import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'network_exceptions.dart';

/// Class which fetches post request and handle exceptions
class BaseClient {
  final baseHeader = {'content-type': 'application/json'};

  /// Time out duration is set to 20 seconds. If the http client can't establish a connection by this time, the connection will be closed and an exception is thrown
  static const int timeOutDuration = 20;

  /// Http client connects to the Shopify account by using the url, query and header provided here.
  Future<dynamic> post(String endpoint,
      [String? json, Map<String, String>? header]) async {
    try {
      var uri = Uri.parse(endpoint);
      var response = await http
          .post(uri, body: json, headers: header ?? baseHeader)
          .timeout(const Duration(seconds: timeOutDuration));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        ///throw exception
        _handleResponse(response);
      }
    } on SocketException {
      /// FetchData Exception is thrown on Socket Exception
      throw FetchDataException('No internet connection');
    } on TimeoutException {
      /// Api Not Responding Exception exception is thrown on Timeout Exception
      throw ApiNotRespondingException('Api not responding');
    }
  }

  /// Handle responses
  /// If the status code is 200, response string is returned
  /// If the status code is 400, Bad Request Exception is thrown
  /// If the status code is 401 or 403, Unauthorized Exception is thrown
  /// For any other status code, Fetch Data Exception is thrown
  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
      case 400:
        throw BadRequestException(
            'Bad request', response.request?.url.toString());
      case 401:
      case 403:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request?.url.toString());
    }
  }
}
