import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class VoiceChatParticipantsInvited {
  List<User>? users;

  VoiceChatParticipantsInvited(users);

  static VoiceChatParticipantsInvited fromJson(Map<String, dynamic> json) {
    return VoiceChatParticipantsInvited(
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
