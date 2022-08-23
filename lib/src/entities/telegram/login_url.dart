import 'dart:convert';

/// This object represents a parameter of the inline keyboard button used to
/// automatically authorize a user. Serves as a great replacement for the
/// Telegram Login Widget when the user is coming from Telegram.
/// All the user needs to do is tap/click a button and confirm that they want
/// to log in
class LoginUrl {
  /// An HTTPS URL to be opened with user authorization data added to the query
  /// string when the button is pressed. If the user refuses to provide
  /// authorization data, the original URL without information about the user
  /// will be opened.
  /// The data added is the same as described in Receiving authorization data.
  String url;

  /// Optional.
  /// New text of the button in forwarded messages.
  String? forwardText;

  /// Optional.
  /// Username of a bot, which will be used for user authorization.
  /// See Setting up a bot for more details. If not specified, the current
  /// bot's username will be assumed.
  /// The url's domain must be the same as the domain linked with the bot.
  /// See Linking your domain to the bot for more details.
  String? botUsername;

  /// Optional.
  /// Pass True to request the permission for your bot to send messages to the
  /// user.
  bool? requestWriteAccess;

  /// Basic constructor
  LoginUrl({
    required this.url,
    this.forwardText,
    this.botUsername,
    this.requestWriteAccess,
  });

  /// Creates a object from a json
  static LoginUrl fromJson(Map<String, dynamic> json) {
    return LoginUrl(
      url: json['url']!,
      forwardText: json['forward_text'],
      botUsername: json['bot_username'],
      requestWriteAccess: json['request_write_access'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'url': url,
      'forward_text': forwardText,
      'bot_username': botUsername,
      'request_write_access': requestWriteAccess,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
