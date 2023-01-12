import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

class BaseClient {
  
  final baseHeader = {'content-type': 'application/json'};

  static const int timeOutDuration = 20;

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
        //throw exception

        _handleResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('Api not responding');
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
      case 400:
        throw BadRequestException(
            'Bad request',
            response.request?.url.toString());
      case 401:
      case 403:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request?.url.toString());
    }
  }
}
