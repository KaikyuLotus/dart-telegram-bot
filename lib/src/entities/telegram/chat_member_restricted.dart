import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a [chat member](https://core.telegram.org/bots/api#chatmember)
/// that is under certain restrictions in the chat.
///
/// Supergroups only.
class ChatMemberRestricted extends ChatMember {
  /// The member's status in the chat, always “restricted”
  @override
  String status = 'restricted';

  /// Information about the user
  @override
  User user;

  /// True, if the user is a member of the chat at the moment of the request
  bool? isMember;

  /// True, if the user is allowed to send text messages, contacts, giveaways,
  /// giveaway winners, invoices, locations and venues
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

  /// True, if the user is allowed to send animations, games, stickers and use
  /// inline bots
  bool? canSendOtherMessages;

  /// True, if the user is allowed to add web page previews to their messages
  bool? canAddWebPagePreviews;

  /// True, if the user is allowed to change the chat title, photo and other
  /// settings
  bool? canChangeInfo;

  /// True, if the user is allowed to invite new users to the chat
  bool? canInviteUsers;

  /// True, if the user is allowed to pin messages
  bool? canPinMessages;

  /// True, if the user is allowed to create forum topics
  bool? canManageTopics;

  /// Date when restrictions will be lifted for this user; Unix time.
  ///
  /// If 0, then the user is restricted forever
  int untilDate;

  /// Basic constructor
  ChatMemberRestricted({
    required this.user,
    required this.untilDate,
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
    this.canChangeInfo,
    this.canInviteUsers,
    this.canPinMessages,
    this.canManageTopics,
  });

  /// Creates a object from a json
  factory ChatMemberRestricted.fromJson(Map<String, dynamic> json) {
    return ChatMemberRestricted(
      user: User.fromJson(json['user']),
      isMember: json['is_member'],
      canSendMessages: json['can_send_messages'],
      canSendAudios: json['can_send_audios'],
      canSendDocuments: json['can_send_documents'],
      canSendPhotos: json['can_send_photos'],
      canSendVideos: json['can_send_videos'],
      canSendVideoNotes: json['can_send_video_notes'],
      canSendVoiceNotes: json['can_send_voice_notes'],
      canSendPolls: json['can_send_polls'],
      canSendOtherMessages: json['can_send_other_messages'],
      canAddWebPagePreviews: json['can_add_web_page_previews'],
      canChangeInfo: json['can_change_info'],
      canInviteUsers: json['can_invite_users'],
      canPinMessages: json['can_pin_messages'],
      canManageTopics: json['can_manage_topics'],
      untilDate: json['until_date'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'status': status,
      'user': user,
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
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_pin_messages': canPinMessages,
      'can_manage_topics': canManageTopics,
      'until_date': untilDate,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
