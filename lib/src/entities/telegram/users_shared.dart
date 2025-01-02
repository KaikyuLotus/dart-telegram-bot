import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object contains information about the users whose identifiers were
/// shared with the bot using a KeyboardButtonRequestUsers button.
class UsersShared {
  /// Identifier of the request
  int requestId;

  /// Information about users shared with the bot.
  List<SharedUser> users;

  /// Basic constructor
  UsersShared({
    required this.requestId,
    required this.users,
  });

  /// Creates an object from a json
  factory UsersShared.fromJson(Map<String, dynamic> json) {
    return UsersShared(
      requestId: json['request_id'],
      users: SharedUser.listFromJsonArray(json['users']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'users': users,
    };
  }

  @override
  String toString() => json.encode(this);
}
