import 'dart:convert';

import '../../../telegram_entities.dart';

/// The paid media to send is a photo.
class InputPaidMediaPhoto extends InputPaidMedia {
  /// Type of the media, must be photo
  @override
  String type = 'photo';

  /// File to send.
  ///
  /// Pass a file_id to send a file that exists on the Telegram servers
  /// (recommended), pass an HTTP URL for Telegram to get a file from the
  /// Internet, or pass “attach://<file_attach_name>” to upload a new one using
  /// multipart/form-data under <file_attach_name> name.
  ///
  /// [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
  @override
  String media;

  /// Basic constructor
  InputPaidMediaPhoto({
    required this.media,
  });

  /// Creates a object from a json
  factory InputPaidMediaPhoto.fromJson(Map<String, dynamic> json) {
    return InputPaidMediaPhoto(
      media: json['media'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'media': media,
    };
  }

  @override
  String toString() => json.encode(this);
}
