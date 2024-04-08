import 'package:test/test.dart';
import 'package:hty/hty.dart';
import 'package:http/http.dart' as http;

void main() {
  group("check get method", () {
    test('check exception when baseurl is not absolute', () {
      expect(
        () => Hty(
          baseurl: "localhost.com",
          client: http.Client(),
          defaultHeaders: {
            "Accept": "application/json",
          },
        ),
        throwsException,
      );

      expect(
        () => Hty(
          baseurl: "localhost",
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
        baseurl: "http://localhost:8000/",
        client: http.Client(),
        defaultHeaders: {
          "Accept": "application/json",
        },
      );

      server.get(path: "/product/1").then((response) {
        expect(response.statusCode, 200);
      });
    });
  });
}
