import 'dart:convert';

/// Describes actions that a non-administrator user is allowed to take in a
/// chat.
class ChatPermissions {
  /// Optional.
  /// True, if the user is allowed to send text messages, contacts, locations
  /// and venues
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

  /// Optional.
  /// True, if the user is allowed to send polls, implies can_send_messages
  bool? canSendPolls;

  /// Optional.
  /// True, if the user is allowed to send animations, games, stickers and use
  /// inline bots, implies can_send_media_messages
  bool? canSendOtherMessages;

  /// Optional.
  /// True, if the user is allowed to add web page previews to their messages,
  /// implies can_send_media_messages
  bool? canAddWebPagePreviews;

  /// Optional.
  /// True, if the user is allowed to change the chat title, photo and other
  /// settings. Ignored in public supergroups
  bool? canChangeInfo;

  /// Optional.
  /// True, if the user is allowed to invite new users to the chat
  bool? canInviteUsers;

  /// Optional.
  /// True, if the user is allowed to pin messages. Ignored in public supergroups
  bool? canPinMessages;

  /// Optional.
  /// True, if the user is allowed to create forum topics.
  /// If omitted defaults to the value of can_pin_messages
  bool? canManageTopics;

  /// Basic constructor
  ChatPermissions({
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
  static ChatPermissions fromJson(Map<String, dynamic> json) {
    return ChatPermissions(
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
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
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
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
