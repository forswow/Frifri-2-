base class NetworkException implements Exception {
  NetworkException({
    required this.message,
    required this.statusCode,
  }) : where = '';

  /// Optional.
  String where;

  final String message;
  final String statusCode;
}
