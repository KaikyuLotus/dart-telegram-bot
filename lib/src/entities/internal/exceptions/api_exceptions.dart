class APIException implements Exception {
  String description;
  Map<String, dynamic>? query;
  String method;
  int errorCode;

  APIException(this.description, this.errorCode, this.query, this.method);

  @override
  String toString() => 'APIException: $description ($errorCode)\nQuery: $query\nMethod: $method';
}
