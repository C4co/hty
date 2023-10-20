import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("Check post method", () {
    var jsonPlaceholder = Hty(
      baseurl: "https://jsonplaceholder.typicode.com",
      client: http.Client(),
      defaultHeaders: {
        "Accept": "application/json",
      },
    );

    test('full payload', () async {
      var result = await jsonPlaceholder.post(
        path: "/posts",
        payload: {
          "title": "foo",
          "body": "bar",
          "userId": "1",
        },
      );

      expect(result.statusCode, 201);
      expect(result.message, "Created");
      expect(result.data["title"], "foo");
      expect(result.data["body"], "bar");
      expect(result.data["userId"], "1");
    });

    test('without payload', () async {
      var result = await jsonPlaceholder.post(
        path: "/posts",
      );

      expect(result.statusCode, 201);
      expect(result.message, "Created");
    });
  });
}
