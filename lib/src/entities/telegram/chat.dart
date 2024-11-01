import 'dart:convert';

/// This object represents a chat.
class Chat {
  /// Unique identifier for this chat.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int id;

  /// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
  String type;

  /// Optional.
  /// Title, for supergroups, channels and group chats
  String? title;

  /// Optional.
  /// Username, for private chats, supergroups and channels if available
  String? username;

  /// Optional.
  /// First name of the other party in a private chat
  String? firstName;

  /// Optional.
  /// Last name of the other party in a private chat
  String? lastName;

  /// Optional.
  /// True if the supergroup chat is a forum (has topics enabled)
  bool? isForum;

  /// Basic constructor
  Chat({
    required this.id,
    required this.type,
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.isForum,
  });

  /// Creates a object from a json
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id']!,
      type: json['type']!,
      title: json['title'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isForum: json['is_forum'],
    );
  }

  /// Creates a list of object from a json array
  static List<Chat> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => Chat.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'is_forum': isForum,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
