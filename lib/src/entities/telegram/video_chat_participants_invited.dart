import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class VideoChatParticipantsInvited {
  List<User>? users;

  VideoChatParticipantsInvited(users);

  static VideoChatParticipantsInvited fromJson(Map<String, dynamic> json) {
    return VideoChatParticipantsInvited(
      callIfNotNull(
        User.listFromJsonArray,
        json['users'],
      ),
    );
  }

  Map toJson() {
    return {
      'users': users,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
