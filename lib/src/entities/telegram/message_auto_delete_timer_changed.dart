import 'dart:convert';

class MessageAutoDeleteTimerChanged {
  int messageAutoDeleteTime;

  MessageAutoDeleteTimerChanged(this.messageAutoDeleteTime);

  static MessageAutoDeleteTimerChanged fromJson(Map<String, dynamic> json) {
    return MessageAutoDeleteTimerChanged(json['message_auto_delete_time']);
  }

  Map toJson() {
    return {
      'message_auto_delete_time': messageAutoDeleteTime,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
