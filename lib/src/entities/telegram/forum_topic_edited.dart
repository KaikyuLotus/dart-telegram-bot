import 'dart:convert';

/// This object represents a service message about an edited forum topic.
class ForumTopicEdited {
  /// Optional.
  /// New name of the topic, if it was edited
  String? name;

  /// Optional.
  /// New identifier of the custom emoji shown as the topic icon,
  /// if it was edited; an empty string if the icon was removed
  String? iconCustomEmojiId;

  /// Basic constructor
  ForumTopicEdited({
    this.name,
    this.iconCustomEmojiId,
  });

  /// Creates a object from a json
  static ForumTopicEdited fromJson(Map<String, dynamic> json) {
    return ForumTopicEdited(
      name: json['name'],
      iconCustomEmojiId: json['icon_custom_emoji_id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'name': name,
      'icon_custom_emoji_id': iconCustomEmojiId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
