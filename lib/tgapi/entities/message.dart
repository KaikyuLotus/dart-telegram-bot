import 'package:dart_telegram_bot/tgapi/entities/animation.dart';
import 'package:dart_telegram_bot/tgapi/entities/audio.dart';
import 'package:dart_telegram_bot/tgapi/entities/chat.dart';
import 'package:dart_telegram_bot/tgapi/entities/document.dart';
import 'package:dart_telegram_bot/tgapi/entities/photo_size.dart';
import 'package:dart_telegram_bot/tgapi/entities/user.dart';
import 'package:dart_telegram_bot/tgapi/entities/video.dart';
import 'package:dart_telegram_bot/tgapi/entities/voice.dart';

import 'sticker.dart';

class Message {
  int messageId;
  int date;
  User from;
  Chat chat;
  Sticker sticker;
  List<PhotoSize> photo;
  Audio audio;
  Document document;
  Video video;
  Animation animation;
  Voice voice;
  String text;

  Message(
      {this.chat,
      this.date,
      this.from,
      this.messageId,
      this.sticker,
      this.photo,
      this.audio,
      this.document,
      this.video,
      this.animation,
      this.voice,
      this.text});

  factory Message.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Message(
      chat: Chat.fromJson(json['chat']),
      from: User.fromJson(json['from']),
      date: json['date'],
      messageId: json['message_id'],
      sticker: Sticker.fromJson(json['sticker']),
      photo: PhotoSize.listFromJsonArray(json['photo']),
      audio: Audio.fromJson(json['audio']),
      document: Document.fromJson(json['document']),
      video: Video.fromJson(json['video']),
      animation: Animation.fromJson(json['animation']),
      voice: Voice.fromJson(json['voice']),
      text: json['text'],
    );
  }
}
