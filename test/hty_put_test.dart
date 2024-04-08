import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import '../server/entities/product.dart';

void main() {
  var customServer = Hty(
    baseurl: "http://localhost:8080",
    client: http.Client(),
    defaultHeaders: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  );

  test("check put method", () async {
    var result = await customServer.put(
      path: "/products",
      payload: Product(
        name: "MODIFIED NAME",
        description: "MODIFIED DESCRIPTION",
        price: 999.99,
      ).toJson(),
    );

    expect(result.statusCode, 200);
    expect(result.message, "OK");
    expect(result.data["name"], "MODIFIED NAME");
    expect(result.data["description"], "MODIFIED DESCRIPTION");
    expect(result.data["price"], "999.99");
  });
}
