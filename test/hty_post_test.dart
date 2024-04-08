import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import '../server/entities/product.dart';

void main() {
  group("check post method", () {
    var customServer = Hty(
      baseurl: "http://localhost:8080",
      client: http.Client(),
      defaultHeaders: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );

    test('full payload', () async {
      var result = await customServer.post(
        path: "/products",
        payload: Product(
          name: "foo",
          description: "bar",
          price: 100.0,
        ).toJson(),
      );

      expect(result.statusCode, 201);
      expect(result.data["name"], "foo");
      expect(result.data["description"], "bar");
      expect(result.data["price"], "100.0");
    });

    test('without payload', () async {
      var result = await customServer.post(
        path: "/products",
      );

      expect(result.statusCode, 201);
      expect(result.message, "Created");
    });
  });
}
