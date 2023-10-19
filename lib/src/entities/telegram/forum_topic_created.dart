import 'dart:convert';

/// This object represents a service message about a new forum topic created
/// in the chat.
class ForumTopicCreated {
  /// Name of the topic
  String name;

  /// Color of the topic icon in RGB format
  int iconColor;

  /// Optional.
  /// Unique identifier of the custom emoji shown as the topic icon
  String? iconCustomEmojiId;

  /// Basic constructor
  ForumTopicCreated({
    required this.name,
    required this.iconColor,
    this.iconCustomEmojiId,
  });

  /// Creates a object from a json
  static ForumTopicCreated fromJson(Map<String, dynamic> json) {
    return ForumTopicCreated(
      name: json['name'],
      iconColor: json['icon_color'],
      iconCustomEmojiId: json['icon_custom_emoji_id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'name': name,
      'icon_color': iconColor,
      'icon_custom_emoji_id': iconCustomEmojiId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
