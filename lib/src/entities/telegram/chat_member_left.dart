import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a chat member that isn't currently a member of the chat, but may
/// join it themselves.
class ChatMemberLeft extends ChatMember {
  /// The member's status in the chat, always “left”
  @override
  String status = 'left';

  /// Information about the user
  @override
  User user;

  /// Basic constructor
  ChatMemberLeft({
    required this.user,
  });

  /// Creates a object from a json
  factory ChatMemberLeft.fromJson(Map<String, dynamic> json) {
    return ChatMemberLeft(
      user: User.fromJson(json['user']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'status': status,
      'user': user,
    };
  }

  @override
  String toString() => json.encode(this);
}
