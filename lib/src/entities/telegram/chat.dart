import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a chat.
class Chat {
  /// Unique identifier for this chat.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int id;

  /// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
  String type;

  /// Optional.
  /// Title, for supergroups, channels and group chats
  String? title;

  /// Optional.
  /// Username, for private chats, supergroups and channels if available
  String? username;

  /// Optional.
  /// First name of the other party in a private chat
  String? firstName;

  /// Optional.
  /// Last name of the other party in a private chat
  String? lastName;

  /// Optional.
  /// True if the supergroup chat is a forum (has topics enabled)
  bool? isForum;

  /// Optional.
  /// Chat photo. Returned only in getChat.
  ChatPhoto? photo;

  /// Optional.
  /// If non-empty, the list of all active chat usernames;
  /// for private chats, supergroups and channels.
  /// Returned only in getChat.
  List<String>? activeUsernames;

  /// Optional.
  /// Custom emoji identifier of emoji status of the other party in a
  /// private chat.
  /// Returned only in getChat.
  String? emojiStatusCustomEmojiId;

  /// Optional.
  /// Expiration date of the emoji status of the other party in a
  /// private chat, if any.
  /// Returned only in getChat.
  int? emojiStatusExpirationDate;

  /// Optional.
  /// Bio of the other party in a private chat. Returned only in getChat.
  String? bio;

  /// Optional.
  /// True, if privacy settings of the other party in the private chat allows
  /// to use tg://user?id=<user_id> links only in chats with the user.
  /// Returned only in getChat.
  bool? hasPrivateForwards;

  /// Optional.
  /// True, if the privacy settings of the other party restrict sending voice
  /// and video note messages in the private chat.
  /// Returned only in getChat.
  bool? hasRestrictedVoiceAndVideoMessages;

  /// Optional.
  /// True, if users need to join the supergroup before they can send messages.
  /// Returned only in getChat.
  bool? joinToSendMessages;

  /// Optional.
  /// True, if all users directly joining the supergroup need to be approved by
  /// supergroup administrators.
  /// Returned only in getChat.
  bool? joinByRequest;

  /// Optional.
  /// Description, for groups, supergroups and channel chats.
  /// Returned only in getChat.
  String? description;

  /// Optional.
  /// Primary invite link, for groups, supergroups and channel chats.
  /// Returned only in getChat.
  String? inviteLink;

  /// Optional.
  /// The most recent pinned message (by sending date).
  /// Returned only in getChat.
  Message? pinnedMessage;

  /// Optional.
  /// Default chat member permissions, for groups and supergroups.
  /// Returned only in getChat.
  ChatPermissions? permissions;

  /// Optional.
  /// For supergroups, the minimum allowed delay between consecutive messages
  /// sent by each unpriviledged user; in seconds.
  /// Returned only in getChat.
  int? slowModeDelay;

  /// Optional.
  /// The time after which all messages sent to the chat will be automatically
  /// deleted; in seconds.
  /// Returned only in getChat.
  int? messageAutoDeleteTime;

  /// Optional.
  /// True, if aggressive anti-spam checks are enabled in the supergroup.
  /// The field is only available to chat administrators.
  /// Returned only in getChat.
  bool? hasAggressiveAntiSpamEnabled;

  /// Optional.
  /// True, if non-administrators can only get the list of bots and
  /// administrators in the chat.
  /// Returned only in getChat.
  bool? hasHiddenMembers;

  /// Optional.
  /// True, if messages from the chat can't be forwarded to other chats.
  /// Returned only in getChat.
  bool? hasProtectedContent;

  /// Optional.
  /// For supergroups, name of group sticker set.
  /// Returned only in getChat.
  String? stickerSetName;

  /// Optional.
  /// True, if the bot can change the group sticker set.
  /// Returned only in getChat.
  bool? canSetStickerSet;

