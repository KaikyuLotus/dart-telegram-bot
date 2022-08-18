/// APIException
class APIException implements Exception {
  /// Description
  String description;

  /// Query
  Map<String, dynamic>? query;

  /// Method
  String method;

  /// ErrorCode
  int errorCode;

  /// Basic constructor
  APIException(this.description, this.errorCode, this.query, this.method);

  @override
  String toString() =>
      'APIException: $description ($errorCode)\nQuery: $query\nMethod: $method';
}
