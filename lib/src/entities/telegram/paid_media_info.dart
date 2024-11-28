import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes the paid media added to a message.
class PaidMediaInfo {
  /// The number of Telegram Stars that must be paid to buy access to the media
  int starCount;

  /// Information about the paid media
  List<PaidMedia> paidMedia;

  /// Basic constructor
  PaidMediaInfo({
    required this.starCount,
    required this.paidMedia,
  });

  /// Creates an object from a json
  factory PaidMediaInfo.fromJson(Map<String, dynamic> json) {
    return PaidMediaInfo(
      starCount: json['star_count'],
      paidMedia: PaidMedia.listFromJsonArray(json['paid_media']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'star_count': starCount,
      'paid_media': paidMedia,
    };
  }

  @override
  String toString() => json.encode(this);
}
