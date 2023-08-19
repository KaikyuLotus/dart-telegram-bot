import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a message.
class Message {
  /// Unique message identifier inside this chat
  int messageId;

  /// Optional.
  /// Unique identifier of a message thread to which the message belongs;
  /// for supergroups only
  int? messageThreadId;

  /// Optional.
  /// Sender of the message; empty for messages sent to channels.
  /// For backward compatibility, the field contains a fake sender user in
  /// non-channel chats, if the message was sent on behalf of a chat.
  User? from;

  /// Optional.
  /// Sender of the message, sent on behalf of a chat.
  /// For example, the channel itself for channel posts, the supergroup itself
  /// for messages from anonymous group administrators, the linked channel for
  /// messages automatically forwarded to the discussion group.
  /// For backward compatibility, the field from contains a fake sender user in
  /// non-channel chats, if the message was sent on behalf of a chat.
  Chat? senderChat;

  /// Date the message was sent in Unix time
  int date;

  /// Conversation the message belongs to
  Chat chat;

  /// Optional.
  /// For forwarded messages, sender of the original message
  User? forwardFrom;

  /// Optional.
  /// For messages forwarded from channels or from anonymous administrators,
  /// information about the original sender chat
  Chat? forwardFromChat;

  /// Optional.
  /// For messages forwarded from channels, identifier of the original
  /// message in the channel
  int? forwardFromMessageId;

  /// Optional.
  /// For forwarded messages that were originally sent in channels or by an
  /// anonymous chat administrator, signature of the message sender if present
  String? forwardSignature;

  /// Optional.
  /// Sender's name for messages forwarded from users who disallow adding a
  /// link to their account in forwarded messages
  String? forwardSenderName;

  /// Optional.
  /// For forwarded messages, date the original message was sent in Unix time
  int? forwardDate;

  /// Optional.
  /// True, if the message is sent to a forum topic
  bool? isTopicMessage;

  /// Optional.
  /// True, if the message is a channel post that was automatically forwarded
  /// to the connected discussion group
  bool? isAutomaticForward;

  /// Optional.
  /// For replies, the original message.
  /// Note that the Message object in this field will not contain further
  /// reply_to_message fields even if it itself is a reply.
  Message? replyToMessage;

  /// Optional.
  /// Bot through which the message was sent
  User? viaBot;

  /// Optional.
  /// Date the message was last edited in Unix time
  int? editDate;

  /// Optional.
  /// True, if the message can't be forwarded
  bool? hasProtectedContent;

  /// Optional.
  /// The unique identifier of a media message group this message belongs to
  String? mediaGroupId;

  /// Optional.
  /// Signature of the post author for messages in channels, or the custom
  /// title of an anonymous group administrator
  String? authorSignature;

  /// Optional.
  /// For text messages, the actual UTF-8 text of the message
  String? text;

  /// Optional.
  /// For text messages, special entities like usernames, URLs, bot commands,
  /// etc. that appear in the text
  List<MessageEntity>? entities;

  /// Optional.
  /// Message is an animation, information about the animation.
  /// For backward compatibility, when this field is set, the document fiel
  ///  will also be set
  Animation? animation;

  /// Optional.
  /// Message is an audio file, information about the file
  Audio? audio;

  /// Optional.
  /// Message is a general file, information about the file
  Document? document;

  /// Optional.
  /// Message is a photo, available sizes of the photo
  List<PhotoSize>? photo;

  /// Optional.
  /// Message is a sticker, information about the sticker
  Sticker? sticker;

  /// Optional.
  /// Message is a forwarded story
  Story? story;

  /// Optional.
  /// Message is a video, information about the video
  Video? video;

  /// Optional.
  /// Message is a video note, information about the video message
  VideoNote? videoNote;

  /// Optional.
  /// Message is a voice message, information about the file
  Voice? voice;

  /// Optional.
  /// Caption for the animation, audio, document, photo, video or voice
  String? caption;

  /// Optional.
  /// For messages with a caption, special entities like usernames, URLs,
  /// bot commands, etc. that appear in the caption
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// True, if the message media is covered by a spoiler animation
  bool? hasMediaSpoiler;

  /// Optional.
  /// Message is a shared contact, information about the contact
  Contact? contact;

  /// Optional.
  /// Message is a dice with random value
  Dice? dice;

  /// Optional.
  /// Message is a game, information about the game.
  Game? game;

  /// Optional.
  /// Message is a native poll, information about the poll
  Poll? poll;

  /// Optional.
  /// Message is a venue, information about the venue.
  /// For backward compatibility, when this field is set, the location field
  /// will also be set
  Venue? venue;

  /// Optional.
  /// Message is a shared location, information about the location
  Location? location;

