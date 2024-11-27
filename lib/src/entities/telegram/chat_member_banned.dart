import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a [chat member](https://core.telegram.org/bots/api#chatmember)
/// that was banned in the chat and can't return to the chat or view chat
/// messages.
class ChatMemberBanned extends ChatMember {
  /// The member's status in the chat, always “banned”
  @override
  String status = 'banned';

  /// Information about the user
  @override
  User user;

  /// Date when restrictions will be lifted for this user; Unix time.
  ///
  /// If 0, then the user is banned forever
  int untilDate;

  /// Basic constructor
  ChatMemberBanned({
    required this.user,
    required this.untilDate,
  });

  /// Creates a object from a json
  factory ChatMemberBanned.fromJson(Map<String, dynamic> json) {
    return ChatMemberBanned(
      user: User.fromJson(json['user']),
      untilDate: json['until_date'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'status': status,
      'user': user,
      'until_date': untilDate,
    };
  }

  @override
  String toString() => json.encode(this);
}
