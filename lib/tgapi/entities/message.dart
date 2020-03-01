import 'package:dart_telegram_bot/tgapi/entities/chat.dart';
import 'package:dart_telegram_bot/tgapi/entities/photo_size.dart';
import 'package:dart_telegram_bot/tgapi/entities/user.dart';

import 'sticker.dart';

class Message {
  int messageId;
  int date;
  User from;
  Chat chat;
  Sticker sticker;
  List<PhotoSize> photo;
  String text;

  Message(
      {this.chat,
      this.date,
      this.from,
      this.messageId,
      this.sticker,
      this.photo,
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
      text: json['text'],
    );
  }
}
