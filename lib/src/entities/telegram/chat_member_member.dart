import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a [chat member](https://core.telegram.org/bots/api#chatmember)
/// that has no additional privileges or restrictions.
class ChatMemberMember extends ChatMember {
  /// The member's status in the chat, always “member”
  @override
  String status = 'member';

  /// Information about the user
  @override
  User user;

  /// Date when the user's subscription will expire; Unix time
  int? untilDate;

  /// Basic constructor
  ChatMemberMember({
    required this.user,
    required this.untilDate,
  });

  /// Creates a object from a json
  factory ChatMemberMember.fromJson(Map<String, dynamic> json) {
    return ChatMemberMember(
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
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