  /// Optional.
  /// New members that were added to the group or supergroup and information
  /// about them (the bot itself may be one of these members)
  List<User>? newChatMembers;

  /// Optional.
  /// A member was removed from the group, information about them
  /// (this member may be the bot itself)
  User? leftChatMember;

  /// Optional.
  /// A chat title was changed to this value
  String? newChatTitle;

  /// Optional.
  /// A chat photo was change to this value
  List<PhotoSize>? newChatPhoto;

  /// Optional.
  /// Service message: the chat photo was deleted
  bool? deleteChatPhoto;

  /// Optional.
  /// Service message: the group has been created
  bool? groupChatCreated;

  /// 	Optional.
  /// Service message: the supergroup has been created.
  /// This field can't be received in a message coming through updates,
  /// because bot can't be a member of a supergroup when it is created.
  /// It can only be found in reply_to_message if someone replies to a very
  /// first message in a directly created supergroup.
  bool? supergroupChatCreated;

  /// Optional.
  /// Service message: the channel has been created.
  /// This field can't be received in a message coming through updates, because
  /// bot can't be a member of a channel when it is created.
  /// It can only be found in reply_to_message if someone replies to a very
  /// first message in a channel.
  bool? channelChatCreated;

  /// Optional.
  /// Service message: auto-delete timer settings changed in the chat
  MessageAutoDeleteTimerChanged? messageAutoDeleteTimerChanged;

  /// Optional.
  /// The group has been migrated to a supergroup with the specified identifier.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int? migrateToChatId;

  /// Optional.
  /// The supergroup has been migrated from a group with the specified
  /// identifier. This number may have more than 32 significant bits and some
  /// programming languages may have difficulty/silent defects in interpreting
  /// it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int? migrateFromChatId;

  /// Optional.
  /// Specified message was pinned.
  /// Note that the Message object in this field will not contain further
  /// reply_to_message fields even if it is itself a reply.
  Message? pinnedMessage;

  /// Optional.
  /// Message is an invoice for a payment, information about the invoice.
  Invoice? invoice;

  /// Optional.
  /// Message is a service message about a successful payment, information
  /// about the payment.
  SuccessfulPayment? successfulPayment;

  /// Optional.
  /// Service message: a user was shared with the bot
  UserShared? userShared;

  /// Optional.
  /// Service message: a chat was shared with the bot
  ChatShared? chatShared;

  /// Optional.
  /// The domain name of the website on which the user has logged in.
  String? connectedWebsite;

  /// Optional.
  /// Service message: the user allowed the bot added to the attachment
  /// menu to write messages
  WriteAccessAllowed? writeAccessAllowed;

  /// Optional.
  /// Telegram Passport data
  PassportData? passportData;

  /// Optional.
  /// Service message. A user in the chat triggered another user's proximity
  /// alert while sharing Live Location.
  ProximityAlertTriggered? proximityAlertTriggered;

  /// Optional.
  /// Service message: forum topic created
  ForumTopicCreated? forumTopicCreated;

  /// Optional.
  /// Service message: forum topic edited
  ForumTopicEdited? forumTopicEdited;

  /// Optional.
  /// Service message: forum topic closed
  ForumTopicClosed? forumTopicClosed;

  /// 	Optional.
  /// Service message: forum topic reopened
  ForumTopicReopened? forumTopicReopened;

  /// Optional.
  /// Service message: the 'General' forum topic hidden
  GeneralForumTopicHidden? generalForumTopicHidden;

  /// Optional.
  /// Service message: the 'General' forum topic unhidden
  GeneralForumTopicUnhidden? generalForumTopicUnhidden;

  /// Optional.
  /// Service message: video chat scheduled
  VideoChatScheduled? videoChatScheduled;

  /// Optional.
  /// Service message: video chat started
  VideoChatStarted? videoChatStarted;

  /// Optional.
  /// Service message: video chat ended
  VideoChatEnded? videoChatEnded;

  /// Optional.
  /// Service message: new participants invited to a video chat
  VideoChatParticipantsInvited? videoChatParticipantsInvited;

  /// Optional.
  /// Service message: data sent by a Web App
  WebAppData? webAppData;

  /// Optional.
  /// Inline keyboard attached to the message.
  /// login_url buttons are represented as ordinary url buttons.
  ReplyMarkup? replyMarkup;

