class ChatPermissions {
  bool canSendMessages;
  bool canSendMediaMessages;
  bool canSendPolls;
  bool canSendOtherMessages;
  bool canAddWebPagePreviews;
  bool canChangeInfo;
  bool canInviteUsers;
  bool canPinMessages;

  ChatPermissions(
      {this.canSendMessages,
      this.canSendMediaMessages,
      this.canSendPolls,
      this.canSendOtherMessages,
      this.canAddWebPagePreviews,
      this.canChangeInfo,
      this.canInviteUsers,
      this.canPinMessages});

  factory ChatPermissions.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ChatPermissions(
        canSendMessages: json['can_send_messages'],
        canSendMediaMessages: json['can_send_media_messages'],
        canSendPolls: json['can_send_polls'],
        canSendOtherMessages: json['can_send_other_messages'],
        canAddWebPagePreviews: json['can_add_web_page_previews'],
        canChangeInfo: json['can_change_info'],
        canInviteUsers: json['can_invite_users'],
        canPinMessages: json['can_pin_messages']);
  }
}
