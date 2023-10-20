part of '../hty_base.dart';

extension Get on Hty {
  Future<HtyGetResponse> get({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool cache = true,
  }) async {
    try {
      var mergedHeaders = {...?defaultHeaders, ...?headers};

      var endpointAsString = endpoint(
        path: path,
        query: query,
      ).toString();

      if (cacheContainer.containsKey(endpointAsString)) {
        return cacheContainer[endpointAsString];
      }

      http.Response response;

      try {
        response = await client.get(
          endpoint(
            path: path,
            query: query,
          ),
          headers: mergedHeaders,
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

      var fullResponse = HtyGetResponse(
        statusCode: response.statusCode,
        responseHeaders: response.headers,
        requestHeaders: mergedHeaders,
        response: response,
        data: body,
        message: httpSuccessMessage(response),
      );

      if (cache) {
        cacheContainer[endpointAsString] = fullResponse;
      }

      return fullResponse;
    } catch (e) {
      rethrow;
    }
  }
}
