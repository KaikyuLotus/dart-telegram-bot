import 'dart:convert';

import '../../../telegram_entities.dart';

/// The message was originally sent by an unknown user.
class MessageOriginHiddenUser extends MessageOrigin {
  /// Type of the message origin, always “hidden_user”
  @override
  String type = 'hidden_user';

  /// Date the message was sent originally in Unix time
  int date;

  /// Name of the user that sent the message originally
  String senderUserName;

  /// Basic constructor
  MessageOriginHiddenUser({
    required this.date,
    required this.senderUserName,
  });

  /// Creates a object from a json
  factory MessageOriginHiddenUser.fromJson(Map<String, dynamic> json) {
    return MessageOriginHiddenUser(
      date: json['date'],
      senderUserName: json['sender_user_name'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'date': date,
      'sender_user_name': senderUserName,
    };
  }

  @override
  String toString() => json.encode(this);
}
