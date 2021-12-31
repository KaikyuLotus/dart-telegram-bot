import 'dart:convert';

import '../../../telegram_entities.dart';

class ChatInviteLink {
  String inviteLink;
  User creator;
  bool createsJoinRequest;
  bool isPrimary;
  bool isRevoked;
  String? name;
  int? expireDate;
  int? memberLimit;
  int? pendingJoinRequestCount;

  ChatInviteLink({
    required this.inviteLink,
    required this.creator,
    required this.createsJoinRequest,
    required this.isPrimary,
    required this.isRevoked,
    this.name,
    this.expireDate,
    this.memberLimit,
    this.pendingJoinRequestCount,
  });

  static ChatInviteLink fromJson(Map<String, dynamic> json) {
    return ChatInviteLink(
      inviteLink: json['invite_link']!,
      creator: User.fromJson(json['creator']!),
      createsJoinRequest: json['creates_join_request']!,
      isPrimary: json['is_primary']!,
      isRevoked: json['is_revoked']!,
      name: json['name'],
      expireDate: json['expire_date'],
      memberLimit: json['member_limit'],
      pendingJoinRequestCount: json['pending_join_request_count'],
    );
  }

  Map toJson() {
    return {
      'invite_link': inviteLink,
      'creator': creator,
      'creates_join_request': createsJoinRequest,
      'is_primary': isPrimary,
      'is_revoked': isRevoked,
      'name': name,
      'expire_date': expireDate,
      'member_limit': memberLimit,
      'pending_join_request_count': pendingJoinRequestCount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
