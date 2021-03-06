import 'dart:convert';

class ChatPermissions {
  bool? canSendMessages;
  bool? canSendMediaMessages;
  bool? canSendPolls;
  bool? canSendOtherMessages;
  bool? canAddWebPagePreviews;
  bool? canChangeInfo;
  bool? canInviteUsers;
  bool? canPinMessages;

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
