class APIException implements Exception {
  String description;
  int errorCode;

  APIException(this.description, this.errorCode);

  @override
  String toString() => 'APIException: $description ($errorCode)';
}
