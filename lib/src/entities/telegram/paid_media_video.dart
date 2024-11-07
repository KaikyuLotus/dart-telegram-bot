import 'dart:convert';

import '../../../telegram_entities.dart';

/// The paid media is a video.
class PaidMediaVideo extends PaidMedia {
  /// The paid media is a video.
  @override
  String type = 'video';

  /// The video
  Video video;

  /// Basic constructor
  PaidMediaVideo({
    required this.video,
  });

  /// Creates a object from a json
  factory PaidMediaVideo.fromJson(Map<String, dynamic> json) {
    return PaidMediaVideo(
      video: Video.fromJson(json['video']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'video': video,
    };
  }

  @override
  String toString() => json.encode(this);
}
