/// InvalidBotState
class InvalidBotState implements Exception {
  /// Cause
  String cause;

  /// Basic constructor
  InvalidBotState(this.cause);

  @override
  String toString() => 'InvalidBotState: $cause';
}

/// UnsupportedAPIType
class UnsupportedAPIType implements Exception {
  /// Cause
  String cause;

  /// Basic constructor
  UnsupportedAPIType(this.cause);

  @override
  String toString() => 'UnsupportedAPIType: $cause';
}

/// UnsupportedTypeException
class UnsupportedTypeException implements Exception {
  /// Cause
  String cause;

  /// Basic constructor
  UnsupportedTypeException(this.cause);

  @override
  String toString() => 'UnsupportedTypeException: $cause';
}

/// UnknownAPIMethod
class UnknownAPIMethod implements Exception {
  /// Cause
  String cause;

  /// Basic constructor
  UnknownAPIMethod(this.cause);

  @override
  String toString() => 'UnknownAPIMethod: $cause';
}

/// MalformedAPICallException
class MalformedAPICallException implements Exception {
  /// Description
  String description;

  /// Basic constructor
  MalformedAPICallException(this.description);

  @override
  String toString() => 'MalformedAPICallException: $description';
}