  /// Basic constructor
  Message({
    required this.messageId,
    this.messageThreadId,
    this.from,
    this.senderChat,
    required this.date,
    required this.chat,
    this.forwardFrom,
    this.forwardFromChat,
    this.forwardFromMessageId,
    this.forwardSignature,
    this.forwardSenderName,
    this.forwardDate,
    this.isTopicMessage,
    this.isAutomaticForward,
    this.replyToMessage,
    this.viaBot,
    this.editDate,
    this.hasProtectedContent,
    this.mediaGroupId,
    this.authorSignature,
    this.text,
    this.entities,
    this.animation,
    this.audio,
    this.document,
    this.photo,
    this.sticker,
    this.story,
    this.video,
    this.videoNote,
    this.voice,
    this.caption,
    this.captionEntities,
    this.hasMediaSpoiler,
    this.contact,
    this.dice,
    this.game,
    this.poll,
    this.venue,
    this.location,
    this.newChatMembers,
    this.leftChatMember,
    this.newChatTitle,
    this.newChatPhoto,
    this.deleteChatPhoto,
    this.groupChatCreated,
    this.supergroupChatCreated,
    this.channelChatCreated,
    this.messageAutoDeleteTimerChanged,
    this.migrateToChatId,
    this.migrateFromChatId,
    this.pinnedMessage,
    this.invoice,
    this.successfulPayment,
    this.userShared,
    this.chatShared,
    this.connectedWebsite,
    this.passportData,
    this.proximityAlertTriggered,
    this.forumTopicCreated,
    this.forumTopicClosed,
    this.forumTopicReopened,
    this.videoChatScheduled,
    this.videoChatStarted,
    this.videoChatEnded,
    this.videoChatParticipantsInvited,
    this.webAppData,
    this.replyMarkup,
  });

