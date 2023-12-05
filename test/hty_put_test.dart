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

  test("check put method", () async {
    var result = await jsonPlaceholder.put(
      path: "/posts/1",
      payload: {
        "id": "1",
        "title": "foo",
        "body": "bar",
        "userId": "1",
      },
    );

    expect(result.statusCode, 200);
    expect(result.message, "OK");
    expect(result.data["id"], 1);
    expect(result.data["title"], "foo");
    expect(result.data["body"], "bar");
    expect(result.data["userId"], "1");
  });
}
