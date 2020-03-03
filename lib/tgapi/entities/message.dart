import 'dart:html';

import 'animation.dart';
import 'audio.dart';
import 'chat.dart';
import 'contact.dart';
import 'document.dart';
import 'game.dart';
import 'inline_keyboard_markup.dart';
import 'invoice.dart';
import 'location.dart';
import 'message_entity.dart';
import 'passport_data.dart';
import 'photo_size.dart';
import 'poll.dart';
import 'sticker.dart';
import 'successful_payment.dart';
import 'user.dart';
import 'venue.dart';
import 'video.dart';
import 'video_note.dart';
import 'voice.dart';

class Message {
  int messageId;
  User from;
  int date;
  Chat chat;
  User forwardFrom;
  Chat forwardFromChat;
  int forwardFromMessageId;
  String forwardSignature;
  String forwardSenderName;
  int forwardDate;
  Message replyToMessage;
  int editDate;
  String mediaGroupId;
  String authorSignature;
  String text;
  List<MessageEntity> entities;
  List<MessageEntity> captionEntities;
  Audio audio;
  Document document;
  Animation animation;
  Game game;
  List<PhotoSize> photo;
  Sticker sticker;
  Video video;
  Voice voice;
  VideoNote videoNote;
  String caption;
  Contact contact;
  Location location;
  Venue venue;
  Poll poll;
  List<User> newChatMembers;
  User leftChatMember;
  String newChatTitle;
  List<PhotoSize> newChatPhoto;
  bool deleteChatPhoto;
  bool groupChatCreated;
  bool supergroupChatCreated;
  bool channelChatCreated;
  int migrateToChatId;
  int migrateFromChatId;
  Message pinnedMessage;
  Invoice invoice;
  SuccessfulPayment successfulPayment;
  String connectedWebsite;
  PassportData passportData;
  InlineKeyboardMarkup replyMarkup;

  Message(
      {this.messageId,
      this.from,
      this.date,
      this.chat,
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
      this.migrateToChatId,
      this.migrateFromChatId,
      this.pinnedMessage,
      this.invoice,
      this.successfulPayment,
      this.connectedWebsite,
      this.passportData,
      this.replyMarkup});

  factory Message.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Message(
        messageId: json['message_id'],
        from: User.fromJson(json['from']),
        date: json['date'],
        chat: Chat.fromJson(json['chat']),
        forwardFrom: User.fromJson(json['forward_from']),
        forwardFromChat: Chat.fromJson(json['forward_from_chat']),
        forwardFromMessageId: json['forward_from_message_id'],
        forwardSignature: json['forward_signature'],
        forwardSenderName: json['forward_sender_name'],
        forwardDate: json['forward_date'],
        replyToMessage: json['reply_to_message'],
        editDate: json['edit_date'],
        mediaGroupId: json['media_group_id'],
        authorSignature: json['author_signature'],
        text: json['text'],
        entities: MessageEntity.listFromJsonArray(json['entities']),
        captionEntities: MessageEntity.listFromJsonArray(json['caption_entities']),
        audio: Audio.fromJson(json['audio']),
        document: Document.fromJson(json['document']),
        animation: Animation.fromJson(json['animation']),
        game: Game.fromJson(json['game']),
        photo: PhotoSize.listFromJsonArray(json['photo']),
        sticker: Sticker.fromJson(json['sticker']),
        video: Video.fromJson(json['video']),
        voice: Voice.fromJson(json['voice']),
        videoNote: VideoNote.fromJson(json['video_note']),
        caption: json['caption'],
        contact: Contact.fromJson(json['contact']),
        location: Location.fromJson(json['location']),
        venue: Venue.fromJson(json['venue']),
        poll: Poll.fromJson(json['poll']),
        newChatMembers: User.listFromJsonArray(json['new_chat_members']),
        leftChatMember: User.fromJson(json['left_chat_member']),
        newChatTitle: json['new_chat_title'],
        newChatPhoto: PhotoSize.listFromJsonArray(json['new_chat_photo']),
        deleteChatPhoto: json['delete_chat_photo'],
        groupChatCreated: json['group_chat_created'],
        supergroupChatCreated: json['supergroup_chat_created'],
        channelChatCreated: json['channel_chat_created'],
        migrateToChatId: json['migrate_to_chat_id'],
        migrateFromChatId: json['migrate_from_chat_id'],
        pinnedMessage: Message.fromJson(json['pinned_message']),
        invoice: Invoice.fromJson(json['invoice']),
        successfulPayment: SuccessfulPayment.fromJson(json['successful_payment']),
        connectedWebsite: json['connected_website'],
        passportData: PassportData.fromJson(json['passport_data']),
        replyMarkup: InlineKeyboardMarkup.fromJson(json['reply_markup']));
  }
}
