import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a [chat member](https://core.telegram.org/bots/api#chatmember)
/// that owns the chat and has all administrator privileges.
class ChatMemberOwner extends ChatMember {
  /// The member's status in the chat, always “creator”
  @override
  String status = 'creator';

  /// Information about the user
  @override
  User user;

  /// True, if the user's presence in the chat is hidden
  bool? isAnonymous;

  /// Custom title for this user
  String? customTitle;

  /// Basic constructor
  ChatMemberOwner({
    required this.user,
    this.isAnonymous,
    this.customTitle,
  });

  /// Creates an object from a json
  factory ChatMemberOwner.fromJson(Map<String, dynamic> json) {
    return ChatMemberOwner(
      user: User.fromJson(json['user']),
      isAnonymous: json['is_anonymous'],
      customTitle: json['custom_title'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'user': user,
      'is_anonymous': isAnonymous,
      'custom_title': customTitle,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
