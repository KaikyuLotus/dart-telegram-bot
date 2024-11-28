import 'dart:convert';

import '../../../telegram_entities.dart';
import 'reaction_type.dart';

/// The message was originally sent by an unknown user.
class ReactionTypeEmoji extends ReactionType {
  /// Type of the reaction, always “emoji”
  @override
  String type = 'emoji';

  //TODO: Create emoji enum
  /// Reaction emoji.
  /// Currently, it can be one of:
  /// "👍", "👎", "❤", "🔥", "🥰", "👏", "😁","🤔", "🤯", "😱", "🤬",
  /// "😢", "🎉", "🤩", "🤮", "💩", "🙏", "👌", "🕊", "🤡", "🥱", "🥴",
  /// "😍", "🐳", "❤‍🔥", "🌚", "🌭", "💯", "🤣", "⚡", "🍌", "🏆", "💔",
  /// "🤨", "😐", "🍓", "🍾", "💋", "🖕", "😈", "😴", "😭", "🤓", "👻",
  /// "👨‍💻", "👀", "🎃", "🙈", "😇", "😨", "🤝", "✍", "🤗", "🫡", "🎅",
  /// "🎄", "☃", "💅", "🤪", "🗿", "🆒", "💘", "🙉", "🦄", "😘", "💊",
  /// "🙊", "😎", "👾", "🤷‍♂", "🤷", "🤷‍♀", "😡"
  String emoji;

  /// Basic constructor
  ReactionTypeEmoji(
    this.emoji,
  );

  /// Creates an object from a json
  factory ReactionTypeEmoji.fromJson(Map<String, dynamic> json) {
    return ReactionTypeEmoji(
      json['emoji'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'emoji': emoji,
    };
  }

  @override
  String toString() => json.encode(this);
}
