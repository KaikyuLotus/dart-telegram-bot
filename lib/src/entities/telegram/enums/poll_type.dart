part of '../../../entities.dart';

class PollType {
  String _type;

  PollType._(this._type);

  factory PollType.Regular() {
    return PollType._('regular');
  }

  factory PollType.Quiz() {
    return PollType._('quiz');
  }

  factory PollType.fromString(String type) {
    return PollType._(type);
  }

  @override
  String toString() {
    return _type;
  }
}
