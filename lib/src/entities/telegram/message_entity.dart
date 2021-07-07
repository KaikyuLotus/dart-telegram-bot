import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class MessageEntity {
  String type;
  int offset;
  int length;
  String? url;
  User? user;
  String? language;

  MessageEntity({
    required this.type,
    required this.offset,
    required this.length,
    this.url,
    this.user,
    this.language,
  });

  static MessageEntity fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      type: json['type']!,
      offset: json['offset']!,
      length: json['length']!,
      url: json['url'],
      user: callIfNotNull(User.fromJson, json['user']),
      language: json['language'],
    );
  }

  static List<MessageEntity> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => MessageEntity.fromJson(json[i]),
    );
  }

  Map toJson() {
    return {
      'type': type,
      'offset': offset,
      'length': length,
      'url': url,
      'user': user,
      'language': language,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
