class Voice {
  String fileId;
  String fileUniqueId;
  int duration;
  String mimeType;
  int fileSize;

  Voice({this.fileId, this.fileUniqueId, this.duration, this.mimeType, this.fileSize});

  factory Voice.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Voice(
        fileId: json['file_id'],
        fileUniqueId: json['file_unique_id'],
        duration: json['duration'],
        mimeType: json['mime_type'],
        fileSize: json['file_size']);
  }
}
