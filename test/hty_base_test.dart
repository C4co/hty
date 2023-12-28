import 'package:test/test.dart';
import 'package:hty/hty.dart';
import 'package:http/http.dart' as http;

void main() {
  group("Hty:base", () {
    test('check exception when baseurl is not absolute', () {
      expect(
        () => Hty(
          baseurl: "jsonplaceholder.typicode.com",
          client: http.Client(),
          defaultHeaders: {
            "Accept": "application/json",
          },
        ),
        throwsException,
      );

      expect(
        () => Hty(
          baseurl: "jsonplaceholder",
          client: http.Client(),
          defaultHeaders: {
            "Accept": "application/json",
          },
        ),
        throwsException,
      );
    });

    test('check request when baseurl ends with /', () {
      var server = Hty(
        baseurl: "https://jsonplaceholder.typicode.com/",
        client: http.Client(),
        defaultHeaders: {
          "Accept": "application/json",
        },
      );

      server.get(path: "/posts/1").then((response) {
        expect(response.statusCode, 200);
      });
    });
  });
}
