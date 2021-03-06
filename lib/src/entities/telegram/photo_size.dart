import 'dart:convert';

class PhotoSize {
  String fileId;
  String fileUniqueId;
  int height;
  int width;
  int? fileSize;

  PhotoSize({
    required this.fileId,
    required this.fileUniqueId,
    required this.height,
    required this.width,
    this.fileSize,
  });

  static PhotoSize fromJson(Map<String, dynamic> json) {
    return PhotoSize(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      height: json['height']!,
      width: json['width']!,
      fileSize: json['file_size'],
    );
  }

  static List<PhotoSize> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => PhotoSize.fromJson(json[i]));
  }

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
