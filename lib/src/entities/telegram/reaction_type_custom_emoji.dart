import 'dart:convert';

import '../../../telegram_entities.dart';
import 'reaction_type.dart';

/// The message was originally sent by an unknown user.
class ReactionTypeCustomEmoji extends ReactionType {
  /// Type of the reaction, always “custom_emoji”
  @override
  String type = 'custom_emoji';

  /// Custom emoji identifier
  String customEmojiId;

  /// Basic constructor
  ReactionTypeCustomEmoji(
    this.customEmojiId,
  );

  /// Creates an object from a json
  factory ReactionTypeCustomEmoji.fromJson(Map<String, dynamic> json) {
    return ReactionTypeCustomEmoji(
      json['custom_emoji_id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'custom_emoji_id': customEmojiId,
    };
  }

  @override
  String toString() => json.encode(this);
}
