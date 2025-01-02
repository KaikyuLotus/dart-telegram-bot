import 'dart:convert';

import '../../../telegram_entities.dart';

/// The paid media isn't available before the payment.
class PaidMediaPreview extends PaidMedia {
  /// Type of the paid media, always “preview”
  @override
  String type = 'preview';

  /// Media width as defined by the sender
  int? width;

  /// Media height as defined by the sender
  int? height;

  /// Duration of the media in seconds as defined by the sender
  int? duration;

  /// Basic constructor
  PaidMediaPreview({
    this.width,
    this.height,
    this.duration,
  });

  /// Creates an object from a json
  factory PaidMediaPreview.fromJson(Map<String, dynamic> json) {
    return PaidMediaPreview(
      width: json['width'],
      height: json['height'],
      duration: json['duration'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'width': width,
      'height': height,
      'duration': duration,
    };
  }

  @override
  String toString() => json.encode(this);
}
