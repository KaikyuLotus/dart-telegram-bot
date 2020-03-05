import 'user.dart';

class ChatMember {
  User user;
  String status;
  String customTitle;
  int untilDate;
  bool canBeEdited;
  bool canPostMessages;
  bool canEditMessages;
  bool canDeleteMessages;
  bool canRestrictMembers;
  bool canPromoteMembers;
  bool canChangeInfo;
  bool canInviteUsers;
  bool canPinMessages;
  bool isMember;
  bool canSendMessages;
  bool canSendMediaMessages;
  bool canSendPolls;
  bool canSendOtherMessages;
  bool canAddWebPagePreviews;

  ChatMember(
      {this.user,
      this.status,
      this.customTitle,
      this.untilDate,
      this.canBeEdited,
      this.canPostMessages,
      this.canEditMessages,
      this.canDeleteMessages,
      this.canRestrictMembers,
      this.canPromoteMembers,
      this.canChangeInfo,
      this.canInviteUsers,
      this.canPinMessages,
      this.isMember,
      this.canSendMessages,
      this.canSendMediaMessages,
      this.canSendPolls,
      this.canSendOtherMessages,
      this.canAddWebPagePreviews});

  factory ChatMember.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ChatMember(
      user: User.fromJson(json['user']),
      status: json['status'],
      customTitle: json['custom_title'],
      untilDate: json['until_date'],
      canBeEdited: json['can_be_edited'],
      canPostMessages: json['can_post_messages'],
      canEditMessages: json['can_edit_messages'],
      canDeleteMessages: json['can_delete_messages'],
      canRestrictMembers: json['can_restrict_members'],
      canPromoteMembers: json['can_promote_members'],
      canChangeInfo: json['can_change_info'],
      canInviteUsers: json['can_invite_users'],
      canPinMessages: json['can_pin_messages'],
      isMember: json['is_member'],
      canSendMessages: json['can_send_messages'],
      canSendMediaMessages: json['can_send_media_messages'],
      canSendPolls: json['can_send_polls'],
      canSendOtherMessages: json['can_send_other_messages'],
      canAddWebPagePreviews: json['can_add_web_page_previews'],
    );
  }

  static List<ChatMember> listFromJsonArray(List<dynamic> array) {
    if (array == null) return null;
    return List.generate(array.length, (i) => ChatMember.fromJson(array[i]));
  }
}
