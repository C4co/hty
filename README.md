# Hty

>Tiny HTTP wrapper

## Install

```yaml
dependencies:
  hty:
    git:
      url: https://github.com/C4co/hty.git
```

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

  var result = await hty.get(
    path: "/todos",
  );

  hty.close();
}
```

## Hty()

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

## hty.get()

```dart
var reponse = await hty.get(
  path: "/todos",
);
```

| Parameter | Type                    | Description                          |
| --------- | ----------------------- | ------------------------------------ |
| `path`    | `String`                | path to resource                     |
| `query`   | `Map<String, dynamic>?` | query params                         |
| `headers` | `Map<String, dynamic>?` | specific headers for current request |
| `cache`   | `bool`                  | memory cache, default is `true`      |

## hty.post()

```dart
var reponse = await hty.post(
  path: "/todos",
  payload: {
    'title': 'todo title',
    'content': 'todo content',
  },
);
```

| Parameter  | Type                    | Description                          |
| ---------- | ----------------------- | ------------------------------------ |
| `path`     | `String`                | path to resource                     |
| `headers`  | `Map<String, dynamic>?` | specific headers for current request |
| `payload`  | `Map<String, string>?`  | request body                         |
| `encoding` | `Enconding`             | default is `utf-8`                   |

## HtyGetResponse

| Parameter         | Type                   | Description                    |
| ----------------- | ---------------------- | ------------------------------ |
| `statusCode`      | `int`                  | http status code               |
| `responseHeaders` | `Map<String, string>?` | response headers               |
| `requestHeaders`  | `Map<String, string>?` | request headers                |
| `data`            | `dynamic`              | request data                   |
| `response`        | `http.Response`        | full response from http object |
| `message`         | `String`               | http message                   |

## HtyPostResponse

| Parameter         | Type                   | Description                    |
| ----------------- | ---------------------- | ------------------------------ |
| `statusCode`      | `int`                  | http status code               |
| `responseHeaders` | `Map<String, string>?` | response headers               |
| `requestHeaders`  | `Map<String, string>?` | request headers                |
| `data`            | `dynamic`              | request data                   |
| `response`        | `http.Response`        | full response from http object |
| `message`         | `String`               | http message                   |
| `payload`         | `Map<String, string>?` | request body                   |

## HtyException

```dart
try {
  await hty.post(
    path: '/posts',
    payload: {
      'title': 'title',
      'body': 'content',
      'userId': '1',
    },
  );
} on HtyException catch (e) {
  print(e.message);
  print(e.statusCode);
  print(e.description);
}
```

| Parameter     | Type                              | Description           |
| ------------- | --------------------------------- | --------------------- |
| `statusCode`  | `int`                             | HTTP status code      |
| `message`     | `String`                          | error message         |
| `description` | `Map<String, String>` or `String` | api error description |

---

Carlos Costa @ 2023