  /// Creates a object from a json
  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['message_id']!,
      messageThreadId: json['message_thread_id'],
      from: callIfNotNull(User.fromJson, json['from']),
      senderChat: callIfNotNull(Chat.fromJson, json['sender_chat']),
      date: json['date']!,
      chat: Chat.fromJson(json['chat']!),
      forwardFrom: callIfNotNull(User.fromJson, json['forward_from']),
      forwardFromChat: callIfNotNull(
        Chat.fromJson,
        json['forward_from_chat'],
      ),
      forwardFromMessageId: json['forward_from_message_id'],
      forwardSignature: json['forward_signature'],
      forwardSenderName: json['forward_sender_name'],
      forwardDate: json['forward_date'],
      isTopicMessage: json['is_topic_message'],
      isAutomaticForward: json['is_automatic_forward'],
      replyToMessage: callIfNotNull(
        Message.fromJson,
        json['reply_to_message'],
      ),
      viaBot: callIfNotNull(User.fromJson, json['via_bot']),
      editDate: json['edit_date'],
      hasProtectedContent: json['has_protected_content'],
      mediaGroupId: json['media_group_id'],
      authorSignature: json['author_signature'],
      text: json['text'],
      entities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['entities'],
      ),
      animation: callIfNotNull(Animation.fromJson, json['animation']),
      audio: callIfNotNull(Audio.fromJson, json['audio']),
      document: callIfNotNull(Document.fromJson, json['document']),
      photo: callIfNotNull(PhotoSize.listFromJsonArray, json['photo']),
      sticker: callIfNotNull(Sticker.fromJson, json['sticker']),
      story: callIfNotNull(Story.fromJson, json['story']),
      video: callIfNotNull(Video.fromJson, json['video']),
      videoNote: callIfNotNull(VideoNote.fromJson, json['video_note']),
      voice: callIfNotNull(Voice.fromJson, json['voice']),
      caption: json['caption'],
      captionEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['caption_entities'],
      ),
      hasMediaSpoiler: json['has_media_spoiler'],
      contact: callIfNotNull(Contact.fromJson, json['contact']),
      dice: callIfNotNull(Dice.fromJson, json['dice']),
      game: callIfNotNull(Game.fromJson, json['game']),
      poll: callIfNotNull(Poll.fromJson, json['poll']),
      venue: callIfNotNull(Venue.fromJson, json['venue']),
      location: callIfNotNull(Location.fromJson, json['location']),
      newChatMembers: callIfNotNull(
        User.listFromJsonArray,
        json['new_chat_members'],
      ),
      leftChatMember: callIfNotNull(User.fromJson, json['left_chat_member']),
      newChatTitle: json['new_chat_title'],
      newChatPhoto: callIfNotNull(
        PhotoSize.listFromJsonArray,
        json['new_chat_photo'],
      ),
      deleteChatPhoto: json['delete_chat_photo'],
      groupChatCreated: json['group_chat_created'],
      supergroupChatCreated: json['supergroup_chat_created'],
      channelChatCreated: json['channel_chat_created'],
      messageAutoDeleteTimerChanged: callIfNotNull(
        MessageAutoDeleteTimerChanged.fromJson,
        json['message_auto_delete_timer_changed'],
      ),
      migrateToChatId: json['migrate_to_chat_id'],
      migrateFromChatId: json['migrate_from_chat_id'],
      pinnedMessage: callIfNotNull(
        Message.fromJson,
        json['pinned_message'],
      ),
      invoice: callIfNotNull(
        Invoice.fromJson,
        json['invoice'],
      ),
      successfulPayment: callIfNotNull(
        SuccessfulPayment.fromJson,
        json['successful_payment'],
      ),
      userShared: callIfNotNull(
        UserShared.fromJson,
        json['user_shared'],
      ),
      chatShared: callIfNotNull(
        ChatShared.fromJson,
        json['chat_shared'],
      ),
      connectedWebsite: json['connected_website'],
      passportData: callIfNotNull(
        PassportData.fromJson,
        json['passport_data'],
      ),
      proximityAlertTriggered: callIfNotNull(
        ProximityAlertTriggered.fromJson,
        json['proximity_alert_triggered'],
      ),
      forumTopicCreated: callIfNotNull(
        ForumTopicCreated.fromJson,
        json['forum_topic_created'],
      ),
      forumTopicClosed: callIfNotNull(
        ForumTopicClosed.fromJson,
        json['forum_topic_closed'],
      ),
      forumTopicReopened: callIfNotNull(
        ForumTopicReopened.fromJson,
        json['forum_topic_reopened'],
      ),
      videoChatScheduled: callIfNotNull(
        VideoChatScheduled.fromJson,
        json['video_chat_scheduled'],
      ),
      videoChatStarted: callIfNotNull(
        VideoChatStarted.fromJson,
        json['video_chat_started'],
      ),
      videoChatEnded: callIfNotNull(
        VideoChatEnded.fromJson,
        json['video_chat_ended'],
      ),
      videoChatParticipantsInvited: callIfNotNull(
        VideoChatParticipantsInvited.fromJson,
        json['video_chat_participants_invited'],
      ),
      webAppData: callIfNotNull(
        WebAppData.fromJson,
        json['web_app_data'],
      ),
      replyMarkup: callIfNotNull(
        InlineKeyboardMarkup.fromJson,
        json['reply_markup'],
      ),
    );
  }

  /// Creates a list of object from a json array
  static List<Message> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => Message.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'message_id': messageId,
      'message_thread_id': messageThreadId,
      'from': from,
      'sender_chat': senderChat,
      'date': date,
      'chat': chat,
      'forward_from': forwardFrom,
      'forward_from_chat': forwardFromChat,
      'forward_from_message_id': forwardFromMessageId,
      'forward_signature': forwardSignature,
      'forward_sender_name': forwardSenderName,
      'forward_date': forwardDate,
      'is_topic_message': isTopicMessage,
      'is_automatic_forward': isAutomaticForward,
      'reply_to_message': replyToMessage,
      'via_bot': viaBot,
      'edit_date': editDate,
      'has_protected_content': hasProtectedContent,
      'media_group_id': mediaGroupId,
      'author_signature': authorSignature,
      'text': text,
      'entities': entities,
      'animation': animation,
      'audio': audio,
      'document': document,
      'photo': photo,
      'sticker': sticker,
      'story': story,
      'video': video,
      'video_note': videoNote,
      'voice': voice,
      'caption': caption,
      'captionEntities': captionEntities,
      'has_media_spoiler': hasMediaSpoiler,
      'contact': contact,
      'dice': dice,
      'game': game,
      'poll': poll,
      'venue': venue,
      'location': location,
      'new_chat_members': newChatMembers,
      'left_chat_member': leftChatMember,
      'new_chat_title': newChatTitle,
      'new_chat_photo': newChatPhoto,
      'delete_chat_photo': deleteChatPhoto,
      'group_chat_created': groupChatCreated,
      'supergroup_chat_created': supergroupChatCreated,
      'channel_chat_created': channelChatCreated,
      'message_auto_delete_timer_changed': messageAutoDeleteTimerChanged,
      'migrate_to_chat_id': migrateToChatId,
      'migrate_from_chat_id': migrateFromChatId,
      'pinned_message': pinnedMessage,
      'invoice': invoice,
      'successful_payment': successfulPayment,
      'user_shared': userShared,
      'chat_shared': chatShared,
      'connected_website': connectedWebsite,
      'passport_data': passportData,
      'proximity_alert_triggered': proximityAlertTriggered,
      'forum_topic_created': forumTopicCreated,
      'forum_topic_closed': forumTopicClosed,
      'forum_topic_reopened': forumTopicReopened,
      'video_chat_scheduled': videoChatScheduled,
      'video_chat_started': videoChatStarted,
      'video_chat_ended': videoChatEnded,
      'video_chat_participants_invited': videoChatParticipantsInvited,
      'web_app_data': webAppData,
      'reply_markup': replyMarkup,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
