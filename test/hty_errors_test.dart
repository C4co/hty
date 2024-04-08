import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("check errors", () {
    var customServer = Hty(
      baseurl: "http://localhost:8080",
      client: http.Client(),
      defaultHeaders: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );

    test('check 404 error', () async {
      try {
        await customServer.get(
          path: "/errors/404",
        );
      } on HtyException catch (e) {
        expect(e.statusCode, 404);
        expect(e.message, "Not Found");

        expect(e.description['message'], "hty: Not found");
        expect(e.description['detail'], "The requested resource could not be found");
      }
    });

    test('check 500 error', () async {
      try {
        await customServer.get(
          path: "/errors/500",
        );
      } on HtyException catch (e) {
        expect(e.statusCode, 500);
        expect(e.message, "Internal Server Error");
      }
    });

    test('check 400 error', () async {
      try {
        await customServer.get(
          path: "/errors/400",
        );
      } on HtyException catch (e) {
        expect(e.statusCode, 400);
        expect(e.message, "Bad Request");
      }
    });
  });
}
