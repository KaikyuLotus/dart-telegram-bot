import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Contains information about the start page settings of a
/// Telegram Business account.
class BusinessIntro {
  /// Title text of the business intro
  String? title;

  /// Message text of the business intro
  String? message;

  /// Sticker of the business intro
  Sticker? sticker;

  /// Basic constructor
  BusinessIntro({
    this.title,
    this.message,
    this.sticker,
  });

  /// Creates a object from a json
  factory BusinessIntro.fromJson(Map<String, dynamic> json) {
    return BusinessIntro(
      title: json['title'],
      message: json['message'],
      sticker: callIfNotNull(Sticker.fromJson, json['sticker']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'title': title,
      'message': message,
      'sticker': sticker,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
