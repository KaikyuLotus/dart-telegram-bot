class LoginUrl {
  String url;
  String forwardText;
  String botUsername;
  bool requestWriteAccess;

  LoginUrl({
    this.url,
    this.forwardText,
    this.botUsername,
    this.requestWriteAccess,
  });

  factory LoginUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return LoginUrl(
      url: json['url'],
      forwardText: json['forward_text'],
      botUsername: json['bot_username'],
      requestWriteAccess: json['request_write_access'],
    );
  }
}
