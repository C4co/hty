import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  var customServer = Hty(
    baseurl: "http://localhost:8080",
    client: http.Client(),
    defaultHeaders: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  );

  test('check delete method', () async {
    var result = await customServer.delete(
      path: "/products",
    );

    expect(result.statusCode, 200);
    expect(result.message, "OK");
  });
}
