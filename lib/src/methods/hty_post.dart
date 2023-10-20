part of '../hty_base.dart';

extension Post on Hty {
  Future<HtyPostResponse> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    Map<String, String>? payload,
  }) async {
    try {
      var mergedHeaders = {...?defaultHeaders, ...?headers};

      http.Response response;

      try {
        response = await client.post(
          endpoint(
            path: path,
            query: query,
          ),
          headers: mergedHeaders,
          body: payload,
        );
      } on ClientException {
        throw HtyException(
          message: 'Connection refused',
          statusCode: 000,
          description: 'The remote computer refused the network connection',
        );
      } catch (e) {
        rethrow;
      }

      dynamic body = response.body;

      try {
        body = jsonDecode(response.body);
      } on FormatException {
        // Do nothing
      }

      if (!successRange.contains(response.statusCode) &&
          !redirectRange.contains(response.statusCode)) {
        throw HtyException(
          message: httpErrorMessage(response),
          statusCode: response.statusCode,
          description: body,
        );
      }

      var fullResponse = HtyPostResponse(
        statusCode: response.statusCode,
        responseHeaders: response.headers,
        requestHeaders: mergedHeaders,
        response: response,
        data: body,
        payload: payload,
        message: httpSuccessMessage(response),
      );

      return fullResponse;
    } catch (e) {
      rethrow;
    }
  }
}
