class WebAppInfo {
  String url;

  WebAppInfo(this.url);

  static WebAppInfo fromJson(Map<String, dynamic> json) {
    return WebAppInfo(json['url']);
  }

  Map toJson() {
    return {
      'url': url,
    };
  }
}
