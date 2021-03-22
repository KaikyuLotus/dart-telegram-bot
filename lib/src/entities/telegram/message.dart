import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

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
  Message? replyToMessage;
  User? viaBot;
  int? editDate;
  String? mediaGroupId;
  String? authorSignature;
  String? text;
  List<MessageEntity>? entities;
  List<MessageEntity>? captionEntities;
  Audio? audio;
  Document? document;
  Animation? animation;
  List<PhotoSize>? photo;
  Game? game;
  Sticker? sticker;
  Video? video;
  Voice? voice;
  VideoNote? videoNote;
  String? caption;
  Contact? contact;
  Location? location;
  Venue? venue;
  Poll? poll;
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
  ReplyMarkup? replyMarkup;

  Message({
    required this.messageId,
    this.from,
    required this.date,
    required this.chat,
    this.forwardFrom,
    this.forwardFromChat,
    this.forwardFromMessageId,
    this.forwardSignature,
    this.forwardSenderName,
    this.forwardDate,
    this.replyToMessage,
    this.editDate,
    this.mediaGroupId,
    this.authorSignature,
    this.text,
    this.entities,
    this.captionEntities,
    this.audio,
    this.document,
    this.animation,
    this.game,
    this.photo,
    this.sticker,
    this.video,
    this.voice,
    this.videoNote,
    this.caption,
    this.contact,
    this.location,
    this.venue,
    this.poll,
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
    this.replyMarkup,
  });

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['message_id']!,
      from: callIfNotNull(User.fromJson, json['from']),
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
      replyToMessage: callIfNotNull(
        Message.fromJson,
        json['reply_to_message'],
      ),
      editDate: json['edit_date'],
      mediaGroupId: json['media_group_id'],
      authorSignature: json['author_signature'],
      text: json['text'],
      entities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['entities'],
      ),
      captionEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['caption_entities'],
      ),
      audio: callIfNotNull(Audio.fromJson, json['audio']),
      document: callIfNotNull(Document.fromJson, json['document']),
      animation: callIfNotNull(Animation.fromJson, json['animation']),
      game: callIfNotNull(Game.fromJson, json['game']),
      photo: callIfNotNull(PhotoSize.listFromJsonArray, json['photo']),
      sticker: callIfNotNull(Sticker.fromJson, json['sticker']),
      video: callIfNotNull(Video.fromJson, json['video']),
      voice: callIfNotNull(Voice.fromJson, json['voice']),
      videoNote: callIfNotNull(VideoNote.fromJson, json['video_note']),
      caption: json['caption'],
      contact: callIfNotNull(Contact.fromJson, json['contact']),
      location: callIfNotNull(Location.fromJson, json['location']),
      venue: callIfNotNull(Venue.fromJson, json['venue']),
      poll: callIfNotNull(Poll.fromJson, json['poll']),
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
      'date': date,
      'chat': chat,
      'forward_from': forwardFrom,
      'forward_from_chat': forwardFromChat,
      'forward_from_message_id': forwardFromMessageId,
      'forward_signature': forwardSignature,
      'forward_sender_name': forwardSenderName,
      'forward_date': forwardDate,
      'reply_to_message': replyToMessage,
      'edit_date': editDate,
      'media_group_id': mediaGroupId,
      'author_signature': authorSignature,
      'text': text,
      'entities': entities,
      'caption_entities': captionEntities,
      'audio': audio,
      'document': document,
      'animation': animation,
      'game': game,
      'photo': photo,
      'sticker': sticker,
      'video': video,
      'voice': voice,
      'video_note': videoNote,
      'caption': caption,
      'contact': contact,
      'location': location,
      'venue': venue,
      'poll': poll,
      'new_chat_members': newChatMembers,
      'left_chat_member': leftChatMember,
      'new_chat_title': newChatTitle,
      'new_chat_photo': newChatPhoto,
      'delete_chat_photo': deleteChatPhoto,
      'group_chat_created': groupChatCreated,
      'supergroup_chat_created': supergroupChatCreated,
      'channel_chat_created': channelChatCreated,
      'migrate_to_chat_id': migrateToChatId,
      'migrate_from_chat_id': migrateFromChatId,
      'pinned_message': pinnedMessage,
      'invoice': invoice,
      'successful_payment': successfulPayment,
      'connected_website': connectedWebsite,
      'passport_data': passportData,
      'reply_markup': replyMarkup,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
