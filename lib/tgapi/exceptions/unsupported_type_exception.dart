class UnsupportedTypeException implements Exception {
  String cause;

  UnsupportedTypeException(this.cause);

  @override
  String toString() => 'UnsupportedTypeException: $cause';
}
