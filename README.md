# Hty

>Tiny http wrapper

[![Hty](https://github.com/C4co/hty/actions/workflows/dart.yml/badge.svg)](https://github.com/C4co/hty/actions/workflows/dart.yml)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/65d364a6801a4d4f9102d3cb9920a970)](https://app.codacy.com/gh/C4co/hty/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

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

`hty` is a class that provides a set of methods for sending HTTP requests and handling responses.

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

`hty.get` is a method that sends a GET request to the specified path.

```dart
var reponse = await hty.get(
  path: "/todos",
);
```

| Parameter | Type                    | Description                          |
| --------- | ----------------------- | ------------------------------------ |
| `path`    | `String`                | Path to resource                     |
| `query`   | `Map<String, dynamic>?` | Query params                         |
| `headers` | `Map<String, dynamic>?` | Specific headers for current request |
| `cache`   | `bool`                  | Memory cache, default is `true`      |

> [!NOTE]
> Memory cache: If the same request is made twice, the second request will be returned from memory.

## hty.post()

`hty.post` is a method that sends a POST request to the specified path.

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
| `path`     | `String`                | Path to resource                     |
| `headers`  | `Map<String, dynamic>?` | Specific headers for current request |
| `payload`  | `Map<String, string>?`  | Request body                         |
| `encoding` | `Enconding`             | Default is `utf-8`                   |

## hty.put()

`hty.put` is a method that sends a PUT request to the specified path.

```dart
var reponse = await hty.put(
  path: "/todos/1",
  payload: {
    'title': 'todo title',
    'content': 'todo content',
  },
);
```

| Parameter  | Type                    | Description                          |
| ---------- | ----------------------- | ------------------------------------ |
| `path`     | `String`                | Path to resource                     |
| `headers`  | `Map<String, dynamic>?` | Specific headers for current request |
| `payload`  | `Map<String, string>?`  | Request body                         |
| `encoding` | `Enconding`             | Default is `utf-8`                   |

## hty.delete()

`hty.delete` is a method that sends a DELETE request to the specified path.

```dart
var reponse = await hty.delete(
  path: "/todos/1",
);
```

## HtyGetResponse

`htyGetResponse` is a class that contains the response from a GET request.

| Parameter         | Type                   | Description                    |
| ----------------- | ---------------------- | ------------------------------ |
| `statusCode`      | `int`                  | HTTP status code               |
| `responseHeaders` | `Map<String, string>?` | Response headers               |
| `requestHeaders`  | `Map<String, string>?` | Request headers                |
| `data`            | `dynamic`              | Request data                   |
| `response`        | `http.Response`        | Full response from HTTP object |
| `message`         | `String`               | HTTP message                   |

## HtyPostResponse

`htyPostResponse` is a class that contains the response from a POST request.

| Parameter         | Type                   | Description                    |
| ----------------- | ---------------------- | ------------------------------ |
| `statusCode`      | `int`                  | HTTP status code               |
| `responseHeaders` | `Map<String, string>?` | Response headers               |
| `requestHeaders`  | `Map<String, string>?` | Request headers                |
| `data`            | `dynamic`              | Request data                   |
| `response`        | `http.Response`        | Full response from HTTP object |
| `message`         | `String`               | HTTP message                   |
| `payload`         | `Map<String, string>?` | Request body                   |

## HtyException

`htyException` is a class that contains information about an error that occurred during a request.

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
| `message`     | `String`                          | Error message         |
| `description` | `Map<String, String>` or `String` | Api error description |

## Development

**Start server:**
the web server run with dart frog: https://dartfrog.vgv.dev/
```bash
  cd server
  dart_frog serve
```

**Run tests:**
```bash
  dart test
```
---

Carlos Costa @ 2023
