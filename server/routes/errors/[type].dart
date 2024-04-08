import 'package:dart_frog/dart_frog.dart';

Response onRequest(
  RequestContext context,
  String type,
) {
  if (type == '404') {
    return Response.json(
      statusCode: 404,
      body: {
        'message': 'hty: Not found',
        'detail': 'The requested resource could not be found',
      },
    );
  }

  if (type == '500') {
    return Response(
      statusCode: 500,
      body: 'Server error',
    );
  }

  if (type == '400') {
    return Response(
      statusCode: 400,
      body: 'Bad request',
    );
  }

  return Response(
    body: 'Errors route',
  );
}
