import 'dart:convert';

/// This object represents an inline button that switches the current user to
/// inline mode in a chosen chat, with an optional default inline query.
class SwitchInlineQueryChosenChat {
  /// Optional.
  /// The default inline query to be inserted in the input field.
  /// If left empty, only the bot's username will be inserted
  String? query;

  /// Optional.
  /// True, if private chats with users can be chosen
  bool? allowUserChats;

  /// Optional.
  /// True, if private chats with bots can be chosen
  bool? allowBotChats;

  /// Optional.
  /// True, if group and supergroup chats can be chosen
  bool? allowGroupChats;

  /// Optional.
  /// True, if channel chats can be chosen
  bool? allowChannelChats;

  /// Basic constructor
  SwitchInlineQueryChosenChat({
    this.query,
    this.allowUserChats,
    this.allowBotChats,
    this.allowGroupChats,
    this.allowChannelChats,
  });

  /// Creates a object from a json
  static SwitchInlineQueryChosenChat fromJson(Map<String, dynamic> json) {
    return SwitchInlineQueryChosenChat(
      query: json['query'],
      allowUserChats: json['allow_user_chats'],
      allowBotChats: json['allow_bot_chats'],
      allowGroupChats: json['allow_group_chats'],
      allowChannelChats: json['allow_channel_chats'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'query': query,
      'allow_user_chats': allowUserChats,
      'allow_bot_chats': allowBotChats,
      'allow_group_chats': allowGroupChats,
      'allow_channel_chats': allowChannelChats,
    };
  }

  @override
  String toString() => json.encode(this);
}
