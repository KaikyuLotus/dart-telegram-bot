part of '../../entities.dart';

class MessageEntity {
  String type;
  int offset;
  int length;
  String url;
  User user;
  String language;

  MessageEntity({this.type, this.offset, this.length, this.url, this.user, this.language});

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return MessageEntity(
        type: json['type'],
        offset: json['offset'],
        length: json['length'],
        url: json['url'],
        user: User.fromJson(json['user']),
        language: json['language']);
  }

  static List<MessageEntity> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => MessageEntity.fromJson(json[i]));
  }
}
