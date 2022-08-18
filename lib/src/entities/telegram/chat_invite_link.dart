import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents an invite link for a chat.
class ChatInviteLink {
  /// The invite link.
  /// If the link was created by another chat administrator, then the second
  /// part of the link will be replaced with “…”.
  String inviteLink;

  /// Creator of the link
  User creator;

  /// True, if users joining the chat via the link need to be approved by chat
  /// administrators
  bool createsJoinRequest;

  ///True, if the link is primary
  bool isPrimary;

  ///True, if the link is revoked
  bool isRevoked;

  ///Optional.
  ///Invite link name
  String? name;

  /// Optional.
  /// Point in time (Unix timestamp) when the link will expire or has been
  /// expired
  int? expireDate;

  /// Optional.
  /// The maximum number of users that can be members of the chat simultaneously
  /// after joining the chat via this invite link; 1-99999
  int? memberLimit;

  /// Optional.
  /// Number of pending join requests created using this link
  int? pendingJoinRequestCount;

  /// Basic constructor
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

  /// Creates a object from a json
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

  /// Creates a json from the object
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
