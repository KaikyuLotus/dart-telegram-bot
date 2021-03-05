class LoginUrl {
  String url;
  String? forwardText;
  String? botUsername;
  bool? requestWriteAccess;

  LoginUrl({
    required this.url,
    this.forwardText,
    this.botUsername,
    this.requestWriteAccess,
  });

  static LoginUrl fromJson(Map<String, dynamic> json) {
    return LoginUrl(
      url: json['url']!,
      forwardText: json['forward_text'],
      botUsername: json['bot_username'],
      requestWriteAccess: json['request_write_access'],
    );
  }
}
