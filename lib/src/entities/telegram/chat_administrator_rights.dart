/// Represents the rights of an administrator in a chat.
class ChatAdministratorRights {
  /// True, if the user's presence in the chat is hidden
  bool isAnonymous;

  /// True, if the administrator can access the chat event log, chat statistics,
  /// message statistics in channels, see channel members, see anonymous
  /// administrators in supergroups and ignore slow mode.
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

  /// Optional.
  /// True, if the administrator can post in the channel; channels only
  bool? canPostMessages;

  /// Optional.
  /// True, if the administrator can edit messages of other users and can pin
  /// messages; channels only
  bool? canEditMessages;

  /// Optional.
  /// True, if the user is allowed to pin messages; groups and supergroups only
  bool? canPinMessages;

  /// Optional.
  /// True, if the administrator can post stories in the channel; channels only
  bool? canPostStories;

  /// Optional.
  /// True, if the administrator can edit stories posted by other users;
  /// channels only
  bool? canEditStories;

  /// Optional.
  /// True, if the administrator can delete stories posted by other users;
  /// channels only
  bool? canDeleteStories;

  /// Optional.
  /// True, if the user is allowed to create, rename, close, and reopen forum
  /// topics; supergroups only
  bool? canManageTopics;

  /// Basic constructor
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
    this.canPostStories,
    this.canEditStories,
    this.canDeleteStories,
    this.canManageTopics,
  );

  /// Creates a object from a json
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
      json['can_post_stories'],
      json['can_edit_stories'],
      json['can_delete_stories'],
      json['can_manage_topics'],
    );
  }

  /// Creates a json from the object
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
      'can_post_stories': canPostStories,
      'can_edit_stories': canEditStories,
      'can_delete_stories': canDeleteStories,
      'can_manage_topics': canManageTopics,
    };
  }
}
