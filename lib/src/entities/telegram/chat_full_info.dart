import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains full information about a chat.
class ChatFullInfo {
  /// Unique identifier for this chat.
  ///
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  ///
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int id;

  /// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
  String type;

  /// Title, for supergroups, channels and group chats
  String? title;

  /// Username, for private chats, supergroups and channels if available
  String? username;

  /// First name of the other party in a private chat
  String? firstName;

  /// Last name of the other party in a private chat
  String? lastName;

  /// True if the supergroup chat is a forum (has
  /// [topics](https://telegram.org/blog/topics-in-groups-collectible-usernames#topics-in-groups)
  /// enabled)
  bool? isForum;

  /// Identifier of the accent color for the chat name and backgrounds of
  /// the chat photo, reply header, and link preview.
  ///
  /// See [accent colors](https://core.telegram.org/bots/api#accent-colors)
  /// for more details.
  int accentColorId;

  /// The maximum number of reactions that can be set on a message in the chat
  int maxReactionCount;

  /// Chat photo
  ChatPhoto? photo;

  /// If non-empty, the list of all
  /// [active chat usernames](https://telegram.org/blog/topics-in-groups-collectible-usernames#collectible-usernames);
  /// for private chats, supergroups and channels
  List<String>? activeUsernames;

  /// For private chats, the date of birth of the user
  Birthdate? birthdate;

  /// For private chats with business accounts, the intro of the business
  BusinessIntro? businessIntro;

  /// For private chats with business accounts, the location of the business
  BusinessLocation? businessLocation;

  /// For private chats with business accounts,
  /// the opening hours of the business
  BusinessOpeningHours? businessOpeningHours;

  /// For private chats, the personal channel of the user
  Chat? personalChat;

  /// List of available reactions allowed in the chat.
  ///
  /// If omitted, then all [emoji reactions](https://core.telegram.org/bots/api#reactiontypeemoji)
  /// are allowed.
  List<ReactionType>? availableReactions;

  /// Custom emoji identifier of emoji chosen by the chat for the reply header
  /// and link preview background
  String? backgroundCustomEmojiId;

  /// Identifier of the accent color for the chat's profile background.
  /// See [profile accent colors](https://core.telegram.org/bots/api#profile-accent-colors)
  /// for more details.
  int? profileAccentColorId;

  /// Custom emoji identifier of the emoji chosen by the chat for
  /// its profile background
  String? profileBackgroundCustomEmojiId;

  /// Custom emoji identifier of emoji status of the other party in a
  /// private chat
  String? emojiStatusCustomEmojiId;

  /// Expiration date of the emoji status of the other party in a
  /// private chat, if any
  int? emojiStatusExpirationDate;

  /// Bio of the other party in a private chat
  String? bio;

  /// True, if privacy settings of the other party in the private chat allows
  /// to use `tg://user?id=<user_id>` links only in chats with the user
  bool? hasPrivateForwards;

  /// True, if the privacy settings of the other party restrict sending voice
  /// and video note messages in the private chat
  bool? hasRestrictedVoiceAndVideoMessages;

  /// True, if users need to join the supergroup before they can send messages
  bool? joinToSendMessages;

  /// True, if all users directly joining the supergroup need to be approved by
  /// supergroup administrators
  bool? joinByRequest;

  /// Description, for groups, supergroups and channel chats
  String? description;

  /// Primary invite link, for groups, supergroups and channel chats
  String? inviteLink;

  /// The most recent pinned message (by sending date)
  Message? pinnedMessage;

  /// Default chat member permissions, for groups and supergroups
  ChatPermissions? permissions;

  /// True, if paid media messages can be sent or forwarded to the channel chat.
  ///
  /// The field is available only for channel chats.
  bool? canSendPaidMedia;

  /// For supergroups, the minimum allowed delay between consecutive messages
  /// sent by each unpriviledged user; in seconds
  int? slowModeDelay;

  /// For supergroups, the minimum number of boosts that a non-administrator
  /// user needs to add in order to ignore slow mode and chat permissions
  int? unrestrictBoostCount;

  /// The time after which all messages sent to the chat will be automatically
  /// deleted; in seconds
  int? messageAutoDeleteTime;

  /// True, if aggressive anti-spam checks are enabled in the supergroup.
  ///
  /// The field is only available to chat administrators.
  bool? hasAggressiveAntiSpamEnabled;

  /// True, if non-administrators can only get the list of bots and
  /// administrators in the chat
  bool? hasHiddenMembers;

  /// True, if messages from the chat can't be forwarded to other chats
  bool? hasProtectedContent;

  /// True, if new chat members will have access to old messages;
  /// available only to chat administrators
  bool? hasVisibleHistory;

  /// For supergroups, name of group sticker set
  String? stickerSetName;

  /// True, if the bot can change the group sticker set
  bool? canSetStickerSet;

  /// For supergroups, the name of the group's custom emoji sticker set.
  ///
  /// Custom emoji from this set can be used by all users and bots in the group.
  String? customEmojiStickerSetName;

  /// Unique identifier for the linked chat, i.e. the discussion group
  /// identifier for a channel and vice versa;
  /// for supergroups and channel chats.
  ///
  /// This identifier may be greater than 32 bits and some programming languages
  /// may have difficulty/silent defects in interpreting it.
  ///
  /// But it is smaller than 52 bits, so a signed 64 bit integer or
  /// double-precision float type are safe for storing this identifier.
  int? linkedChatId;

  /// For supergroups, the location to which the supergroup is connected
  ChatLocation? location;

  /// Basic constructor
  ChatFullInfo({
    required this.id,
    required this.type,
    required this.accentColorId,
    required this.maxReactionCount,
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.isForum,
    this.photo,
    this.activeUsernames,
    this.birthdate,
    this.businessIntro,
    this.businessLocation,
    this.businessOpeningHours,
    this.personalChat,
    this.availableReactions,
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
    this.canSendPaidMedia,
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

  /// Creates an object from a json
  factory ChatFullInfo.fromJson(Map<String, dynamic> json) {
    return ChatFullInfo(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isForum: json['is_forum'],
      accentColorId: json['accent_color_id'],
      maxReactionCount: json['max_reaction_count'],
      photo: callIfNotNull(ChatPhoto.fromJson, json['photo']),
      activeUsernames: List.from(json['active_usernames'] ?? []),
      birthdate: callIfNotNull(Birthdate.fromJson, json['birthdate']),
      businessIntro: callIfNotNull(
        BusinessIntro.fromJson,
        json['business_intro'],
      ),
      businessLocation: callIfNotNull(
        BusinessLocation.fromJson,
        json['business_location'],
      ),
      businessOpeningHours: callIfNotNull(
        BusinessOpeningHours.fromJson,
        json['business_opening_hours'],
      ),
      personalChat: callIfNotNull(Chat.fromJson, json['personal_chat']),
      availableReactions: callIfNotNull(
        ReactionType.listFromJsonArray,
        json['available_reactions'],
      ),
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
      canSendPaidMedia: json['can_send_paid_media'],
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

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'is_forum': isForum,
      'accent_color_id': accentColorId,
      'max_reaction_count': maxReactionCount,
      'photo': photo,
      'active_usernames': activeUsernames,
      'birthdate': birthdate,
      'business_intro': businessIntro,
      'business_location': businessLocation,
      'business_opening_hours': businessOpeningHours,
      'personal_chat': personalChat,
      'available_reactions': availableReactions,
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
      'can_send_paid_media': canSendPaidMedia,
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
