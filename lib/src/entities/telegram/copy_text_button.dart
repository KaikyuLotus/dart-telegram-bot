import 'dart:convert';

/// This object represents an inline keyboard button that copies specified text
/// to the clipboard.
class CopyTextButton {
  /// The text to be copied to the clipboard; 1-256 characters
  String text;

  /// Basic constructor
  CopyTextButton(this.text);

  /// Creates an object from a json
  factory CopyTextButton.fromJson(Map<String, dynamic> json) {
    return CopyTextButton(json['text']);
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }

  @override
  String toString() => json.encode(this);
}
