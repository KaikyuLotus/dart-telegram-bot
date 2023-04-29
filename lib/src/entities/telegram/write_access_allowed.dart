import 'dart:convert';

/// This object represents a service message about a user allowing a bot
/// to write messages after adding the bot to the attachment menu or
/// launching a Web App from a link.
class WriteAccessAllowed {
  /// Optional.
  /// Name of the Web App which was launched from a link
  String? webAppName;

  /// Basic constructor
  WriteAccessAllowed({
    this.webAppName,
  });

  /// Creates a object from a json
  static WriteAccessAllowed fromJson(Map<String, dynamic> json) {
    return WriteAccessAllowed(
      webAppName: json['web_app_name'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'web_app_name': webAppName,
    };
  }

  @override
  String toString() => json.encode(this);
}
