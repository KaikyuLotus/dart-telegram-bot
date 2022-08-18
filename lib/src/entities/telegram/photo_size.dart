import 'dart:convert';

/// This object represents one size of a photo or a file / sticker thumbnail.
class PhotoSize {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots.
  /// Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Photo height
  int height;

  /// Photo width
  int width;

  /// Optional.
  /// File size in bytes
  int? fileSize;

  /// Basic constructor
  PhotoSize({
    required this.fileId,
    required this.fileUniqueId,
    required this.height,
    required this.width,
    this.fileSize,
  });

  /// Creates a object from a json
  static PhotoSize fromJson(Map<String, dynamic> json) {
    return PhotoSize(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      height: json['height']!,
      width: json['width']!,
      fileSize: json['file_size'],
    );
  }

  /// Creates a list of object from a json array
  static List<PhotoSize> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => PhotoSize.fromJson(json[i]));
  }

  /// Creates a list of list of object from a json array
  static List<List<PhotoSize>> listOfListsFromJsonArray(
    List<List<dynamic>> json,
  ) {
    return List.generate(
      json.length,
      (e) => List.generate(
        json[e].length,
        (i) => PhotoSize.fromJson(json[e][i]),
      ),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'height': height,
      'width': width,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
