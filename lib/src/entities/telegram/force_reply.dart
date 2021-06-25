import 'dart:convert';

import '../../../telegram_entities.dart';

class ForceReply extends ReplyMarkup {
  bool forceReply = true;
  String? inputFieldPlaceholder;
  bool? selective;

  ForceReply({
    this.forceReply = true,
    this.inputFieldPlaceholder,
    this.selective,
  });

  static ForceReply fromJson(Map<String, dynamic> json) {
    return ForceReply(
      forceReply: json['force_reply'],
      inputFieldPlaceholder: json['input_field_placeholder'],
      selective: json['selective'],
    );
  }

  Map toJson() {
    return {
      'force_reply': forceReply,
      'input_field_placeholder': inputFieldPlaceholder,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
