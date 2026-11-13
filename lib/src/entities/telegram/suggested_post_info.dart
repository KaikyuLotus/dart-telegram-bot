import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Contains information about a suggested post.
class SuggestedPostInfo {
  /// State of the suggested post.
  ///
  /// Currently, it can be one of "pending", "approved", "declined".
  String state;

  /// Optional.
  /// Proposed price of the post. If the field is omitted, then the post is
  /// unpaid.
  SuggestedPostPrice? price;

  /// Optional.
  /// Proposed send date of the post. If the field is omitted, then the post
  /// can be published at any time within 30 days at the sole discretion of the
  /// user or administrator who approves it.
  int? sendDate;

  /// Basic constructor
  SuggestedPostInfo({
    required this.state,
    this.price,
    this.sendDate,
  });

  /// Creates an object from a json
  factory SuggestedPostInfo.fromJson(Map<String, dynamic> json) {
    return SuggestedPostInfo(
      state: json['state'],
      price: callIfNotNull(SuggestedPostPrice.fromJson, json['price']),
      sendDate: json['send_date'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'price': price,
      'send_date': sendDate,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
