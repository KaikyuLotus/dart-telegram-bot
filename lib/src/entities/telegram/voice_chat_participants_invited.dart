import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

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
