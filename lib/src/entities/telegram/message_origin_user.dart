import 'dart:convert';

import '../../../telegram_entities.dart';

/// The message was originally sent by a known user.
class MessageOriginUser extends MessageOrigin {
  /// Type of the message origin, always “user”
  @override
  String type = 'user';

  /// Date the message was sent originally in Unix time
  @override
  int date;

  /// User that sent the message originally
  User senderUser;

  /// Basic constructor
  MessageOriginUser({
    required this.date,
    required this.senderUser,
  });

  /// Creates a object from a json
  factory MessageOriginUser.fromJson(Map<String, dynamic> json) {
    return MessageOriginUser(
      date: json['date'],
      senderUser: User.fromJson(json['sender_user']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'date': date,
      'sender_user': senderUser,
    };
  }

  @override
  String toString() => json.encode(this);
}
