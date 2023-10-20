## Hty

>Dart HTTP wrapper

Example:
```dart
import 'package:hty/hty.dart';
import 'package:http/http.dart' as http;

var hty = Hty(
  baseurl: 'https://jsonplaceholder.typicode.com',
  client: http.Client(),
  defaultHeaders: {
    'Accept': 'application/json',
  },
);
```
---

Carlos Costa @ 2023
