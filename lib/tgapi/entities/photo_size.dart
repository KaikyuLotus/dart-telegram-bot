class PhotoSize {
  String fileId;
  int fileSize;
  String fileUniqueId;
  int height;
  int width;

  PhotoSize(
      {this.fileId, this.fileSize, this.fileUniqueId, this.height, this.width});

  factory PhotoSize.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PhotoSize(
      fileId: json['file_id'],
      fileSize: json['file_size'],
      fileUniqueId: json['file_unique_id'],
      height: json['height'],
      width: json['width'],
    );
  }

  static List<PhotoSize> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => PhotoSize.fromJson(json[i]));
  }
}
