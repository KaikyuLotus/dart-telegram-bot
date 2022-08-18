import 'dart:convert';

/// Describes actions that a non-administrator user is allowed to take in a
/// chat.
class ChatPermissions {
  /// Optional.
  /// True, if the user is allowed to send text messages, contacts, locations
  /// and venues
  bool? canSendMessages;

  /// Optional.
  /// True, if the user is allowed to send audios, documents, photos, videos,
  /// video notes and voice notes, implies can_send_messages
  bool? canSendMediaMessages;

  /// Optional.
  /// True, if the user is allowed to send polls, implies can_send_messages
  bool? canSendPolls;

  /// Optional.
  /// True, if the user is allowed to send animations, games, stickers and use
  /// inline bots, implies can_send_media_messages
  bool? canSendOtherMessages;

  /// Optional.
  /// True, if the user is allowed to add web page previews to their messages,
  /// implies can_send_media_messages
  bool? canAddWebPagePreviews;

  /// Optional.
  /// True, if the user is allowed to change the chat title, photo and other
  /// settings. Ignored in public supergroups
  bool? canChangeInfo;

  /// Optional.
  /// True, if the user is allowed to invite new users to the chat
  bool? canInviteUsers;

  /// Optional.
  /// True, if the user is allowed to pin messages. Ignored in public supergroups
  bool? canPinMessages;

  /// Basic constructor
  ChatPermissions({
    this.canSendMessages,
    this.canSendMediaMessages,
    this.canSendPolls,
    this.canSendOtherMessages,
    this.canAddWebPagePreviews,
    this.canChangeInfo,
    this.canInviteUsers,
    this.canPinMessages,
  });

  /// Creates a object from a json
  static ChatPermissions fromJson(Map<String, dynamic> json) {
    return ChatPermissions(
      canSendMessages: json['can_send_messages'],
      canSendMediaMessages: json['can_send_media_messages'],
      canSendPolls: json['can_send_polls'],
      canSendOtherMessages: json['can_send_other_messages'],
      canAddWebPagePreviews: json['can_add_web_page_previews'],
      canChangeInfo: json['can_change_info'],
      canInviteUsers: json['can_invite_users'],
      canPinMessages: json['can_pin_messages'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'can_send_messages': canSendMessages,
      'can_send_media_messages': canSendMediaMessages,
      'can_send_polls': canSendPolls,
      'can_send_other_messages': canSendOtherMessages,
      'can_add_web_page_previews': canAddWebPagePreviews,
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_pin_messages': canPinMessages,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
