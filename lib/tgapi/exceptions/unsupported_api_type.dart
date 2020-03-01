class UnsupportedAPIType implements Exception {
  String cause;

  UnsupportedAPIType(this.cause);

  @override
  String toString() => 'UnsupportedAPIType: $cause';
}
