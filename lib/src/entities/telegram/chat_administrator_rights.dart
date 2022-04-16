class ChatAdministratorRights {
  bool isAnonymous;
  bool canManageChat;
  bool canDeleteMessages;
  bool canManageVideoChats;
  bool canRestrictMembers;
  bool canPromoteMembers;
  bool canChangeInfo;
  bool canInviteUsers;
  bool? canPostMessages;
  bool? canEditMessages;
  bool? canPinMessages;

  ChatAdministratorRights(
    this.isAnonymous,
    this.canManageChat,
    this.canDeleteMessages,
    this.canManageVideoChats,
    this.canRestrictMembers,
    this.canPromoteMembers,
    this.canChangeInfo,
    this.canInviteUsers,
    this.canPostMessages,
    this.canEditMessages,
    this.canPinMessages,
  );

  static ChatAdministratorRights fromJson(Map<String, dynamic> json) {
    return ChatAdministratorRights(
      json['is_anonymous'],
      json['can_manage_chat'],
      json['can_delete_messages'],
      json['can_manage_video_chats'],
      json['can_restrict_members'],
      json['can_promote_members'],
      json['can_change_info'],
      json['can_invite_users'],
      json['can_post_messages'],
      json['can_edit_messages'],
      json['can_pin_messages'],
    );
  }

  Map toJson() {
    return {
      'is_anonymous': isAnonymous,
      'can_manage_chat': canManageChat,
      'can_delete_messages': canDeleteMessages,
      'can_manage_video_chats': canManageVideoChats,
      'can_restrict_members': canRestrictMembers,
      'can_promote_members': canPromoteMembers,
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_pin_messages': canPinMessages,
    };
  }
}
