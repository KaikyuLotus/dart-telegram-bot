import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class CallbackQuery {
  String id;
  User from;
  Message? message;
  String? inlineMessageId;
  String chatInstance;
  String? data;
  String? gameShortName;

  CallbackQuery({
    required this.id,
    required this.from,
    this.message,
    this.inlineMessageId,
    required this.chatInstance,
    this.data,
    this.gameShortName,
  });

  static CallbackQuery fromJson(Map<String, dynamic> json) {
    return CallbackQuery(
      id: json['id']!,
      from: User.fromJson(json['from']!),
      message: callIfNotNull(Message.fromJson, json['message']),
      inlineMessageId: json['inline_message_id'],
      chatInstance: json['chat_instance'],
      data: json['data'],
      gameShortName: json['game_short_name'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'from': from,
      'message': message,
      'inline_message_id': inlineMessageId,
      'chat_instance': chatInstance,
      'data': data,
      'game_short_name': gameShortName,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
