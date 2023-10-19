import 'dart:convert';

import '../../../telegram_entities.dart';

// TODO: Create the different types of chat members

/// This object contains information about one member of a chat.
/// Currently, the following 6 types of chat members are supported:
/// ChatMemberOwner,
/// ChatMemberAdministrator,
/// ChatMemberMember,
/// ChatMemberRestricted,
/// ChatMemberLeft,
/// ChatMemberBanned
class ChatMember {
  /// Information about the user
  User user;

  /// The member's status in the chat
  String status;

  /// Custom title for this user
  String? customTitle;

  /// Date when restrictions will be lifted for this user; unix time.
  /// If 0, then the user is restricted forever
  int? untilDate;

  /// True, if the bot is allowed to edit administrator privileges of that user
  bool? canBeEdited;

  /// True, if the administrator can post in the channel; channels only
  bool? canPostMessages;

  /// True, if the administrator can edit messages of other users and can pin
  /// messages; channels only
  bool? canEditMessages;

  /// True, if the administrator can delete messages of other users
  bool? canDeleteMessages;

  /// True, if the administrator can restrict, ban or unban chat members
  bool? canRestrictMembers;

  /// True, if the administrator can add new administrators with a subset of
  /// their own privileges or demote administrators that he has promoted,
  /// directly or indirectly (promoted by administrators that were appointed by
  /// the user)
  bool? canPromoteMembers;

  /// True, if the user is allowed to change the chat title, photo and other
  /// settings
  bool? canChangeInfo;

  /// True, if the user is allowed to invite new users to the chat
  bool? canInviteUsers;

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

  /// True, if the user is a member of the chat at the moment of the request
  bool? isMember;

  /// True, if the user is allowed to send text messages, contacts,
  /// locations and venues
  bool? canSendMessages;

  /// True, if the user is allowed to send audios
  bool? canSendAudios;

  /// True, if the user is allowed to send documents
  bool? canSendDocuments;

  /// True, if the user is allowed to send photos
  bool? canSendPhotos;

  /// True, if the user is allowed to send videos
  bool? canSendVideos;

  /// True, if the user is allowed to send video notes
  bool? canSendVideoNotes;

  /// True, if the user is allowed to send voice notes
  bool? canSendVoiceNotes;

  /// True, if the user is allowed to send polls
  bool? canSendPolls;

  /// True, if the user is allowed to send animations, games, stickers and
  /// use inline bots
  bool? canSendOtherMessages;

  /// True, if the user is allowed to add web page previews to their messages
  bool? canAddWebPagePreviews;

  /// True, if the administrator can manage video chats
  bool? canManageVideoChats;

  /// True, if the administrator can access the chat event log, chat statistics,
  /// message statistics in channels, see channel members, see anonymous
  /// administrators in supergroups and ignore slow mode.
  /// Implied by any other administrator privilege
  bool? canManageChat;

  /// True, if the user's presence in the chat is hidden
  bool? isAnonymous;

  /// Optional.
  /// True, if the user is allowed to create, rename, close, and reopen forum
  /// topics; supergroups only
  bool? canManageTopics;

  /// Basic constructor
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
    this.canPostStories,
    this.canEditStories,
    this.canDeleteStories,
    this.isMember,
    this.canSendMessages,
    this.canSendAudios,
    this.canSendDocuments,
    this.canSendPhotos,
    this.canSendVideos,
    this.canSendVideoNotes,
    this.canSendVoiceNotes,
    this.canSendPolls,
    this.canSendOtherMessages,
    this.canAddWebPagePreviews,
    this.canManageVideoChats,
    this.canManageChat,
    this.isAnonymous,
    this.canManageTopics,
  });

  /// Creates a object from a json
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
      canPostStories: json['can_post_stories'] ?? isCreator,
      canEditStories: json['can_edit_stories'] ?? isCreator,
      canDeleteStories: json['can_delete_stories'] ?? isCreator,
      isMember: json['is_member'] ?? isCreator || isAdmin || isMember,
      canSendMessages: json['can_send_messages'] ?? isCreator,
      canSendAudios: json['can_send_audios'] ?? isCreator,
      canSendDocuments: json['can_send_documents'] ?? isCreator,
      canSendPhotos: json['can_send_photos'] ?? isCreator,
      canSendVideos: json['can_send_videos'] ?? isCreator,
      canSendVideoNotes: json['can_send_video_notes'] ?? isCreator,
      canSendVoiceNotes: json['can_send_voice_notes'] ?? isCreator,
      canSendPolls: json['can_send_polls'] ?? isCreator,
      canSendOtherMessages: json['can_send_other_messages'] ?? isCreator,
      canAddWebPagePreviews: json['can_add_web_page_previews'] ?? isCreator,
      canManageVideoChats: json['can_manage_video_chats'] ?? isCreator,
      canManageChat: json['can_manage_chat'] ?? isCreator,
      isAnonymous: json['is_anonymous'],
      canManageTopics: json['can_manage_topics'],
    );
  }

  /// Creates a list of object from a json array
  static List<ChatMember> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => ChatMember.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
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
      'can_post_stories': canPostStories,
      'can_edit_stories': canEditStories,
      'can_delete_stories': canDeleteStories,
      'is_member': isMember,
      'can_send_messages': canSendMessages,
      'can_send_audios': canSendAudios,
      'can_send_documents': canSendDocuments,
      'can_send_photos': canSendPhotos,
      'can_send_videos': canSendVideos,
      'can_send_video_notes': canSendVideoNotes,
      'can_send_voice_notes': canSendVoiceNotes,
      'can_send_polls': canSendPolls,
      'can_send_other_messages': canSendOtherMessages,
      'can_add_web_page_previews': canAddWebPagePreviews,
      'can_manage_video_chats': canManageVideoChats,
      'can_manage_chat': canManageChat,
      'is_anonymous': isAnonymous,
      'can_manage_topics': canManageTopics,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
