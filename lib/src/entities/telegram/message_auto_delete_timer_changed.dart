import 'dart:convert';

/// This object represents a service message about a change in auto-delete
/// timer settings.
class MessageAutoDeleteTimerChanged {
  /// New auto-delete time for messages in the chat; in seconds
  int messageAutoDeleteTime;

  /// Basic constructor
  MessageAutoDeleteTimerChanged(this.messageAutoDeleteTime);

  /// Creates a object from a json
  static MessageAutoDeleteTimerChanged fromJson(Map<String, dynamic> json) {
    return MessageAutoDeleteTimerChanged(json['message_auto_delete_time']);
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'message_auto_delete_time': messageAutoDeleteTime,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
