import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import './hty_status_code.dart';
import './hty_messages.dart';
import './hty_exception.dart';
import './hty_response.dart';

part './methods/hty_get.dart';
part './methods/hty_post.dart';
part './methods/hty_put.dart';
part './methods/hty_delete.dart';

class Hty {
  final Map<String, dynamic> cacheContainer = {};
  final http.Client client;
  final String baseurl;
  Map<String, String>? defaultHeaders;

  Hty({
    required this.baseurl,
    required this.client,
    this.defaultHeaders,
  }) {
    if (!Uri.parse(baseurl).isAbsolute) {
      throw Exception("'$baseurl' is not a valid url");
    }
  }

  endpoint({
    required String path,
    Map<String, dynamic>? query,
  }) {
    late String url;

    if (baseurl.endsWith('/')) {
      url = baseurl.substring(0, baseurl.length - 1);
    } else {
      url = baseurl;
    }

    return Uri.parse('$url$path').replace(queryParameters: query);
  }

  close() {
    client.close();
  }
}
