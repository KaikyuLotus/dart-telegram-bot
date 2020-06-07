class InvalidBotState implements Exception {
  String cause;

  InvalidBotState(this.cause);

  @override
  String toString() => 'InvalidBotState: $cause';
}

class UnsupportedAPIType implements Exception {
  String cause;

  UnsupportedAPIType(this.cause);

  @override
  String toString() => 'UnsupportedAPIType: $cause';
}

class UnsupportedTypeException implements Exception {
  String cause;

  UnsupportedTypeException(this.cause);

  @override
  String toString() => 'UnsupportedTypeException: $cause';
}

class UnknownAPIMethod implements Exception {
  String cause;

  UnknownAPIMethod(this.cause);

  @override
  String toString() => 'UnknownAPIMethod: $cause';
}

class MalformedAPICallException implements Exception {
  String description;

  MalformedAPICallException(this.description);

  @override
  String toString() => 'MalformedAPICallException: $description';
}
