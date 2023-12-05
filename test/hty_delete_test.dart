import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  var jsonPlaceholder = Hty(
    baseurl: "https://jsonplaceholder.typicode.com",
    client: http.Client(),
    defaultHeaders: {
      "Accept": "application/json",
    },
  );

  test('check delete method', () async {
    var result = await jsonPlaceholder.delete(
      path: "/posts/1",
    );

    expect(result.statusCode, 200);
    expect(result.message, "OK");
  });
}
