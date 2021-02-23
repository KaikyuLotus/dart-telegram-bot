import 'package:dart_telegram_bot/telegram_entities.dart';

class CallbackQuery {
  String id;
  User from;
  Message message;
  String inlineMessageId;
  String chatInstance;
  String data;
  String gameShortName;

  CallbackQuery({
    this.id,
    this.from,
    this.message,
    this.inlineMessageId,
    this.chatInstance,
    this.data,
    this.gameShortName,
  });

  factory CallbackQuery.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return CallbackQuery(
      id: json['id'],
      from: User.fromJson(json['from']),
      message: Message.fromJson(json['message']),
      inlineMessageId: json['inline_message_id'],
      chatInstance: json['chat_instance'],
      data: json['data'],
      gameShortName: json['game_short_name'],
    );
  }
}
