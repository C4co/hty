import 'package:http/http.dart';

class HtyGetResponse {
  final int statusCode;
  final Map<String, String> responseHeaders;
  final Map<String, String> requestHeaders;
  final dynamic data;
  final Response response;
  final String message;

  HtyGetResponse({
    required this.statusCode,
    required this.responseHeaders,
    required this.requestHeaders,
    required this.data,
    required this.response,
    required this.message,
  });
}

class HtyPostResponse {
  final int statusCode;
  final Map<String, String> responseHeaders;
  final Map<String, String> requestHeaders;
  final dynamic data;
  final Response response;
  final Map<String, String>? payload;
  final String message;

  HtyPostResponse({
    required this.statusCode,
    required this.responseHeaders,
    required this.requestHeaders,
    required this.data,
    required this.response,
    required this.payload,
    required this.message,
  });
}
