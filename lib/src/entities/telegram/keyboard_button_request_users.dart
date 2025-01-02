import 'dart:convert';

/// This object defines the criteria used to request a suitable user.
/// The identifier of the selected user will be shared with the bot when the
/// corresponding button is pressed.
class KeyboardButtonRequestUsers {
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
  /// user.
  /// If not specified, no additional restrictions are applied.
  bool? userIsPremium;

  /// Optional.
  /// The maximum number of users to be selected; 1-10.
  /// Defaults to 1.
  int? maxQuantity;

  /// Optional.
  /// Pass True to request the users' first and last names
  bool? requestName;

  /// Optional.
  /// Pass True to request the users' usernames
  bool? requestUsername;

  /// Optional.
  /// Pass True to request the users' photos
  bool? requestPhoto;

  /// Basic constructor
  KeyboardButtonRequestUsers(
    this.requestId, {
    this.userIsBot,
    this.userIsPremium,
    this.maxQuantity,
    this.requestName,
    this.requestUsername,
    this.requestPhoto,
  });

  /// Creates an object from a json
  factory KeyboardButtonRequestUsers.fromJson(Map<String, dynamic> json) {
    return KeyboardButtonRequestUsers(
      json['request_id'],
      userIsBot: json['user_is_bot'],
      userIsPremium: json['user_is_premium'],
      maxQuantity: json['max_quantity'],
      requestName: json['request_name'],
      requestUsername: json['request_username'],
      requestPhoto: json['request_photo'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'user_is_bot': userIsBot,
      'user_is_premium': userIsPremium,
      'max_quantity': maxQuantity,
      'request_name': requestName,
      'request_username': requestUsername,
      'request_photo': requestPhoto,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
