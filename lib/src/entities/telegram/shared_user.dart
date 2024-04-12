import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about a user that was shared with the bot
/// using a KeyboardButtonRequestUser button.
class SharedUser {
  /// Identifier of the shared user.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so 64-bit integers or
  /// double-precision float types are safe for storing these identifiers.
  /// The bot may not have access to the user and could be unable to use this
  /// identifier, unless the user is already known to the bot by some other
  /// means.
  int userId;

  /// Optional.
  /// First name of the user, if the name was requested by the bot
  String? firstName;

  /// Optional.
  /// Last name of the user, if the name was requested by the bot
  String? lastName;

  /// Optional.
  /// Username of the user, if the username was requested by the bot
  String? username;

  /// Optional.
  /// Available sizes of the chat photo, if the photo was requested by the bot
  List<PhotoSize>? photo;

  /// Basic constructor
  SharedUser({
    required this.userId,
    this.firstName,
    this.lastName,
    this.username,
    this.photo,
  });

  /// Creates a object from a json
  factory SharedUser.fromJson(Map<String, dynamic> json) {
    return SharedUser(
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      photo: callIfNotNull(PhotoSize.listFromJsonArray, json['photo']),
    );
  }

  /// Creates a list of object from a json array
  static List<SharedUser> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => SharedUser.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'photo': photo,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
