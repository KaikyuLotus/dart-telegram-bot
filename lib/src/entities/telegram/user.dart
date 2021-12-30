import 'dart:convert';

class User {
  int id;
  bool isBot;
  String firstName;
  String? lastName;
  String? username;
  String? languageCode;
  bool? canJoinGroups;
  bool? canReadAllGroupMessages;
  bool? supportsInlineQueries;

  User({
    required this.id,
    required this.isBot,
    required this.firstName,
    this.lastName,
    this.username,
    this.languageCode,
    this.canJoinGroups,
    this.canReadAllGroupMessages,
    this.supportsInlineQueries,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']!,
      isBot: json['is_bot']!,
      firstName: json['first_name']!,
      lastName: json['last_name'],
      username: json['username'],
      languageCode: json['language_code'],
      canJoinGroups: json['can_join_groups'],
      canReadAllGroupMessages: json['can_read_all_group_messages'],
      supportsInlineQueries: json['supports_inline_queries'],
    );
  }

  static List<User> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => User.fromJson(json[i]));
  }

  Map toJson() {
    return {
      'id': id,
      'is_bot': isBot,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'language_code': languageCode,
      'can_join_groups': canJoinGroups,
      'can_read_all_group_messages': canReadAllGroupMessages,
      'supports_inline_queries': supportsInlineQueries,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
