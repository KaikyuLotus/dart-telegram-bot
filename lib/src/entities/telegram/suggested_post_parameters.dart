import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Contains parameters of a post that is being suggested by the bot.
class SuggestedPostParameters {
  /// Optional.
  /// Proposed price for the post. If the field is omitted, then the post is
  /// unpaid.
  SuggestedPostPrice? price;

  /// Optional.
  /// Proposed send date of the post. If specified, then the date must be
  /// between 300 seconds and 2678400 seconds (30 days) in the future. If the
  /// field is omitted, then the post can be published at any time within 30
  /// days at the sole discretion of the user who approves it.
  int? sendDate;

  /// Basic constructor
  SuggestedPostParameters({
    this.price,
    this.sendDate,
  });

  /// Creates an object from a json
  factory SuggestedPostParameters.fromJson(Map<String, dynamic> json) {
    return SuggestedPostParameters(
      price: callIfNotNull(SuggestedPostPrice.fromJson, json['price']),
      sendDate: json['send_date'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'send_date': sendDate,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
