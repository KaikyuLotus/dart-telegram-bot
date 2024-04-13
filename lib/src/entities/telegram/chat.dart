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
  /// List of available reactions allowed in the chat.
  /// If omitted, then all emoji reactions are allowed.
  /// Returned only in getChat.
  List<ReactionType>? availableReactions;

  /// Optional.
  /// Identifier of the accent color for the chat name and backgrounds of
  /// the chat photo, reply header, and link preview.
  /// See accent colors for more details.
  /// Returned only in getChat.
  /// Always returned in getChat.
  int? accentColorId;

  /// Optional.
  /// Custom emoji identifier of emoji chosen by the chat for the reply header
  /// and link preview background.
  /// Returned only in getChat.
  String? backgroundCustomEmojiId;

  /// Optional.
  /// Identifier of the accent color for the chat's profile background.
  /// See profile accent colors for more details.
  /// Returned only in getChat.
  int? profileAccentColorId;

  /// Optional.
  /// Custom emoji identifier of the emoji chosen by the chat for
  /// its profile background.
  /// Returned only in getChat.
  String? profileBackgroundCustomEmojiId;

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
  /// For supergroups, the minimum number of boosts that a non-administrator
  /// user needs to add in order to ignore slow mode and chat permissions.
  /// Returned only in getChat.
  int? unrestrictBoostCount;

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
  /// True, if new chat members will have access to old messages;
  /// available only to chat administrators.
  /// Returned only in getChat.
  bool? hasVisibleHistory;

  /// Optional.
  /// For supergroups, name of group sticker set.
  /// Returned only in getChat.
  String? stickerSetName;

  /// Optional.
  /// True, if the bot can change the group sticker set.
  /// Returned only in getChat.
  bool? canSetStickerSet;

  /// Optional.
  /// For supergroups, the name of the group's custom emoji sticker set.
  /// Custom emoji from this set can be used by all users and bots in the group.
  /// Returned only in getChat.
  String? customEmojiStickerSetName;

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
    this.availableReactions,
    this.accentColorId,
    this.backgroundCustomEmojiId,
    this.profileAccentColorId,
    this.profileBackgroundCustomEmojiId,
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
    this.unrestrictBoostCount,
    this.messageAutoDeleteTime,
    this.hasAggressiveAntiSpamEnabled,
    this.hasHiddenMembers,
    this.hasProtectedContent,
    this.hasVisibleHistory,
    this.stickerSetName,
    this.canSetStickerSet,
    this.customEmojiStickerSetName,
    this.linkedChatId,
    this.location,
  });

  /// Creates a object from a json
  factory Chat.fromJson(Map<String, dynamic> json) {
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
      availableReactions: callIfNotNull(
        ReactionType.listFromJsonArray,
        json['available_reactions'],
      ),
      accentColorId: json['accent_color_id'],
      backgroundCustomEmojiId: json['background_custom_emoji_id'],
      profileAccentColorId: json['profile_accent_color_id'],
      profileBackgroundCustomEmojiId:
          json['profile_background_custom_emoji_id'],
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
      unrestrictBoostCount: json['unrestrict_boost_count'],
      messageAutoDeleteTime: json['message_auto_delete_time'],
      hasAggressiveAntiSpamEnabled: json['has_aggressive_anti_spam_enabled'],
      hasHiddenMembers: json['has_hidden_members'],
      hasProtectedContent: json['has_protected_content'],
      hasVisibleHistory: json['has_visible_history'],
      stickerSetName: json['sticker_set_name'],
      canSetStickerSet: json['can_set_sticker_set'],
      customEmojiStickerSetName: json['custom_emoji_sticker_set_name'],
      linkedChatId: json['linked_chat_id'],
      location: callIfNotNull(ChatLocation.fromJson, json['location']),
    );
  }

  /// Creates a list of object from a json array
  static List<Chat> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => Chat.fromJson(json[i]));
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
      'available_reactions': availableReactions,
      'accent_color_id': accentColorId,
      'background_custom_emoji_id': backgroundCustomEmojiId,
      'profile_accent_color_id': profileAccentColorId,
      'profile_background_custom_emoji_id': profileBackgroundCustomEmojiId,
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
      'unrestrict_boost_count': unrestrictBoostCount,
      'message_auto_delete_time': messageAutoDeleteTime,
      'has_aggressive_anti_spam_enabled': hasAggressiveAntiSpamEnabled,
      'has_hidden_members': hasHiddenMembers,
      'has_protected_content': hasProtectedContent,
      'has_visible_history': hasVisibleHistory,
      'sticker_set_name': stickerSetName,
      'can_set_sticker_set': canSetStickerSet,
      'custom_emoji_sticker_set_name': customEmojiStickerSetName,
      'linked_chat_id': linkedChatId,
      'location': location,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
