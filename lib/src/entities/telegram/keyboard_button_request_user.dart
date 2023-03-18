import 'dart:convert';

/// This object defines the criteria used to request a suitable user.
/// The identifier of the selected user will be shared with the bot when the
/// corresponding button is pressed.
class KeyboardButtonRequestUser {
  /// Signed 32-bit identifier of the request, which will be received back in
  /// the UserShared object.
  /// Must be unique within the message
  int requestId;

  /// Optional.
  /// Pass True to request a bot, pass False to request a regular user.
  /// If not specified, no additional restrictions are applied.
  bool? userIsBot;

  /// Optional.
  /// Pass True to request a premium user, pass False to request a non-premium
  /// user. If not specified, no additional restrictions are applied.
  bool? userIsPremium;

  /// Basic constructor
  KeyboardButtonRequestUser(
    this.requestId, {
    this.userIsBot,
    this.userIsPremium,
  });

  /// Creates a object from a json
  static KeyboardButtonRequestUser fromJson(Map<String, dynamic> json) {
    return KeyboardButtonRequestUser(
      json['request_id'],
      userIsBot: json['user_is_bot'],
      userIsPremium: json['user_is_premium'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'request_id': requestId,
      'user_is_bot': userIsBot,
      'user_is_premium': userIsPremium,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
