class UnknownAPIMethod implements Exception {
  String cause;

  UnknownAPIMethod(this.cause);

  @override
  String toString() => 'UnknownAPIMethod: $cause';
}