  /// Optional.
  /// Unique identifier for the linked chat, i.e. the discussion group
  /// identifier for a channel and vice versa;
  /// for supergroups and channel chats. This identifier may be greater than
  /// 32 bits and some programming languages may have difficulty/silent defects
  /// in interpreting it.
  /// But it is smaller than 52 bits, so a signed 64 bit integer or
  /// double-precision float type are safe for storing this identifier.
  /// Returned only in getChat.
  int? linkedChatId;

  /// Optional.
  /// For supergroups, the location to which the supergroup is connected.
  /// Returned only in getChat.
  ChatLocation? location;

  /// Basic constructor
  Chat({
    required this.id,
    required this.type,
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.isForum,
    this.photo,
    this.activeUsernames,
    this.emojiStatusCustomEmojiId,
    this.emojiStatusExpirationDate,
    this.bio,
    this.hasPrivateForwards,
    this.hasRestrictedVoiceAndVideoMessages,
    this.joinToSendMessages,
    this.joinByRequest,
    this.description,
    this.inviteLink,
    this.pinnedMessage,
    this.permissions,
    this.slowModeDelay,
    this.messageAutoDeleteTime,
    this.hasAggressiveAntiSpamEnabled,
    this.hasHiddenMembers,
    this.hasProtectedContent,
    this.stickerSetName,
    this.canSetStickerSet,
    this.linkedChatId,
    this.location,
  });

  /// Creates a object from a json
  static Chat fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id']!,
      type: json['type']!,
      title: json['title'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isForum: json['is_forum'],
      photo: callIfNotNull(ChatPhoto.fromJson, json['photo']),
      activeUsernames: List.from(json['active_usernames'] ?? []),
      emojiStatusCustomEmojiId: json['emoji_status_custom_emoji_id'],
      emojiStatusExpirationDate: json['emoji_status_expiration_date'],
      bio: json['bio'],
      hasPrivateForwards: json['has_private_forwards'],
      hasRestrictedVoiceAndVideoMessages:
          json['has_restricted_voice_and_video_messages'],
      joinToSendMessages: json['join_to_send_messages'],
      joinByRequest: json['join_by_request'],
      description: json['description'],
      inviteLink: json['invite_link'],
      pinnedMessage: callIfNotNull(Message.fromJson, json['pinned_message']),
      permissions: callIfNotNull(ChatPermissions.fromJson, json['permissions']),
      slowModeDelay: json['slow_mode_delay'],
      messageAutoDeleteTime: json['message_auto_delete_time'],
      hasAggressiveAntiSpamEnabled: json['has_aggressive_anti_spam_enabled'],
      hasHiddenMembers: json['has_hidden_members'],
      hasProtectedContent: json['has_protected_content'],
      stickerSetName: json['sticker_set_name'],
      canSetStickerSet: json['can_set_sticker_set'],
      linkedChatId: json['linked_chat_id'],
      location: callIfNotNull(
        ChatLocation.fromJson,
        json['location'],
      ),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'is_forum': isForum,
      'photo': photo,
      'active_usernames': activeUsernames,
      'emoji_status_custom_emoji_id': emojiStatusCustomEmojiId,
      'emoji_status_expiration_date': emojiStatusExpirationDate,
      'bio': bio,
      'has_private_forwards': hasPrivateForwards,
      'has_restricted_voice_and_video_messages':
          hasRestrictedVoiceAndVideoMessages,
      'join_to_send_messages': joinToSendMessages,
      'join_by_request': joinByRequest,
      'description': description,
      'invite_link': inviteLink,
      'pinned_message': pinnedMessage,
      'permissions': permissions,
      'slow_mode_delay': slowModeDelay,
      'message_auto_delete_time': messageAutoDeleteTime,
      'has_aggressive_anti_spam_enabled': hasAggressiveAntiSpamEnabled,
      'has_hidden_members': hasHiddenMembers,
      'has_protected_content': hasProtectedContent,
      'sticker_set_name': stickerSetName,
      'can_set_sticker_set': canSetStickerSet,
      'linked_chat_id': linkedChatId,
      'location': location,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
