import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object contains information about a paid media purchase.
class PaidMediaPurchased {
  /// User who purchased the media
  User from;

  /// Bot-specified paid media payload
  String paidMediaPayload;

  /// Basic constructor
  PaidMediaPurchased({
    required this.from,
    required this.paidMediaPayload,
  });

  /// Creates an object from a json
  factory PaidMediaPurchased.fromJson(Map<String, dynamic> json) {
    return PaidMediaPurchased(
      from: User.fromJson(json['from']),
      paidMediaPayload: json['paid_media_payload'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'from': from,
      'paid_media_payload': paidMediaPayload,
    };
  }

  @override
  String toString() => json.encode(this);
}
