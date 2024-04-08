import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('hty:Get', () {
    var customServer = Hty(
      baseurl: "http://localhost:8080",
      client: http.Client(),
      defaultHeaders: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    test('check http object', () async {
      expect(
        customServer.endpoint(path: "/products").toString(),
        "http://localhost:8080/products",
      );
    });

    test('check product list request', () async {
      var result = await customServer.get(
        path: "/products",
        cache: true,
      );

      expect(result.statusCode, 200);
      expect(result.data is List, true);
      expect(result.requestHeaders, {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      expect(result.message, "OK");
    });

    test('check cache lenth', () async {
      expect(customServer.cacheContainer.length, 1);
    });

    test('Check only one item', () async {
      var result = await customServer.get(
        path: "/products/1",
        cache: true,
      );

      expect(result.statusCode, 200);
      expect(result.data is Map, true);
      expect(result.message, "OK");
    });

    test('check cache lenth', () async {
      expect(customServer.cacheContainer.length, 2);
    });

    test('check cache lenth for multiple item', () async {
      await customServer.get(path: "/products/2");
      await customServer.get(path: "/products/2");
      await customServer.get(path: "/products/2");
      await customServer.get(
        path: "/products/2",
        cache: false,
      );

      expect(customServer.cacheContainer.length, 3);
    });

    test('check not founded resource', () async {
      try {
        customServer.get(
          path: "/products/10",
        );
      } on HtyException catch (e) {
        expect(e.statusCode, 404);
        expect(e.message, "Not Found");
      }
    });
  });
}
