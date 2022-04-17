import 'dart:convert';

import '../../../telegram_entities.dart';

class ChatMember {
  User user;
  String status;
  String? customTitle;
  int? untilDate;
  bool? canBeEdited;
  bool? canPostMessages;
  bool? canEditMessages;
  bool? canDeleteMessages;
  bool? canRestrictMembers;
  bool? canPromoteMembers;
  bool? canChangeInfo;
  bool? canInviteUsers;
  bool? canPinMessages;
  bool? isMember;
  bool? canSendMessages;
  bool? canSendMediaMessages;
  bool? canSendPolls;
  bool? canSendOtherMessages;
  bool? canAddWebPagePreviews;
  bool? canManageVideoChats;
  bool? canManageChat;
  bool? isAnonymous;

  ChatMember({
    required this.user,
    required this.status,
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
    this.canAddWebPagePreviews,
    this.canManageVideoChats,
    this.canManageChat,
    this.isAnonymous,
  });

  static ChatMember fromJson(Map<String, dynamic> json) {
    var isAdmin = json['status'] == 'administrator';
    var isCreator = json['status'] == 'creator';
    var isMember = json['status'] == 'member';
    return ChatMember(
      user: User.fromJson(json['user']!),
      status: json['status']!,
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
      canManageVideoChats: json['can_manage_video_chats'] ?? isCreator,
      canManageChat: json['can_manage_chat'] ?? isCreator,
      isAnonymous: json['is_anonymous'],
    );
  }

  static List<ChatMember> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => ChatMember.fromJson(array[i]),
    );
  }

  Map toJson() {
    return {
      'user': user,
      'status': status,
      'custom_title': customTitle,
      'until_date': untilDate,
      'can_be_edited': canBeEdited,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_delete_messages': canDeleteMessages,
      'can_restrict_members': canRestrictMembers,
      'can_promote_members': canPromoteMembers,
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_pin_messages': canPinMessages,
      'is_member': isMember,
      'can_send_messages': canSendMessages,
      'can_send_media_messages': canSendMediaMessages,
      'can_send_polls': canSendPolls,
      'can_send_other_messages': canSendOtherMessages,
      'can_add_web_page_previews': canAddWebPagePreviews,
      'can_manage_video_chats': canManageVideoChats,
      'can_manage_chat': canManageChat,
      'is_anonymous': isAnonymous,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
