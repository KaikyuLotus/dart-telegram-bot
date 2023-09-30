import 'dart:convert';

/// This object represents a service message about a user allowing a bot
/// to write messages after adding the bot to the attachment menu or
/// launching a Web App from a link.
class WriteAccessAllowed {
  /// Optional.
  /// True, if the access was granted after the user accepted an explicit
  /// request from a Web App sent by the method requestWriteAccess
  bool? fromRequest;

  /// Optional.
  /// Name of the Web App which was launched from a link
  String? webAppName;

  /// Optional.
  /// True, if the access was granted when the bot was added to the
  /// attachment or side menu
  bool? fromAttachmentMenu;

  /// Basic constructor
  WriteAccessAllowed({
    this.fromRequest,
    this.webAppName,
    this.fromAttachmentMenu,
  });

  /// Creates a object from a json
  static WriteAccessAllowed fromJson(Map<String, dynamic> json) {
    return WriteAccessAllowed(
      fromRequest: json['from_request'],
      webAppName: json['web_app_name'],
      fromAttachmentMenu: json['from_attachment_menu'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'from_request': fromRequest,
      'web_app_name': webAppName,
      'from_attachment_menu': fromAttachmentMenu,
    };
  }

  @override
  String toString() => json.encode(this);
}
