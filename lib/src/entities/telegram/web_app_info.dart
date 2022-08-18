/// Describes a Web App.
class WebAppInfo {
  /// An HTTPS URL of a Web App to be opened with additional data as specified
  /// in Initializing Web Apps
  String url;

  /// Basic constructor
  WebAppInfo(this.url);

  /// Creates a object from a json
  static WebAppInfo fromJson(Map<String, dynamic> json) {
    return WebAppInfo(json['url']);
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'url': url,
    };
  }
}
