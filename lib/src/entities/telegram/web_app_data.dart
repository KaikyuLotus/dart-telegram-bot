/// Describes data sent from a Web App to the bot.
class WebAppData {
  /// The data.
  /// Be aware that a bad client can send arbitrary data in this field.
  String data;

  /// Text of the web_app keyboard button from which the Web App was opened.
  /// Be aware that a bad client can send arbitrary data in this field.
  String buttonText;

  /// Basic constructor
  WebAppData(
    this.data,
    this.buttonText,
  );

  /// Creates an object from a json
  factory WebAppData.fromJson(Map<String, dynamic> json) {
    return WebAppData(
      json['data'],
      json['button_text'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'button_text': buttonText,
    };
  }
}
