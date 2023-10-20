import 'package:hty/hty.dart';
import 'package:http/http.dart' as http;

var hty = Hty(
  baseurl: 'https://jsonplaceholder.typicode.com',
  client: http.Client(),
  defaultHeaders: {
    'Accept': 'application/json',
  },
);

void main() async {
  try {
    await hty.post(
      path: '/posts',
      payload: {
        'title': 'title',
        'body': 'content',
        'userId': '1',
      },
    );
  } on HtyException catch (e) {
    print(e.message);
    print(e.statusCode);
    print('Description: ${e.description}');
  }

  hty.close();
}
