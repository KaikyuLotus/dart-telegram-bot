import 'dart:convert';

import '../../../telegram_entities.dart';

/// Upon receiving a message with this object, Telegram clients will display a
/// reply interface to the user (act as if the user has selected the bot's
/// message and tapped 'Reply').
///
/// This can be extremely useful if you want to create user-friendly
/// step-by-step interfaces without having to sacrifice
/// [privacy mode](https://core.telegram.org/bots/features#privacy-mode).
///
/// Not supported in channels and for messages sent on behalf of a Telegram
/// Business account.
class ForceReply extends ReplyMarkup {
  /// Shows reply interface to the user, as if they manually selected the bot's
  /// message and tapped 'Reply'
  bool forceReply = true;

  /// The placeholder to be shown in the input field when the reply is active;
  /// 1-64 characters
  String? inputFieldPlaceholder;

  /// Use this parameter if you want to force reply from specific users only.
  ///
  /// Targets:
  /// 1) users that are @mentioned in the text of the [Message] object;
  /// 2) if the bot's message is a reply to a message in the same chat and
  /// forum topic, sender of the original message.
  bool? selective;

  /// Basic constructor
  ForceReply({
    this.inputFieldPlaceholder,
    this.selective,
  });

  /// Creates an object from a json
  factory ForceReply.fromJson(Map<String, dynamic> json) {
    return ForceReply(
      inputFieldPlaceholder: json['input_field_placeholder'],
      selective: json['selective'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'force_reply': forceReply,
      'input_field_placeholder': inputFieldPlaceholder,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
