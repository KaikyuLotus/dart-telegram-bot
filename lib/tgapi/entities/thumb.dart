class Thumb {
  String fileId;
  int fileSize;
  String fileUniqueId;
  int height;
  int width;

  Thumb({this.fileId, this.fileSize, this.fileUniqueId, this.height, this.width});

  factory Thumb.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Thumb(
      fileId: json['file_id'],
      fileSize: json['file_size'],
      fileUniqueId: json['file_unique_id'],
      height: json['height'],
      width: json['width'],
    );
  }
}
