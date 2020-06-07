part of '../../entities.dart';

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
    // TODO improve this part?
    var isAdmin = json['status'] == 'administrator';
    var isCreator = json['status'] == 'creator';
    // var isKicked = json['status'] == 'kicked';
    var isMember = json['status'] == 'member';
    // var isRestricted = json['status'] == 'restricted';
    // var hasLeft = json['status'] == 'left';
    return ChatMember(
      user: User.fromJson(json['user']),
      status: json['status'],
      customTitle: json['custom_title'],
      untilDate: json['until_date'],
      canBeEdited: json['can_be_edited'],
      canPostMessages: json['can_post_messages'] ?? isCreator,
      canEditMessages: json['can_edit_messages'] ?? isCreator,
      canDeleteMessages: json['can_delete_messages'] ?? isCreator,
      canRestrictMembers: json['can_restrict_members'] ?? isCreator,
      canPromoteMembers: json['can_promote_members'] ?? isCreator,
      canChangeInfo: json['can_change_info'] ?? isCreator,
      canInviteUsers: json['can_invite_users'] ?? isCreator,
      canPinMessages: json['can_pin_messages'] ?? isCreator,
      isMember: json['is_member'] ?? isCreator || isAdmin || isMember,
      canSendMessages: json['can_send_messages'] ?? isCreator,
      canSendMediaMessages: json['can_send_media_messages'] ?? isCreator,
      canSendPolls: json['can_send_polls'] ?? isCreator,
      canSendOtherMessages: json['can_send_other_messages'] ?? isCreator,
      canAddWebPagePreviews: json['can_add_web_page_previews'] ?? isCreator,
    );
  }

  static List<ChatMember> listFromJsonArray(List<dynamic> array) {
    if (array == null) return null;
    return List.generate(array.length, (i) => ChatMember.fromJson(array[i]));
  }
}
