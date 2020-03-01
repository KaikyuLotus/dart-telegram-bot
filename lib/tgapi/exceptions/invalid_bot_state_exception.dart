class InvalidBotState implements Exception {
  String cause;

  InvalidBotState(this.cause);

  @override
  String toString() => 'InvalidBotState: $cause';
}
