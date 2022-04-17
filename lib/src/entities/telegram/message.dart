import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class Message {
  int messageId;
  User? from;
  Chat? senderChat;
  int date;
  Chat chat;
  User? forwardFrom;
  Chat? forwardFromChat;
  int? forwardFromMessageId;
  String? forwardSignature;
  String? forwardSenderName;
  int? forwardDate;
  bool? isAutomaticForward;
  Message? replyToMessage;
  User? viaBot;
  int? editDate;
  bool? hasProtectedContent;
  String? mediaGroupId;
  String? authorSignature;
  String? text;
  List<MessageEntity>? entities;
  Animation? animation;
  Audio? audio;
  Document? document;
  List<PhotoSize>? photo;
  Sticker? sticker;
  Video? video;
  VideoNote? videoNote;
  Voice? voice;
  String? caption;
  List<MessageEntity>? captionEntities;
  Contact? contact;
  Dice? dice;
  Game? game;
  Poll? poll;
  Venue? venue;
  Location? location;
  List<User>? newChatMembers;
  User? leftChatMember;
  String? newChatTitle;
  List<PhotoSize>? newChatPhoto;
  bool? deleteChatPhoto;
  bool? groupChatCreated;
  bool? supergroupChatCreated;
  bool? channelChatCreated;
  MessageAutoDeleteTimerChanged? messageAutoDeleteTimerChanged;
  int? migrateToChatId;
  int? migrateFromChatId;
  Message? pinnedMessage;
  Invoice? invoice;
  SuccessfulPayment? successfulPayment;
  String? connectedWebsite;
  PassportData? passportData;
  ProximityAlertTriggered? proximityAlertTriggered;
  VideoChatScheduled? videoChatScheduled;
  VideoChatStarted? videoChatStarted;
  VideoChatEnded? videoChatEnded;
  VideoChatParticipantsInvited? videoChatParticipantsInvited;
  WebAppData? webAppData;
  ReplyMarkup? replyMarkup;

  Message({
    required this.messageId,
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
    this.video,
    this.videoNote,
    this.voice,
    this.caption,
    this.captionEntities,
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
    this.connectedWebsite,
    this.passportData,
    this.proximityAlertTriggered,
    this.videoChatScheduled,
    this.videoChatStarted,
    this.videoChatEnded,
    this.videoChatParticipantsInvited,
    this.webAppData,
    this.replyMarkup,
  });

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['message_id']!,
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
      video: callIfNotNull(Video.fromJson, json['video']),
      videoNote: callIfNotNull(VideoNote.fromJson, json['video_note']),
      voice: callIfNotNull(Voice.fromJson, json['voice']),
      caption: json['caption'],
      captionEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['caption_entities'],
      ),
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
      connectedWebsite: json['connected_website'],
      passportData: callIfNotNull(
        PassportData.fromJson,
        json['passport_data'],
      ),
      proximityAlertTriggered: callIfNotNull(
        ProximityAlertTriggered.fromJson,
        json['proximity_alert_triggered'],
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

  static List<Message> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => Message.fromJson(array[i]),
    );
  }

  Map toJson() {
    return {
      'message_id': messageId,
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
      'video': video,
      'video_note': videoNote,
      'voice': voice,
      'caption': caption,
      'captionEntities': captionEntities,
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
      'connected_website': connectedWebsite,
      'passport_data': passportData,
      'proximity_alert_triggered': proximityAlertTriggered,
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
