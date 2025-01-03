/// Represents the rights of an administrator in a chat.
class ChatAdministratorRights {
  /// True, if the user's presence in the chat is hidden
  bool isAnonymous;

  /// True, if the administrator can access the chat event log, chat statistics,
  /// message statistics in channels, see channel members, see anonymous
  /// administrators in supergroups and ignore slow mode.
  ///
  /// Implied by any other administrator privilege
  bool canManageChat;

  /// True, if the administrator can delete messages of other users
  bool canDeleteMessages;

  /// True, if the administrator can manage video chats
  bool canManageVideoChats;

  /// True, if the administrator can restrict, ban or unban chat members
  bool canRestrictMembers;

  /// True, if the administrator can add new administrators with a subset of
  /// their own privileges or demote administrators that he has promoted,
  /// directly or indirectly (promoted by administrators that were appointed by
  /// the user)
  bool canPromoteMembers;

  /// True, if the user is allowed to change the chat title, photo and other
  /// settings
  bool canChangeInfo;

  /// True, if the user is allowed to invite new users to the chat
  bool canInviteUsers;

  /// True, if the administrator can post stories in the channel; channels only
  bool? canPostStories;

  /// True, if the administrator can edit stories posted by other users;
  /// channels only
  bool? canEditStories;

  /// True, if the administrator can delete stories posted by other users;
  /// channels only
  bool? canDeleteStories;

  /// True, if the administrator can post in the channel; channels only
  bool? canPostMessages;

  /// True, if the administrator can edit messages of other users and can pin
  /// messages; channels only
  bool? canEditMessages;

  /// True, if the user is allowed to pin messages; groups and supergroups only
  bool? canPinMessages;

  /// True, if the user is allowed to create, rename, close, and reopen forum
  /// topics; supergroups only
  bool? canManageTopics;

  /// Basic constructor
  ChatAdministratorRights({
    required this.isAnonymous,
    required this.canManageChat,
    required this.canDeleteMessages,
    required this.canManageVideoChats,
    required this.canRestrictMembers,
    required this.canPromoteMembers,
    required this.canChangeInfo,
    required this.canInviteUsers,
    this.canPostStories,
    this.canEditStories,
    this.canDeleteStories,
    this.canPostMessages,
    this.canEditMessages,
    this.canPinMessages,
    this.canManageTopics,
  });

  /// Creates an object from a json
  factory ChatAdministratorRights.fromJson(Map<String, dynamic> json) {
    return ChatAdministratorRights(
      isAnonymous: json['is_anonymous'],
      canManageChat: json['can_manage_chat'],
      canDeleteMessages: json['can_delete_messages'],
      canManageVideoChats: json['can_manage_video_chats'],
      canRestrictMembers: json['can_restrict_members'],
      canPromoteMembers: json['can_promote_members'],
      canChangeInfo: json['can_change_info'],
      canInviteUsers: json['can_invite_users'],
      canPostStories: json['can_post_stories'],
      canEditStories: json['can_edit_stories'],
      canDeleteStories: json['can_delete_stories'],
      canPostMessages: json['can_post_messages'],
      canEditMessages: json['can_edit_messages'],
      canPinMessages: json['can_pin_messages'],
      canManageTopics: json['can_manage_topics'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'is_anonymous': isAnonymous,
      'can_manage_chat': canManageChat,
      'can_delete_messages': canDeleteMessages,
      'can_manage_video_chats': canManageVideoChats,
      'can_restrict_members': canRestrictMembers,
      'can_promote_members': canPromoteMembers,
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_post_stories': canPostStories,
      'can_edit_stories': canEditStories,
      'can_delete_stories': canDeleteStories,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_pin_messages': canPinMessages,
      'can_manage_topics': canManageTopics,
    }..removeWhere((_, v) => v == null);
  }
}
