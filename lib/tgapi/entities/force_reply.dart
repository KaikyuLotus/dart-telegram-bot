class ForceReply {
  bool forceReply;
  bool selective;

  ForceReply({this.forceReply, this.selective});

  factory ForceReply.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ForceReply(forceReply: json['force_reply'], selective: json['selective']);
  }
}
