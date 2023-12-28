import 'package:hty/hty.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("No server", () {
    var noServer = Hty(baseurl: "http://no-server", client: http.Client());

    test('Check client exception', () async {
      try {
        await noServer.get(path: "/todos/1");
      } on HtyException catch (e) {
        expect(e.message, "Connection refused");
        expect(e.statusCode, 000);
        expect(
          e.description,
          "The remote computer refused the network connection",
        );
      }
    });
  });
}
