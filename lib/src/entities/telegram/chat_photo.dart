import 'dart:convert';

/// This object represents a chat photo.
class ChatPhoto {
  /// File identifier of small (160x160) chat photo.
  /// This file_id can be used only for photo download and only for as long as
  /// the photo is not changed.
  String smallFileId;

  /// Unique file identifier of small (160x160) chat photo, which is supposed
  /// to be the same over time and for different bots. Can't be used to download
  /// or reuse the file.
  String smallFileUniqueId;

  /// File identifier of big (640x640) chat photo.
  /// This file_id can be used only for photo download and only for as long as
  /// the photo is not changed.
  String bigFileId;

  /// Unique file identifier of big (640x640) chat photo, which is supposed to
  /// be the same over time and for different bots.
  /// Can't be used to download or reuse the file.
  String bigFileUniqueId;

  /// Basic constructor
  ChatPhoto({
    required this.smallFileId,
    required this.smallFileUniqueId,
    required this.bigFileId,
    required this.bigFileUniqueId,
  });

  /// Creates a object from a json
  static ChatPhoto fromJson(Map<String, dynamic> json) {
    return ChatPhoto(
      smallFileId: json['small_file_id']!,
      smallFileUniqueId: json['small_file_unique_id']!,
      bigFileId: json['big_file_id']!,
      bigFileUniqueId: json['big_file_unique_id']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'small_file_id': smallFileId,
      'small_file_unique_id': smallFileUniqueId,
      'big_file_id': bigFileId,
      'big_file_unique_id': bigFileUniqueId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
