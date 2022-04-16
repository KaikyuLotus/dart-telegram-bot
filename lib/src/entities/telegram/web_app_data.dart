class WebAppData {
  String data;
  String buttonText;

  WebAppData(
    this.data,
    this.buttonText,
  );

  static WebAppData fromJson(Map<String, dynamic> json) {
    return WebAppData(
      json['data'],
      json['button_text'],
    );
  }

  Map toJson() {
    return {
      'data': data,
      'button_text': buttonText,
    };
  }
}
