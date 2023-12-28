import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Hty:Get', () {
    var jsonPlaceholder = Hty(
      baseurl: "https://jsonplaceholder.typicode.com/",
      client: http.Client(),
      defaultHeaders: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    test('Check http object', () async {
      expect(
        jsonPlaceholder.endpoint(path: "/todos/1").toString(),
        "https://jsonplaceholder.typicode.com/todos/1",
      );
    });

    test('Check todo list', () async {
      var result = await jsonPlaceholder.get(
        path: "/todos",
      );

      expect(result.statusCode, 200);
      expect(result.data is List, true);
      expect(result.requestHeaders, {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      expect(result.message, "OK");
    });

    test('Check cache lenth', () async {
      expect(jsonPlaceholder.cacheContainer.length, 1);
    });

    test('Check only one item', () async {
      var result = await jsonPlaceholder.get(
        path: "/todos/1",
      );

      expect(result.statusCode, 200);
      expect(result.data is Map, true);
      expect(result.message, "OK");
    });

    test('Check cache lenth', () async {
      expect(jsonPlaceholder.cacheContainer.length, 2);
    });

    test('Check cache lenth for multiple item', () async {
      await jsonPlaceholder.get(path: "/todos/2");
      await jsonPlaceholder.get(path: "/todos/2");
      await jsonPlaceholder.get(path: "/todos/2");
      await jsonPlaceholder.get(
        path: "/todos/2",
        cache: false,
      );

      expect(jsonPlaceholder.cacheContainer.length, 3);
    });

    test('Check not found resource', () async {
      try {
        jsonPlaceholder.get(
          path: "/todos/aa",
        );
      } on HtyException catch (e) {
        expect(e.statusCode, 404);
        expect(e.message, "Not Found");
      }
    });
  });
}
