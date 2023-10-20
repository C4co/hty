## Hty

>Tiny HTTP wrapper

Example:

```dart
import 'package:hty/hty.dart';
import 'package:http/http.dart' as http;

void main(){
  var hty = Hty(
    baseurl: 'https://jsonplaceholder.typicode.com',
    client: http.Client(),
    defaultHeaders: {
      'Accept': 'application/json',
    },
  );

  var result = await jsonPlaceholder.get(
    path: "/todos",
  );

  hty.close();
}
```

### Hty()

Client container for HTTP requests.

```dart
var hty = Hty(
  baseurl: 'https://jsonplaceholder.typicode.com',
  client: http.Client(),
  defaultHeaders: {
    'Accept': 'application/json',
  },
);
```

| Parameter        | Type                  | Description                                |
| ---------------- | --------------------- | ------------------------------------------ |
| `baseurl`        | `String`              | Base URL for requests                      |
| `client`         | `http.Client`         | HTTP Client                                |
| `defaultHeaders` | `Map<String, String>` | Headers that will be used on every request |

---

Carlos Costa @ 2023
