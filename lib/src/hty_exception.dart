class HtyException implements Exception {
  final String message;
  final int statusCode;
  final dynamic description;

  HtyException({
    required this.message,
    required this.statusCode,
    required this.description,
  });
}
