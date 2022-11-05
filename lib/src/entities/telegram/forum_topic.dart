import 'dart:convert';

/// This object represents a forum topic.
class ForumTopic {
  /// Unique identifier of the forum topic
  int messageThreadId;

  /// Name of the topic
  String name;

  /// Color of the topic icon in RGB format
  String iconColor;

  /// Optional.
  /// Unique identifier of the custom emoji shown as the topic icon
  String? iconCustomEmojiId;

  /// Basic constructor
  ForumTopic(
    this.messageThreadId,
    this.name,
    this.iconColor,
    this.iconCustomEmojiId,
  );

  static ForumTopic fromJson(Map<String, dynamic> json) {
    return ForumTopic(
      json['message_thread_id'],
      json['name'],
      json['icon_color'],
      json['icon_custom_emoji_id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'message_thread_id': messageThreadId,
      'name': name,
      'icon_color': iconColor,
      'icon_custom_emoji_id': iconCustomEmojiId,
    };
  }

  @override
  String toString() => json.encode(this);
}
