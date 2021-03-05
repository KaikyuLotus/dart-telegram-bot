class Voice {
  String fileId;
  String fileUniqueId;
  int duration;
  String? mimeType;
  int? fileSize;

  Voice({
    required this.fileId,
    required this.fileUniqueId,
    required this.duration,
    this.mimeType,
    this.fileSize,
  });

  static Voice fromJson(Map<String, dynamic> json) {
    return Voice(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      duration: json['duration']!,
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
    );
  }
}
