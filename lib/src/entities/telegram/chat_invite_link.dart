import 'dart:convert';

import '../../../telegram_entities.dart';

class ChatInviteLink {
  String inviteLink;
  User creator;
  bool isPrimary;
  bool isRevoked;
  int? expireDate;
  int? memberLimit;

  ChatInviteLink({
    required this.inviteLink,
    required this.creator,
    required this.isPrimary,
    required this.isRevoked,
    this.expireDate,
    this.memberLimit,
  });

  static ChatInviteLink fromJson(Map<String, dynamic> json) {
    return ChatInviteLink(
      inviteLink: json['invite_link']!,
      creator: json['creator']!,
      isPrimary: json['is_primary']!,
      isRevoked: json['is_revoked']!,
      expireDate: json['expire_date'],
      memberLimit: json['member_limit'],
    );
  }

  Map toJson() {
    return {
      'invite_link': inviteLink,
      'creator': creator,
      'is_primary': isPrimary,
      'is_revoked': isRevoked,
      'expire_date': expireDate,
      'member_limit': memberLimit,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
