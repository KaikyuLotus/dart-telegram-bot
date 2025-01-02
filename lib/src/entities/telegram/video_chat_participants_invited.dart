import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a service message about new members invited to a
/// video chat.
class VideoChatParticipantsInvited {
  /// New members that were invited to the video chat
  List<User>? users;

  /// Basic constructor
  VideoChatParticipantsInvited(this.users);

  /// Creates an object from a json
  factory VideoChatParticipantsInvited.fromJson(Map<String, dynamic> json) {
    return VideoChatParticipantsInvited(
      callIfNotNull(
        User.listFromJsonArray,
        json['users'],
      ),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'users': users,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
