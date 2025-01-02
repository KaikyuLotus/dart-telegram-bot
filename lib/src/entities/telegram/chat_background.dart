import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents a chat background.
class ChatBackground {
  /// Type of the background
  BackgroundType type;

  /// Basic constructor
  ChatBackground({
    required this.type,
  });

  /// Creates an object from a json
  factory ChatBackground.fromJson(Map<String, dynamic> json) {
    return ChatBackground(
      type: BackgroundType.fromJson(json['type']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
